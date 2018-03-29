webpack
---
模块打包器

传统gulp/grunt打包

- 源码层 引入seasj, 或者 require.js 以实现模块化方案
- 代码copy到build目录
- 通过相关的插件 将入口文件的js 打包为一个统一的js文件
- 通过相关的插件 将入口文件的css 打包为一个统一的css文件
- 分别将js,css代码压缩，copy到dist／www目录, 再清理build中间目录

- 开发阶段？ seajs,require.js 开发阶段，一般在本地启一个server
- gulp-connect, 然后开发阶段一般都是源码模式？ 为什么呢，因为seajs & require.js 除了提供模块化方案，还提供了异步加载实现


webpack?

根据上面的需求，提供一套网站资源打包的整体的实现, 内置支持 amd cmd模块方案


特点？

plugin,灵活，
loaders, 支持任意静态资源处理
性能， 多级缓存
分包


# ppt思路

1. webpack 是什么
2. 对比传统的gulp/sass/
3. webpack的特点
4. webpack的常见配置
5. webpack 如何编写插件以及loader
6. webpack 源码打包实现
7. atool-build工具
8. atool-build源码分析
9. atool-build
10. 
11. 
