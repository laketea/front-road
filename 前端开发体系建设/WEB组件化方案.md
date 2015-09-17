WEB组件化方案.md

##现状
目前前端参与的项目
CT任务创建模块 CT-TASK
众测2.0后台- CC
鸟赚hybird app - SPARROW


ct-task是一个单独的模块，但是业务逻辑又比较复杂，
cc，后台
sparrow，移动app
这三块，完全可以说三种产品形态，组件化需要可能并不高

另外，三个产品都是独立的功能，户型没有依赖，
一些共用的地方，基本是靠拷贝来实现。。

在目前业务的需要下，其实问题不大，
但是从长远的角度来看，如何快速的搭建新的业务？





##参考

前端组件化开发实践-美团
http://tech.meituan.com/frontend-component-practice.html

阶段1：最传统，以页面为单位，
阶段2：以页面的某个功能为单位
按需加载，
对应关系？
易于测试，单个的组件如何测试？是组件开发阶段测试，还是组件集成后测试？
阶段3：
Lifecycle：生命周期，解决了什么问题？方便外层控制各个层面的事件么？
Data Binding：参考angular，通过属性声明来绑定逻辑
Flux： 全局消息总线？需要了解下，大概理解为 全局的消息系统
阶段4：
React组件
npm + reduce，也就是通过npm来发布组件，通过reduce来引入组件以及打包（估计有点类似webpack的感觉）
turbo：说了很多，具体还是不知道说啥， what is ImmutableJS/cursorHot Module Replacement ?

总结：
美团整体往react靠拢，包过组件化基础库，以及打包集成等方案。。
可以研究下react/web components主流的组件化方案
前端演化需要遵循一个过程：
	发现通点
	分析调研
	应用改进
特别是注意：通点的确定，不能盲目的为了改进而改进


2015前端组件化框架之路
https://github.com/xufei/blog/issues/19

组件化的直接目的是 提高复用，但是其本质是，提高整体的维护性，将复杂的系统拆分成效系统来维护

web components标准：
	
	通过shadow DOM封装组件的内部结构
通过Custom Element对外提供组件的标签
通过Template Element定义组件的HTML模板
通过HTML imports控制组件的依赖加载


可以抽象为组件的东西：

UI控件
基础逻辑功能
公共样式
稳定的业务逻辑 ?

局部组件化与全组件化
如果是基于angular，偏向局部组件化，全组件化会引入更多的问题，一个是命名，一个是配置复杂

组件化粒度与原则

不要过分的封装，如果需要完全不一样，考虑实现另外一个组件


