React Source
===

## 构建
react的构建比较复杂，使用了grunt gulp npm-scrpt等
构建命令：npm run build (grunt build)
主要的task是 grunt build,里面的task主要为三类：
- build-modules 将不同的模块代码到对应的目录
- react,react_dom,react_native等
- browserify 打包成umd模块，并压缩各个模块的代码，为何要打包成umd模块，可以在浏览器端以及nodejs端运行
- 
- npm-react ??

build-modules 其实是调用gulp的task，我们从gulp配置文件可以看到，
打包最终会生出4个包

- react isomorphic,addons,sharedd
- reactDOM renderers/dom,renderers/shared,shared
- reactNative renderers/native,renderers/shared,shared
- reactTestRenderer
- reactNoopRenderer

从构建工具，我们基本知道，react这个工程最终会生出react,react-dom,react-native等多个npm模块我们基本上知道每个目录具体服务与那个包，并且清楚各个包的入口.
下面我们再每个模块根据入口文件单独进行分析

## 目录结构

addons
isomorphic
renders
shared
test
umd
package.json
ReactVersion.js

## React
react模块核心是react的组件机制，其他所有都是为组件机制提供服务,

### src/isomorphic/React.js 入口文件
定义了React全局对象，从这里可以看出react对象的一些方法:

React.Children child工具方法聚合
React.Component 组件对象
React.PureComponet
React.createElement 
PropTypes 属性类型枚举
createClass 创建类，适用于es5代码
createFactory 
creatMixin: noop
DOM: ReactD..
version

从这里看到需要深入分析的主要模块：
- ReactComponent
- createElement
- ReactPropTypes
- ReactDOMFactories 这部分应该是属于ReactDom的部分

### src/isomorphic/modern/ReactComponent.js 组件定义
ReactComponent组件类，构造函数＋原型的方式实现
属性: 
props 构造函数传递
context 构造函数传递
refs 默认空对象
updater component核心的更新类，默认为noopupdatequeue，实际情况是由renderer注入

方法:
isReactComponent:
setState:
参数:partialState,callback
从代码来看，setState并没有多少核心的逻辑，代码主要是调用updater将state，callback存入queue中
forceUpdate: 
this.updater.enqueueForceUpdate(this);
this.updater.enqueueCallback(this, callback, 'forceUpdate');
过期方法，使用了es6的object.define来实现

ReactPureComponent 没看到区别，只是原型代理继承了ReactComponent

从这里可以看到，ReactComponnet罗技较为简单，提供了props,context，refobj属性，
其核心是注入的updater, setState核心方法，都是通过调用updater的接口

另外，为何没有看到组件生命周期的方法 ？ 以及render的接口定义也没有

### src/isomorphic/classic/element/ReactElement.js
ReactElement不是经典的构造器+原型方式实现的类，而是一个工程函数，运行此函数会生成一个element对象
ReactElement:工厂函数，返回一个element对象，element就是简单的对象，拥有type,key,ref,props,_owner属性，$$typeof属性可以判断是否是react-element

ReactElement.createElement:与构造函数什么区别？
ReactElement.createFactory:创建一个特定类型的工厂函数
cloneAndReplaceKey:
cloneElement:克隆元素
isValidElement:判断是非为react-element



    