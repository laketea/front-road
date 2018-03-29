实力化组件
---

> instantiateReactComponent.js
> 

入口函数： function instantiateReactComponent(node, shouldHaveDebugID) {}


如果判断node为空，则创建一个emptyComponent

如果判断node为number或者string, 则创建一个text组件ReactHostComponent.createInstanceForText(node);

如果node为对象（非真实对象，包括function）， 则element.type为string, 则创建html 内置对象组件。ReactHostComponent.createInternalComponent(element);


如果node为对象（非真实对象，包括function）， 则isInternalComponentType(element.type), 则直接使用type构造器创建组件实例

?? 疑问：何种类型为isInternalComponentType

如果node为对象，则不满足以上情况，则使用 new ReactCompositeComponentWrapper(element)来创建组件实例



## ReactHostComponent
ReactHostComponent 为一个host类，用来注册 text组件、以及内置html标签组件的facotry

```
var ReactHostComponent = {
  createInternalComponent: createInternalComponent,
  createInstanceForText: createInstanceForText,
  isTextComponent: isTextComponent,
  injection: ReactHostComponentInjection
};
```

## ReactCompositeComponentWrapper

ReactCompositeComponentWrapper本身是一个代理类，其核心是ReactCompositeComponent

```
var ReactCompositeComponentWrapper = function (element) {
  this.construct(element);
};
_assign(ReactCompositeComponentWrapper.prototype, ReactCompositeComponent, {
  _instantiateReactComponent: instantiateReactComponent
});
```

> 这里通过prototype来实现继承/mixin

## ReactCompositeComponent

这个作为核心类之一，单独分析



