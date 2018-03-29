react.dom

---

React.DOM = ReactDOMFactories

var ReactDOMFactories = {
  a: createDOMFactory('a'),
  abbr: createDOMFactory('abbr'),
  address: createDOMFactory('address')
  ..
}

从这里看 React.DOM 本质就是原生html dom的factory的集合

其实现，就是通过ReactElement.createFactory

```
var createDOMFactory = ReactElement.createFactory;
```