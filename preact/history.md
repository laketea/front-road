# history

history用来管理 history 栈，导航、导航确认 以及状态持久化

## history类型

提供了三种不同的方法创建history类型

- createBrowserHistory html5 history api
- createMemoryHistory memory方式，适合测试以及react-natvie
- createHashHistory 以hash值的方式维护路由

以上方法都返回history对象，下面介绍下history的属性、方法以及参数

### 参数

**getUserConfirmation** 自定义消息对话框
**forceRefresh** 强制重新加载url,而不是通过h5 pushState
**hashType** 修改hashType值



### 属性

- length 历史记录栈的总数
- location 当前的location
- action 当前导航动作

### 方法：

- listen 监听location的改变事件
- 导航类操作, push、replace、go、goBack、goForwar
- block 弹出一个prompt消息框，让用户选择是否离开当前路由

location是实现了window.location的子集,拥有如下属性：

- pathname
- search
- hash 
- state 仅createBrowserHistory &createMemoryHistory支持
- key createMemoryHistory支持


```
history.listen((location, action) => {
  console.log(
    `The current URL is ${location.pathname}${location.search}${location.hash}`
  )
  console.log(`The last navigation action was ${action}`)
})
```

## 源码实现

### createHashHistory

核心方法：push、replace、go、listen

#### 导航类API

通过参数创建location, 并调用transitionManager.confirmTransitionTo 跳转到新的路由，并最终调用setState调用改变内部的状态

**confirmTransitionTo**

**setState**

assign history对象，通知并执行listeners方法


#### listen监听函数






