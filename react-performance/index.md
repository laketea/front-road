## React性能优化

react性能优化的根本在于

- 减少不必要的渲染（render函数的执行），避免reconciliation
- 减少不必要的shouldComponentUpdate


- purecomponent
- functional component
- list key
- connect
- state & props的数据扁平化
- immutable.js
- 合理的拆分组件，减少不必要的render 以及 scu
- 动态属性赋值，例如：bind
- render减负 ??
- reselect