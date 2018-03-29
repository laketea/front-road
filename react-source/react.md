react

---

这部分首先分析 react顶级接口

react总共暴露了如下接口：

- Children
- Component
- PureComponent
- createElement
- cloneElement
- isValidElement
- PropTypes
- createClass
- createFactory
- createMixin
- DOM
- version

下面我们来逐步分析这些接口

## Children

```
map: ReactChildren.map,
forEach: ReactChildren.forEach,
count: ReactChildren.count,
toArray: ReactChildren.toArray,
only: onlyChild
```

map的作用是在每一个children中的child上调用map方法，并返回
forEach便利所有的children
count统计有多少子child
toArray

> 很好的命名方式： traverseAllChildren > traverseAllChildrenImpl

## isValidElement

必须为object类型，而且$typeof属性必须为ReactElementSymbol

## PropTypes

从代码里面可以看到, 除了dev环境，其他环境都是proptypes中的方法都是空函数

```javascript
array: createPrimitiveTypeChecker('array'),
bool: createPrimitiveTypeChecker('boolean'),
func: createPrimitiveTypeChecker('function'),
number: createPrimitiveTypeChecker('number'),
object: createPrimitiveTypeChecker('object'),
string: createPrimitiveTypeChecker('string'),
symbol: createPrimitiveTypeChecker('symbol'),

any: createAnyTypeChecker(),
arrayOf: createArrayOfTypeChecker,
element: createElementTypeChecker(),
instanceOf: createInstanceTypeChecker,
node: createNodeChecker(),
objectOf: createObjectOfTypeChecker,
oneOf: createEnumTypeChecker,
oneOfType: createUnionTypeChecker,
shape: createShapeTypeChecker,
```

createPrimitiveTypeChecker：本质就是判断下propValue的数据类型是否等于指定的类型，其实现呢，其实返回一个函数 (checker)

> 这里利用了函数组合的原理 createChainableTypeChecker(validate), 如何需要组合多种操作的情况下，可以将可变的操作提取为不同的函数
