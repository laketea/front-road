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
稳定的业务逻辑
局部组件化与全组件化
如果是基于angular，偏向局部组件化，全组件化会引入更多的问题，一个是命名，一个是配置复杂

组件化粒度与原则

不要过分的封装，如果需要完全不一样，考虑实现另外一个组件


#bower
bower解决的是工程的依赖，
所以用bower来解决web组件化，会遇到一些短板的问题
特别是组件的模块化依赖，以及静态文件打包

组件如何维护？
组件更新如何解决？

===

两套方案：

1.基于目前的结构，通过bower将组件引入到主工程中，
相对而言最轻量，而且几乎无任何迁移或者一些成本
但是，遇到两个问题:

template路径问题，./vendor ,
less,








##前端组件化

前端组件化的基本目的是提高代码的复用性，但是其本质是，提高整体的维护性，将复杂的系统拆分成小系统来维护。

web组件化目前已经有相关的规范，当然离落地还有一定的距离。

	通过shadow DOM封装组件的内部结构
通过Custom Element对外提供组件的标签
通过Template Element定义组件的HTML模板
通过HTML imports控制组件的依赖加载

从目前主流的几个框架（angular1.x，react，ployer）来看，ployer对标准的支持最好，基本按照标准的规范来实现，在未来规范普遍后，迁移的成本最低。
而我们目前的项目主要是基于angular（下面普遍指angular1.x），angular相对而言是一个毕竟封闭的系统，自成体系，angular中的组件做跨系统迁移，几乎是不可能。

当然说了这么多angular还是有很多优点，至少对于目前前端现状而言，angular是非常适合我么公司的。

－ 成熟的结构体系
	angular将代码结构划分为，module，controller，service等，基本所以的angular工程都是以此为架构，很难再网上再去抽象，这点对快速开发非常十分有效，统一的架构也方便团队✏️。
	当然这点有利也有闭，对于已有的系统而言，从被的体系迁移到angular是比较痛苦的
－ 对测试的友好



##前端组件化方案

一。描述

前端组件化的基本目的是提高代码的复用性，但是其本质是，提高整体的维护性，将复杂的系统拆分成小系统来维护。
目前组件化目前已经有相关的规范：
	通过shadow DOM封装组件的内部结构
通过Custom Element对外提供组件的标签
通过Template Element定义组件的HTML模板
通过HTML imports控制组件的依赖加载
从我们目前的的实际情况来看，像未来规范靠齐比较困难，所以目前这套方案基本是按照实际情况，做最新的迁移。

angular + bower + grunt

每个组件都是独立的工程，主工程通过bower引入组件。
组件独立构建打包，

由于angular自带模块管理、依赖管理的功能，没有引入异步模块加载器（requestjs，seajs等）

组件独立构建打包，这样集成到主工程中，要方便很多。如果在主工程中去构建组件的代码，template的url以及css路径打包处理都会遇到一些很麻烦的问题

二。项目工程

项目工程也就是主工程，引入组件的方式与引入第三方库的方式一致，通过bower来依赖第三方库，

bower install git@xxxx/xx-component

bower install依赖库后，通过grunt wripe来自动加载组件的js文件以及css文件。



主工程的大致目录结构如下：

project/
	src/ 项目代码
	vender/ 依赖工程
		bootstrap/ 第三方库
		components-x /组件x
		components-y /组件y

三。组件规范
参考工程：git@gitlab.testbird.io:frontend/front-components-test.git

1.组件工程
组件统一在gitlab，front-end组件下建立
2.组件名称
组件名称与
package.json name
bower.json name
module name 尽量保持一致
3.组件目录
目录结构如下：
dist
src
test
。。
。。
由于组件独立构建打包，故dist也包含在git中，每次修改源码后，需要重新build在push到代码仓库


5.模板命名
组件中涉及的templateUrl，以组件名称为前缀+模板路径的方式命名
项目构建的时候，会将html转换为js文件，故对模块的路径并不要求是真实的路径，但是需要统一命名方式以处理冲突

6.模块
每个组件必须至少创建一个angular模块

7.帮助文档
组件必须包含帮助文档，
需要说明组件的使用API以及注意事项等
建议使用markdow格式（）

8.bower。json里面的main文件，
必须列出js文件以及css文件，font以及img文件不用列出，主工程构建的时候会自动copy组件目录下的font。img文件

4.测试
独立的组件必须测单元测试代码，具体请参考test中的单元测试部分


四。不足与改进

总体而言，组件化的方案是比较保守的，对目前的工程最最小的改动，

1.组件仓库的集中管理
建议创立front-components group，方便组件代码的集中管理

2.组件安装
目前组件安装只能通过组件git全路径的方式来安装，可以考虑通过建立私有bower仓库，方便组件的管理

3.静态资源打包
由于angular自带模块管理、依赖管理的功能，所以没有考虑引入异步加载器（require、seajs等），
但是，引入组件后，打包压缩等其实存在很多问题，只是我们通过组件独立打包的方式，规避了很多问题，但是这种情况也增加组件开发的一些规范以及开发量吧。
而恰巧webpack在这方便具体很打的优势，对静态资源的打包处理其实是非常麻烦的，webpack将静态资源也当成一个模块，
可以深入研究下。
当前缺点也有，目前发现的缺点是：
引入新的构建工具，提高项目复杂度
对代码有一定的侵入性，需要对已经代码改造，（使用requrie）
开发阶段，默认代码合并，调试相对而言没有那么方便
需要深入一下。

4.组件build
每次修改代码后，都必须build一遍，这点可能会比较蛋疼。。

5.组件的国际化











