note
---

# 插件系统

webpack面向切面编程，非常方便扩展，实现了一个简易的插件系统，tapable

apply，应用插件
plugin 注册插件

# 构建流程

bin/webpack 参数处理

lib/webpack 主入口

webpack 构造函数中，
compiler.options = new WebpackOptionsApply().process(options, compiler);
这个地方 初始化所有的插件


初始化compiler对象，

compiler.run 开始构建

# 默认注册的插件列表


# compiler.run

run: 
    lib/CachePlugin
    /lib/node/NodeEnvironmentPlugin.js


compile: ExternalsPlugin

this-compilation: 
    EnvironmentPlugin.js
    JsonpTemplatePlugin.js
    LibraryTemplatePlugin.js
    node/NodeTemplatePlugin.js
    optimize/CommonsChunkPlugins
    webworker/WebWorkerTemplatePlugin

compilation: so many




## 发布事件列表

applyPluginsWaterfall     package
applyPluginsWaterfall     modules
applyPluginsWaterfall     render-with-entry
applyPluginsWaterfall     asset-path
applyPluginsAsyncSeries     additional-assets
applyPluginsAsyncSeries     optimize-chunk-assets
applyPluginsAsyncSeries     optimize-assets
applyPluginsAsyncSeries     after-compile
applyPluginsBailResult     should-emit
applyPluginsAsyncSeries     emit
applyPluginsWaterfall     asset-path
applyPluginsAsyncSeries     after-emit


## 注册事件列表

plugin: call require:commonjs:context
plugin: call require.resolve
plugin: call require.resolveWeak
plugin: call require.resolve(Weak)
plugin: call require.resolve(Weak):item
plugin: call require.resolve(Weak):context
plugin: compilation
plugin: compilation
plugin: compilation
plugin: compilation
plugin: compilation
plugin: compilation
plugin: compilation
plugin: compilation
plugin: run
plugin: after-compile
plugin: compilation
plugin: can-rename DEBUG
plugin: evaluate Identifier DEBUG
plugin: expression DEBUG
plugin: evaluate typeof DEBUG
plugin: typeof DEBUG
