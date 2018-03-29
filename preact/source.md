# Preact

## 核心API

其核心api如下：

- h 创建element
- createElement 创建element
- cloneElement clone element
- Component 组件
- render 渲染
- rerender 再次渲染
- options ??

## createElement

用法: createElement(nodeName, attributes, ...children)

这里会合并...children 以及attributes中的children（每个child可以为数组，最终会平铺为一个children）
优化： 如果当前child 以及 以及最后一个child 都为简单类型，则合并为一个child

options做何用途？ 类似插件的意思?

最终创建一个 VNode , Vnode本身只是一个空的构造器
包含如下属性:

- nodeName
- children
- attributes
- key

## cloneElement

实现很简单，重新生产一个 vnode对象

## Component

Component 构造器＋原型

**实例属性**

- _dirty
- context
- props
- state
- 
**方法**

- setState
- forceUpdate
- render() {}

### setState

setState(state, callback)

state既可以是对象，也可以是函数，从源码来看，setState对state的改变是立即执行的
更改state之后，调用enqueueRender来 处理更新问题

**enqueueRender**

enqueueRender的作用，是异步执行component的 update,
dirty用来判断组件是否脏掉，并且只在items加入第一个的时候执行异步函数，这样可以一定的优化rerender的执行

defer方法，异步执行

**renderComponent**


### forceUpdate

作用：强制同步更新
调用renderComponent


## render
源码如下:

```
export function render(vnode, parent, merge) {
    return diff(merge, vnode, {}, false, parent, false);
}
```

```
function diff() {
    let ret = idiff(dom, vnode, context, mountAll, componentRoot);


}

function idiff() {
    // 如果vnode是简单类型，则
    // 如果dom存在且dom是text类型，则直接更改dom.nodeValue
    // 如果dom不是简单类型，则创建textNode, 若dom存在，则替换dom 跟新生成的dom
    
    // 如果vnode为函数类型，则直接通过buildComponentFromNode创建dom

    // 如果vnode为普通类型(html), 则创建node, 若dom存在，则将dom的child节点 append到新dom中，若dom已渲染，则替换dom->new Dom
    
    
}

```

