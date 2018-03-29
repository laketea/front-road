createElement

---

ReactElement 本身是一个函数，创建element之后, element本质就是一个对象

## ReactElement

element本身只是一个对象，这个函数也只是返回一个对象。。

```
$$typeof: REACT_ELEMENT_TYPE,

// Built-in properties that belong on the element
type: type,
key: key,
ref: ref,
props: props,

// Record the component responsible for creating this element.
_owner: owner,
```


## createElement

参数：createElement(type, config, children)

- 解析出保留属性
- 检查config, 去除保留的keys后，重新生成props
- 将参数中的children, nomazie为props.children
- 合并type.defaultProps到props中(排除undefined)
- 根据type,key,ref,self,source,..,porps
- 返回ReactElement(...)

这里要注意：createElement函数本身 并不会递归创建children

## cloneElement

本质上与createElement差不多，只是会assign sourceElement.props

## createFactory

通过bind函数生成一个新的函数，默认绑定了第一个参数为指定的type

```
var factory = ReactElement.createElement.bind(null, type);
factory.type = type;
return factory;
```

## cloneAndReplaceKey

与clone类似，只是穿入了key

## 疑问

oldElement._self,
oldElement._source,
oldElement._owner,

是有何作用

> 以 ReactElement作为返回函数，函数上面的静态方法都通过调用这个函数来实现
