redux
===

## 安装

npm install --save redux
npm install --save react-redux
npm install --save-dev redux-devtools

## 概念
### ACTION
export const ADD_TODO = 'ADD_TODO';
export function addTodo(text) {
  return { type: ADD_TODO, text }
}

## REDUCERS

## STORE

创建一个单一的store
let store = createStore(reducers)// 可为空，reducers代表默认数据

发起action
store.dispatch(addTodo('Learn about actions'))// 参数为action

注册监听器
let unsubscribe = store.subscribe(() =>
  console.log(store.getState())
)

注销监听器
unsubscribe()

## 数据流
- store.dispatch(action);
- store 调用reducer来更新state
- 执行注册的subscribe
- redux调用接口更新state

## 搭配react使用
- 安装redux-react
- 使用createStore创建state
    let store = createStore(todoApp)
- 使用Provider包装来，保证所有容器组件可以访问store
    render(
          <Provider store={store}>
            <App />
          </Provider>,
      rootElement
    )
- 使用connect创建容器组件,直接将state对应的属性绑定到props中，以及
- 
    function select(state) {
      return {
        visibleTodos: selectTodos(state.todos, state.visibilityFilter),
        visibilityFilter: state.visibilityFilter
      }
    }

    // 包装 component ，注入 dispatch 和 state 到其默认的 connect(select)(App) 中；
    export default connect(select)(App)

## 搭配router

安装react-router

    npm install --save react-router

配置webpackdevserver

    devServer: {
      historyApiFallback: true,
    }

配置root

    import React, { PropTypes } from 'react';
    import { Provider } from 'react-redux';
    import { Router, Route, browserHistory } from 'react-router';
    import App from './App';

    const Root = ({ store }) => (
      <Provider store={store}>
        <Router history={browserHistory}>
          <Route path="/(:filter)" component={App} />
        </Router>
      </Provider>
    );

    Root.propTypes = {
      store: PropTypes.object.isRequired,
    };

    export default Root;

## redux源码分析
重点分析如下几个方面:

- createStore
- store
- Provider
- connect
- store.dispatch
- store.subscribe
- 中间见机制

### 构建
redux使用webpack来进行构建，构建十分渐大
### redux
redux的代码非常简单，index文件只是一个提供对外的接口,我们可以看到分别export了如下api:

- createStore,
- combineReducers,
- bindActionCreators,
- applyMiddleware,
- compose
下面我们一一来分析下

### createStore
createStore是一个函数，用来返回一个维护state tree的store
有三个参数:
- reducer: 一个函数next state的函数
- preloadedState: 预加载的state,一般用来服务端渲染以及需要restore某一个序列化的用户sesssion
- enhancer: create 增强，如何使用？

createStore返回的store主要提供如下api:
- getState 函数里面缓存的currentState
- subscribe 实现的比较简单的事件监听机制，每次将listeners 存入nextListeners,ensureCanMutateNextListeners? 为何每次都生产一个新的数组?
- replaceReducer 替换reducer,并dispatch一个reducer初始化的action,何时用到？动态加载reducer,比如代码分割以及热加载
- observable ??
- dispatch 派发action,这里的实现也比较简单，首先先判断是否正在dispatch,如果正在派发，则抛出错误。（这里有点疑问，既然是js线程模型，应该不太可能某一个action没派发完，又继续派发一个，即是是异步的代码，finally里面的代码也是能同步执行的）
  + currentState = currentReducer(currentState, action)
    调用当前的currentReducer执行，然后更改state,这里有一点可以看到，创建store时候，
    dispatch({ type: ActionTypes.INIT })，这里会初始化state
    * 

总结：store的作用，就是保存 reducer以及state的维护，另外负责派发action，以及为了动态加载reducer提供了replace方法

### combineReducers
顾名思义，合并reducers的作用，从代码可以看到combineReducers是一个高阶函数，返回一个统一的reducer函数，下面一步步来分析

- 将reducers,copy一份到finalReducers中，为何？
- 对reducers中的reducer遍历校验assertReducerSanity,大致就是校验所有的reducer传入undefined,不应该返回undefined,应该自动初始化
  + reducer(undefined, { type: ActionTypes.INIT })，传入underfined,判断返回的state不应该是state
  + 传入undefined,以及一个随机的type,来判断返回的state不应该是undefined,
- 返回combination函数，函数第一个参数是state,第二个参数是action,这里跟store中dispatch里面的reducer一致
  + combination内部，逐个遍历reducer并执行，这里有一点要注意，缓存了一个变量hasChanged，判断state是否改变，如果没有改变则返回旧的state, 如何判断是否改变呢，就是简单的判断nextStateForKey !== previousStateForKey,引用判断，所以这里就要求，如果你的reducer改变了state则必须返回一个新的state，否则store的state是不会更新的

### bindActionCreators
参数：actionCreators，dispatch
其用途就是将actionCreatros中的actionCreator，包装一下，将其creator产生的action自动dispatch,actionCreators即可以是key-function 也可以是单个的函数

 (...args) => dispatch(actionCreator(...args))

有何好处呢？ 建设重复的代码

### compose
组合函数，将多个函数组合成嵌套调用的函数，原理就是实用Array.reduce

 compose(f, g, h) >* (...args) => f(g(h(...args))).

### applyMiddleware
这个函数也就是store中间件的核心了
首先，看下中间件的用法:

  let createStoreWithMiddleware = applyMiddleware(
    logger,
    crashReporter
  )(createStore);

  // Use it like you would use createStore()let todoApp = combineReducers(reducers);
  let store = createStoreWithMiddleware(todoApp);

通过一系列的中间件，创建一个middle函数，函数传入createStore并执行，则返回wareCreatStore函数，然后就可以用来真正的创建中间件了
下面来看看其实现过程：
- applyMiddleware其实是一个三层的高阶函数,其主要逻辑都在最底层的函数内部,这种多层的高阶函数，其实是一种设计多层api的非常好的方式，我们在angular的module的实现里面也可以看到这种写法

  function(...midles){
    return function(createStore){
      return function(reducer,reloadState,enhancer){
        ....
      }
    }
  }
从上么可以看到用法,var store = applyMiddleware(middle1,md3)(createStore)(reducer)
- 内部箭头函数
  + 首先调用createStore创建一个初试的store,
  + 将store的 getState,dispatch,封装成一个api对象，
  + 将middle ＝> middle(api);
  + compose(..chain)(dispatch) 

从这里可以看到middle也是三层层的高阶函数,最后面的中间件最先执行

  function middle({getState,dispatch}){
    ..do something
    return function(dispatch){
      return enhancerDispatch;
    }
  }
我们拿一个中间件来分析下:
function({ dispatch, getState }) {
  return function(nextDispatch){
      return function(action){
        if (typeof action === 'function') {
          return action(dispatch, getState, extraArgument);
        }
        return nextDispatch(action);
      }
    }
  }

从这里可以看到，middle能获取到state,但是对store最终的改变在于dipatch方法，中间件的本质，其实就是dispatch的中间件

### redux总结
从上么的分析可以看出，redux提供了一个单项的数据流:
store-action-dispatch-reducer,
另外提供了middleWare以提供扩展
但是，这里存在一个问题呢，store中的state如何与react中的state关联? 那么下面我们再来分析下react-redux

## react-redux
react-redux主要提供下面三个相关的接口:
- Provider 顶层组件
- connectAdvanced, 
- connect
下面来一一分析

### Provider
Provider比较简单，就是一个带store属性的react组件，


