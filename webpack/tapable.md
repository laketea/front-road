# tapable
---

tapable 是 webpack 实现的一个插件以及事件流机制，下面主要介绍下其api.

## apply
应用一个插件
调用插件的apply方法

## plugin
plugin 方法，也就是注册一个事件，
内部实现也比较简单，就是缓存一个事件对象_plugins, 每一个key上面都保存的是一个数组，也就是说，每种类型的事件，可以注册多个
> 内部的变量可以用下划线来区分

```
this.plugin(name,xxx)
name 可以是string, 也可以是数组
```



## applyPlugins
应用name对应的事件， 根据注册的顺序执行，另外将此函数的参数（第一个除外）作为事件的参数

```
this.applyPlugins('init');
```

## applyPluginsWaterfall
与applyPlugins类型，也是顺序执行事件，但是区别是，第二个参数是 init数据，每一次plugin之行后，返回的数据，会作为下一个plugin的第一个参数

```
this.applyPluginsWaterfall('init', {})
```

## applyPluginsBailResult
与与applyPlugins类似，但是只要有一个plugin有返回值，则剩余的事件不执行

## applyPluginsAsyncSeries
这个是 异步串式执行，每个异步执行成功之后，才会执行下一个事件，如果中途出错，则直接执行callback函数

## applyPluginsAsyncWaterfall
异步串式执行，且没个事件的返回值 会被传入下一个事件

## applyPluginsParallel
貌似只要有一个执行出场，则剩下的就不执行

## applyPluginsParallelBailResult
。。
