# react-component

> src/isomorphic/modern/class/ReactComponent.js

---

ReactComponet 通过构造函数以及prototype来实现的class

目前只看到构造函数以及setState, forceUpdate函数，生命周期函数在何时注入？updater在何时注入？

**构造函数**

function ReactComponent(props, context, updater) {
  this.props = props;
  this.context = context;
  this.refs = emptyObject;
  // We initialize the default updater but the real one gets injected by the
  // renderer.
  this.updater = updater || ReactNoopUpdateQueue;
}


**setState**

第一个参数即可以是object 也可以是function, 
setState(partialState, callback)

update: function(preState, props)

如何用updater函数？

应该是 setState方法在异步的环境里执行(比如setTimeout),以及需要依赖前置state的情况下


```
 this.updater.enqueueSetState(this, partialState);
  if (callback) {
    this.updater.enqueueCallback(this, callback, 'setState');
  }
```

**forceUpdate**

本质上来说，都是调用updater来实现

```
function(callback) {
  this.updater.enqueueForceUpdate(this);
  if (callback) {
    this.updater.enqueueCallback(this, callback, 'forceUpdate');
  }
}
```

## pureComponet

与React.component类似，只是prototype 为一个空的函数。。并没有包含任何原型方法

> 强制动作， 可用force单词 

## 生命周期

## updater

这里设计到updater三个方法：

enqueueSetState
enqueueForceUpdate
enqueueCallback

