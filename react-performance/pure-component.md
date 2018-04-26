react性能优化

---


## PureComponent

PureComponet是 react的一级api，我们才从源码来看，pure component通过代理继承的方式来继承component,与component的最主要区别就是`pureComponentPrototype.isPureReactComponent`, 下面我们来看看哪个地方使用到isPureReactComponent属性

```javascript

import {Component, PureComponent, AsyncComponent} from './ReactBaseClasses';

function PureComponent(props, context, updater) {
  // Duplicated from Component.
  this.props = props;
  this.context = context;
  this.refs = emptyObject;
  // We initialize the default updater but the real one gets injected by the
  // renderer.
  this.updater = updater || ReactNoopUpdateQueue;
}

function ComponentDummy() {}
ComponentDummy.prototype = Component.prototype;
var pureComponentPrototype = (PureComponent.prototype = new ComponentDummy());
pureComponentPrototype.constructor = PureComponent;
// Avoid an extra prototype jump for these methods.
Object.assign(pureComponentPrototype, Component.prototype);
pureComponentPrototype.isPureReactComponent = true;
```

## shallow

在这个文件的ReactFiberClassComponent.js checkShouldComponentUpdate方法中看到对pure参数的使用

```javascript
function checkShouldComponentUpdate() {
    if (typeof instance.shouldComponentUpdate === 'function') {
      const shouldUpdate = instance.shouldComponentUpdate(
        newProps,
        newState,
        newContext,
      );
      return shouldUpdate;
    }

    if (type.prototype && type.prototype.isPureReactComponent) {
      return (
        !shallowEqual(oldProps, newProps) || !shallowEqual(oldState, newState)
      );
    }

    return true;
}
```

省略其他代码，我们看看他的处理逻辑：

- 如果组件有shouldComponentUpdate函数，则调用函数返回结果
- 如果组件是pure组件，潜比较props 以及state的结果，只要有其中一个notEqual则返回true

> 注意：这里可以看到function component与普通的component 一样，在render函数的执行上并没有太多的优化

下面再来看看shallowEqual

```
function shallowEqual(objA, objB) {
  if (is(objA, objB)) {
    return true;
  }

  if (typeof objA !== 'object' || objA === null || typeof objB !== 'object' || objB === null) {
    return false;
  }

  var keysA = Object.keys(objA);
  var keysB = Object.keys(objB);

  if (keysA.length !== keysB.length) {
    return false;
  }

  // Test for A's keys different from B.
  for (var i = 0; i < keysA.length; i++) {
    if (!hasOwnProperty.call(objB, keysA[i]) || !is(objA[keysA[i]], objB[keysA[i]])) {
      return false;
    }
  }

  return true;
}

```

- 如果新旧对象恒等，则返回true
- 如果两个对象的第一级子属性不恒等，则返回true

这里所谓的恒等，其实是Object.is来判断

由上面可以得出结论，以下两种情况不会重新渲染：

－ 如果新旧props以及state 都是同一个对象，则不会执行render
－ 如果新旧props以及state 浅比较都一致，则不会执行render

> 需要注意： PureComponent 只是减少render函数的执行，render函数的执行跟dom是否重新重新渲染是两回事

下面以https://github.com/wulv/fe-example/tree/master/react-table为例，来说明下：

### 使用Component/Function Component

无论add/delete/update,都会导致 app, table, 所有的tr执行render函数,

为何？ 因为这几个操作都会调用state函数，导致从上倒下所有的组件都会执行render, 因为所有的组件都是componet, 父组件的render会导致所有的组件都执行render

### 使用PureComponent

我们尝试把component，全部改成purecomponent，但是我们发现点击add/delete并没有任何反应, 为何？

看看add/delete方法

```javascript
add = () => {
    const  { data } = this.state;
    data.push(dataGenerate())
    this.setState({
      data
    })
  }

  delete = () => {
    const  { data } = this.state;
    data.pop()
    this.setState({
      data
    })
  }

```

可以看到setState({ data }), 按照浅比较的原则 shouldUpdate 为false， 故所有组件都不会重新执行render

但是为何update操作可以？我们再看看代码

```javascript
onChange = (item_id, sold_num) => {
    const  { data } = this.state;
    this.setState({
      data: data.map(i => {
        if(i.item_id === item_id) {
          i.sold_num = sold_num * 2;
        }
        return i;
      })
    })
  }
```

可以看到 data.map其实返回了一个新的对象

为何只渲染了一次tr？ 因为已有的tr组件使用purecomponet, 发现state时一致的故没有执行render

## 疑问

shouldUpdate 在整个周期里面起什么作用？ shouldUpdate为true之后, 何时出发render的执行？







