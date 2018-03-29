react-dom

---

初始化代码:

```
ReactDOMInjection.inject();
ReactDOMStackInjection.inject();
```

**ReactDOMStackInjection主要注入的类如下:

```
ReactGenericBatching.injection.injectStackBatchedUpdates(
    ReactUpdates.batchedUpdates
  );

ReactHostComponent.injection.injectGenericComponentClass(
ReactDOMComponent
);

ReactHostComponent.injection.injectTextComponentClass(
ReactDOMTextComponent
);

ReactEmptyComponent.injection.injectEmptyComponentFactory(
function(instantiate) {
  return new ReactDOMEmptyComponent(instantiate);
}
);

ReactUpdates.injection.injectReconcileTransaction(
ReactReconcileTransaction
);
ReactUpdates.injection.injectBatchingStrategy(
ReactDefaultBatchingStrategy
);

ReactComponentEnvironment.injection.injectEnvironment(ReactComponentBrowserEnvironment);
```

**ReactDefaultBatchingStrategy**

本质上是一个简单对象

```
{
  isBatchingUpdates: false,

  batchedUpdates: function (callback, a, b, c, d, e) {
    var alreadyBatchingUpdates = ReactDefaultBatchingStrategy.isBatchingUpdates;

    if (alreadyBatchingUpdates) {
      return callback(a, b, c, d, e);
    } else {
      return transaction.perform(callback, null, a, b, c, d, e);
    }
  }
};
```

batchedUpdates判断是否在update中，如果正在update则直接调用canllback，否则则调用transaction.perform

这里事务transaction来看看是什么

transaction就是继承Transcation抽象类的实现, 其扩展的wrappper主要如下:

```
var RESET_BATCHED_UPDATES = {
  initialize: emptyFunction,
  close: function () {
    ReactDefaultBatchingStrategy.isBatchingUpdates = false;
  }
};

var FLUSH_BATCHED_UPDATES = {
  initialize: emptyFunction,
  close: ReactUpdates.flushBatchedUpdates.bind(ReactUpdates)
};

var TRANSACTION_WRAPPERS = [FLUSH_BATCHED_UPDATES, RESET_BATCHED_UPDATES];

```

从这里可以看出: 每次调用BatchingStrategy.batchUpdate 都会执行事务的perform.. 如果正处在batchUpdate中，则直接执行callback, 否则执行transcation.perform.



**Transaction**

Transaction 本身类似一个Impl接口／抽象类

其作用呢，主要是wrapper一些mehod,在method执行之前，执行initialize函数，在method执行之后，执行close事件.

通过预留：getTransactionWrappers接口，方便子类继承以及扩展

getTransactionWrappers接口会返回如下数据结构：

[{
    initialize: ()=>{},
    close: ()=>{}
}];


接口：

主要提供如下接口：

- findDOMNode 根据组件来获取对应的dom节点
- render 渲染函数
- unmountComponentAtNode 卸载dom节点内部所有的组件
- version
- unstable_batchedUpdates
- unstable_renderSubtreeIntoContainer

## render

**ReactMount.render(nextElement, contianer, callback)**


**ReactMount._renderSubtreeIntoContainer(parentComponent, nextElement, container, callback)**

2.1判断当前container 是否有已经渲染的element元素，如果有，且判断需要更新则，并且直接return

2.2 判断当前container 是否有已经渲染的element元素，如果有，且判断需要更新则，并且直接return

2.3 判断当前container 没有已经渲染的element元素，则调用_renderNewRootComponent渲染根组件

**渲染根节点ReactMount._renderNewRootComponent(nextWrappedElement, container, shouldReuseMarkup, nextContext, callback)**


- ReactBrowserEventEmitter.ensureScrollValueMonitoring(); 应该是先执行某个触发事件。。
- componentInstance = instantiateReactComponent(nextElement, false); 创建组件实例
- 调用batchedUpdates方法 ReactUpdates.batchedUpdates(batchedMountComponentIntoNode, componentInstance, container, shouldReuseMarkup, context);

从这里看到，并没有直接的代码去加载dom到root dom中，倒是在batchedMountComponentIntoNode方法里面可以看到mount的代码

**ReactUpdates.batchUpdates(batchedMountComponentIntoNode)**

在之前已经注入ReactDefaultBatchingStrategy,,ReactDefaultBatchingStrategy内部由一个transaction

ReactDefaultBatchingStrategy.batchedUpdates(call) 方法也是调用transaction.perform(callback)来执行的

这个事务的特点就是在执行callback之后执行ReactUpdates.flushBatchedUpdates方法

**batchedMountComponentIntoNode**

在这个函数里面，会创建事务，transaction 以及

```
function batchedMountComponentIntoNode(componentInstance, container, shouldReuseMarkup, context) {
  var transaction = ReactUpdates.ReactReconcileTransaction.getPooled(
  /* useCreateElement */
  !shouldReuseMarkup && ReactDOMFeatureFlags.useCreateElement);
  transaction.perform(mountComponentIntoNode, null, componentInstance, container, transaction, shouldReuseMarkup, context);
  ReactUpdates.ReactReconcileTransaction.release(transaction);
}

```


ReactUpdates部分源码分析请参照对应的文档

**mountComponentIntoNode**

执行 mountComponentIntoNode方法，调用reactReconciler.mountComponent

function () {
  var markup = ReactReconciler.mountComponent(
    wrapperInstance,
    transaction,
    null,
    ReactDOMContainerInfo(wrapperInstance, container),
    context,
    0 /* parentDebugID */
  );
}



**ReactReconciler.mountComponent**

const transaction = ReactUpdates.ReactReconcileTransaction.getPooled(
    /* useCreateElement */
    !shouldReuseMarkup && ReactDOMFeatureFlags.useCreateElement
  );

var markup = internalInstance.mountComponent(transaction, hostParent, hostContainerInfo, context, parentDebugID);
if (internalInstance._currentElement && internalInstance._currentElement.ref != null) {
  transaction.getReactMountReady().enqueue(attachRefs, internalInstance);
}










