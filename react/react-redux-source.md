react-redux-source

---

## react-redux
react-redux主要提供下面三个相关的接口:
- Provider 顶层组件
- connectAdvanced, 
- connect
下面来一一分析

### Provider
Provider比较简单，就是一个带store属性的react组件，

Provider实现其实非常简单，主要通过`ChildContext`的机制来保存`store`属性，方便所有的子组件获取`store`属性

storeSubscription 做什么用的？

写法特点：

命名: didWarnAboutReceivingStore， react貌似比较喜欢使用do,did等命名，如果是我们自己写习惯用has/is，而这里确实用did更合适，代表是否已经做了某些事

Provider本身是一个class，我们可以看到，即使是class, 我们也可以通过在原型上定义方法来动态的给class添加某一类属性
```
if (process.env.NODE_ENV !== 'production') {
  Provider.prototype.componentWillReceiveProps = function (nextProps) {
    const { store } = this
    const { store: nextStore } = nextProps

    if (store !== nextStore) {
      warnAboutReceivingStore()
    }
  }
}
```

### connect

基本用法

```
connect(mapStateToProps, mapDispatchToProps, mergeProps, options)
```

**mapStateToProps**

mapStateToProps(state, [ownProps]): stateProps

第一个参数其实就是store, 如果只穿入一个参数，那么这个函数只会在store改变的时候调用

第二个参数是ownProps, 如果穿入了这个参数，除了在store改变的时候在connect生成的组件有属性改变的时候也会调用(浅对比)

可以返回plain，被merge到props上
也可以返回null或者undefined, 这样就不会订阅store更新，部分未使用store数据的界面 可以利用这个优化性能
mapStateToProps函数本身也可以返回一个新的函数，这样新的函数即等于新的mapStateToProps函数
这样做的好处，从文档来看是记忆一些数据，暂时没有合适的利用场景


**mapDispatchToProps**

如果传入一个对象，则会被包装并穿入dispatch,并merge到props
如果返回一个函数，

如果穿入一个函数，这个是最常用的模式 （如果穿入2个参数，则会在组件属性改变的时候，重新执行）
如果没有穿入任何东西，则会有一个默认的map实现，并将dispatch 注入你的组件中

**mergeProps**
mergeProps(stateProps, dispatchProps, ownProps): props
这个函数，主要是用来merge上面两个函数的结果，返回一个新的对象

**options**

options 用来自定义更多功能的connector

- pure, 默认为true, 如果为true,那么在state/props相同的情况下，会避免re-render以及执行mapState,mapDispatch方法, 不为true有什么区别？ 后面一句，假设是纯函数组件。。
- areStatesEqual , 默认 ===
- areOwnPropsEqual, 默认浅比较
- areStatePropsEqual, 默认浅比较
- areMergedPropsEqua, 默认浅比较
- storeKey 支持多store的场景

> 可借鉴的命名, 命名 判断是否相等的函数, are前缀, areStatesEquail


### createProvider

提供接口创建自定义的provider ,主要是支持多store


### 源码分析

connect结构

```
export function createConnect() {
    

    return function connect() {
        
        const initMapStateToProps = match(mapStateToProps, mapStateToPropsFactories, 'mapStateToProps')
        const initMapDispatchToProps = match(mapDispatchToProps, mapDispatchToPropsFactories, 'mapDispatchToProps')
        const initMergeProps = match(mergeProps, mergePropsFactories, 'mergeProps')

        return connectHOC(defaultSelectorFactory, {
            getDisplayName: name => `Connect(${name})`,
            initMapStateToProps,
            initMapDispatchToProps,
            initMergeProps,
            pure
        })
    }
}

export default createConnect();
```

这种设计非常灵活，通过warp一层函数，利用参数的默认值，来实现不同的行为，非常灵活，可以借鉴

从上面代码可以看出，核心主要是3个部分 connectHoc, defaultSelectorFactory, match..

**connectAdvanced**

本质来讲，connect 就是监听 store change,并且执行selector,得到新的prop,并包装wrapComponent, 对比两次props，对果发现props不一样，则执行react update。


什么时候监听store变化？ componentDidMount
什么时候执行selector? componentDidMount以及componentWillReceiveProps

如果觉得组件是否重新渲染？ 两次run得到的新的props 对比是否 ===

这里有个疑问：mapStateToProps 不是每次都生成新的对象么？
这里应该是connect控制了，如果监听的state props没有改变，应该不会执行mapStateProps,所以 connect pure 可以适当的优化性能

> 写法上的特点，命名以try开头，可借鉴trySubscribe, 假设我的逻辑是要 doSomthing, 但是某些情况下 如果已经do了，就可能不需要再do,这样情况下，就可以用try 前缀，tryDoSomthing..而不用doSomething来命名
> 

connect()..本质就是一个 selectorFactory, 下一步我们来分析这个selectorFactory

基本用法:

```
export default connectAdvanced((dispatch, options) => (state, props) => ({
thing: state.things[props.thingId],
saveThing: fields => dispatch(actionCreators.saveThing(props.thingId, fields)),
}))(YourComponent)

```

```
function connectAdvanced(selectorFactory, options) {
    
    // 处理contextTypes
    const contextTypes = {
    }
    const childContextTypes = {
    }

    return function wrapWithConnect() {
        
        class Connect extends Component {
            constructor() {
                this.state = {}
                this.renderCount = 0
                this.store = this.props[storeKey]
                this.getState = this.store.getState.bind(this.store);
                // 初始化selector
                this.initSelector();
                // 初始化监听器
                this.initSubscription();
            }
            
            // 执行一次run
            componentWillReceiveProps() {this.selector.run(nextProps)}
            
            //
            componentDidMount() {
                // 开始监听store 变化
                this.subscription.trySubscribe()
                // 立即run selector,
                this.selector.run(this.props)
                // 如果数据有变化，则立即更新
            }

            initSelector() {
                // 执行factory,获取原始的selector, 初始化时既会执行一次
                const sourceSelector = selectorFactory(dispatch, selectorFactoryOptions);
                
                // 将selector 包装成一个对象，以方便跟踪每次执行的结果
                const selector = this.selector = {
                    shouldComponentUpdate: true,
                    props: sourceSelector(getState(), this.props),
                    run: function runComponentSelector(props) {
                        const nextProps = sourceSelector(getState(), props)

                        if (selector.error || nextProps !== selector.props) {
                            selector.shouldComponentUpdate = true
                            selector.props = nextProps
                            selector.error = null
                        }
                    }
                }
            }

            initSubscription() {
                if(shouldHandleStateChanges) {
                    // 创建Subscription对象
                    this.subscription = new Subscription(this.store, this.parentSub)
                    // onStateChange 本质上，store.scribe(this.onStateChange);
                    subscription.onStateChange = function onStateChange() {
                        // 执行selector
                        this.selector.run(this.props)
                        
                        //区别？ 判断shouldComponentUpdate，如果false，通知nested, 否则
                        if (!this.selector.shouldComponentUpdate) {
                          subscription.notifyNestedSubs()
                        } else {
                          this.componentDidUpdate = function componentDidUpdate() {
                            this.componentDidUpdate = undefined
                            subscription.notifyNestedSubs()
                        }

                        this.setState(dummyState)
                    }
            }

            render() {
                return createElement(WrappedComponent, this.selector.props)
            }



        }

        // 处理connect的静态属性
        
        //copy 静态属性
        return hoistStatics(Connect, WrappedComponent);

    }



}
```


**defaultSelectorFactory**

```

function finalPropsSelectorFactory(dispatch, {
    ...
    ...options
}) {
  // 获取初始化的props 
  const mapStateToProps = initMapStateToProps(dispatch, options)
  const mapDispatchToProps = initMapDispatchToProps(dispatch, options)
  const mergeProps = initMergeProps(dispatch, options)

    const selectorFactory = options.pure
    ? pureFinalPropsSelectorFactory
    : impureFinalPropsSelectorFactory
  // 根据pure,决定使用哪个selector
  return selectorFactory(
    mapStateToProps,
    mapDispatchToProps,
    mergeProps,
    dispatch,
    options
  )

}
```

**pureFinalPropsSelectorFactory**

判断如果是第一次执行，则调用 handleFirstCall(...);
firstcall处理逻辑很简单，调用mapState,mapDispatch,mergeProps, 缓冲第一次的state以及props

如果不是第一次执行，则调用handleSubsequentCalls(...);

判断props以及state是否改变

如果 porps以及state都改变，则走
handleNewPropsAndNewState {
    执行mapStateToProps,
    如果mapDispatch以来ownProps,则也只想mapDispatch
    最后mergeProps
}
如果只是props改变，则走
handleNewProps {
    如果mapState以来ownProps,则也只想mapState
    如果mapDispatch以来ownProps,则也只想mapDispatch
    最后mergeProps
}

如果只是state改变则走，handleNewState
如果都没改变，则返回mergedProps {
    执行mapStateToProps
    判断statePropsEqual是否改变，
    如果改变则执行merge
}

> 这里是典型的条件分支代码的场景，可以参考这里的代码，分别使用不同的函数来包括起来，虽然有冗余代码，但是更容易理解

**impureFinalPropsSelectorFactory**
这个逻辑就非常简单了,与pure的差别就是，不会做性能优化，每次都执行mapState,mapDispatch,mergeProps


### 技巧

命名：
- 函数不一定要全部遵循动词开头吧，高阶函数，可以破例  xxxFactory
- 布尔变了也不一定要有助词开头，可参考 propsChanged, stateChanged
- 当前缓冲的数据，变量命名不一定非要cur开头，可以直接用类似 state, 只要能区分，nextState, firstState即可

高阶函数的使用:

function createConnect({
    xx = defaultXXX
    yyy = defaultYYY
}) {
    

    return function() {
        ...
    }
}

return createConnect();

这种方式非常灵活，而且也很简洁，这里是用来处理默认参数

connectHOC(selectorFactory, {...}) {}

function finalFactory() {
    
    funciton pureSelectorFactory() {

        return function realSelector() {

        }
    }

    return selectorFactory(
    ...
    )
}

这里为何finalFactory 需要这么多层嵌套？

为了合理的分阶处理逻辑

如果是安卓正常逻辑应该怎么写..

function fianlPropsSelectorFactory(dispatch, {
    init...
}) {
    const mapStateProps = ..
    const mapDispatchToProps = ...
    const mergeProps = initMergeProps(..)

    if(pure) {
        
        cosnt hasRunAitLeastOnce = false;
        const state,
        const ownProps;

        return function() {

            if(isPure) {
                ...
                return mergedProps;
            }
            
            if(hasRunAitLeastOnce) {

                if(propsChanged) {

                }

                if(stateChanged) {

                }

                if(propsChanged) {

                }
                return mergedProps
            }
        }
    }
}

这里其实是一个典型的，多层判断语句的良好实现方式，
根据不同的语意，分别拆成不同的函数，分别处理不同的情况，更好理解





