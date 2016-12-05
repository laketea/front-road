React
===

> 前端构建主要由下面三部分：
> - 包管理器 能够方便的使用丰富的第三方库，并且恨容易以及按照
> - 打包器 可以编写模块代码并且可以打包优化大小
> - 编译器 让你能编鞋现代的js代码

## 安装
 
安装react模块 
`npm install --save react react-dom`

ES6 & JSX 需要安装babel 

- 安装babel-cli `npm instal --save-dev babel-cli`
- 安装babel-preset-react & babel-preset-react
- 配置.babelrc, preset项设置 react,es2015

如何使用babel?
一种，npm scripts,package中设置如下配置,执行:npm run build

    "scripts": {
         "build": "babel src -d lib"
    },

另外一种，直接引用node_modules中的cli.

./node_modules/.bin/babel src -d lib

## 静态引用
需要引入react.js & react-dom.js
如果在浏览器中直接使用es6&jsx 则需要引入babel-standalone文件，代码需要放入text/babel script块中
index.html

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>Hello World</title>
        <script src="./node_modules/react/dist/react.js"></script>
        <script src="./node_modules/react-dom/dist/react-dom.js"></script>
        //babel在线转换
        <!-- <script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script> -->
      </head>
      <body>
        <div id="root"></div>
      </body>
      <!-- 转换后的代码 -->
      <script src="./dist/main.js"></script>
    </html>

## JSX
JSX是一种ui描述标签
- jsx中可以使用任意的js表达式(需要通过花括号包围)
- jsx本身也是表达式，可以作为返回，变量等等
- 可以给jsx设置属性
- 可以给jsx设置children
- jsx可以防止注入攻击
- jsx编译后，实际就是react element 对象

>jsx可能对刚了解的人容易产生迷惑，jsx中的标签到底是什么？其实我们可以通过编译后的代码看出,jsx中的标签就是react element对象，所以在使用的时候，我们可以完全把jsx tag当作对象使用，jsx只是语法上的便利而已.

## 渲染react element

ReactDom.render方法

    const element = <h1>Hello, world</h1>;
    ReactDOM.render(
      element,
      document.getElementById('root')
    );

## Components
组件是ui中独立的可重用的块
react中的组件有两种方式：函数式以及类
组件的几个特性:
- 组件必须返回单一的根节点
- 组件可以任意嵌套
- 组件不能修改props，遵循纯函数的原则，在相同的输出下，必须返回相同的结果
- 组件只更改需要改变的部分

    //函数
    function Welcome(props) {
      return <h1>Hello, {props.name}</h1>;
    }
    //类
    class Welcome extends React.Component {
      render() {
        return <h1>Hello, {this.props.name}</h1>;
      }
    }

如何渲染组件？
react jsx中可以直接使用组件的名称作为组件，这里并没有提供一个组件注册机制.(组件没有注册机制，工程项目如何引用组件?)
react渲染一个自定义元素时，会讲元素的属性转换为props对象传递给组件(render等于渲染的入口)

    function Welcome(props) {
      return <h1>Hello, {props.name}</h1>;
    }

    const element = <Welcome name="Sara" />;
    ReactDOM.render(
      element,
      document.getElementById('root')
    );

## state以及生命周期
构造函数中，需要调用超类的构造函数 super(props) (why?);
state注意事项：

- state中仅存放渲染相关的数据
- 仅在构造函数中定义state对象，其他地方都使用setState方法来修改state，否则不起作用 (state可能等于虚拟dom与实际dom的同步的触发点
- )
- state状态改变后，dom的改变可能是异步的 (state改变后，何时修改dom)
- state状态改变会被合并 (？何时被合并)


    // Wrong 因为是异步的，所以真正执行的时候，counter，increment可能都改变了
    this.setState({
      counter: this.state.counter + this.props.increment,
    });
    // Correct
    this.setState((prevState, props) => ({
      counter: prevState.counter + props.increment
    }));

从上面几点我们可以总结出component中的变量分为三种:

- props 传递过来的属性
- state 与渲染或者试图相关的状态
- this 上面两者之外的一些中间变量或者控制属性

组件的生命周期：

- componentDidMount 组件已经渲染在dom之后，这个时候props已经可用, 如果想存储一些不是用于展示的数据，则可以添加一些额外的属性到对象上（需要了解不同的周期的具体执行过程）
- componentWillUnmount 

## 事件处理
react element上绑定含糊与dom类似，区别如下：
- 事件名称使用驼峰命名法
- jsx使用函数作为事件处理器，dom使用string
- react中使用SyntheticEvent对象来替代原始的event对象

注意绑定事件的this指针问题，三种处理方法:

    // This binding is necessary to make `this` work in the callback
    this.handleClick = this.handleClick.bind(this);

    // This binding is necessary to make `this` work in the callback
    this.handleClick = this.handleClick.bind(this);

    // This syntax ensures `this` is bound within handleClick
    return (
      <button onClick={(e) => this.handleClick(e)}>
        Click me
      </button>
    );

## 条件渲染
这一节首先需要理解jsx实际就是react-element,其次，为了方便使用element的实现原理上，增加一些模版数据的机制,主要如下:
- jsx中嵌入表达式
- 可以使用内连的if && (本质上因为jsx也是对象，故可以在表达式中使用)
- 内连的三元操作符(同上)
- 组件返回null,则不渲染组件(仅仅只是不显示？那组件对象是否存在呢？)
- 

    <div>
      <h1>Hello!</h1>
      {unreadMessages.length > 0 &&
        <h2>
          You have {unreadMessages.length} unread messages.
        </h2>
      }
    </div>

    <div>
      {isLoggedIn ? (
        <LogoutButton onClick={this.handleLogoutClick} />
      ) : (
        <LoginButton onClick={this.handleLoginClick} />
      )}
    </div>

## Lists & Keys
还说那句老话，jsx其实就是react element对象，故jsx当然可以用在list中，
但是list中，需要制定key,这个与angular需要制定track as 类似的原理，
从key的原理可以知道，item element是无法从props中访问key的，故如果需要访问key,则需要再额外传递一个属性给child

    <ul>
      {numbers.map((number) =>
        <ListItem key={number.toString()}
                  value={number} />
      )}
    </ul>

## Forms
form表单的元素内部也是自带状态的，而react的组件也是带状态的，为了统一这两张模式以遵循单一来源的原则，react搞了个controlled-component,感觉像是被接管了的组件的意思。    
实现起来挺繁琐的，每个input绑定一个value到state,再绑定一个change函数去更改state,另外为了弥补select,textarea的差异，都统一使用这张方式    
具体的原理，就是input的数据改变后，先改变state，然后再输出到input..    
react考虑到这张方式比较繁琐以及集成其他框架可能会出问题，所以引用了一个扩展的方式，uncontrolled-component

## Lifting State up
大概意思就是 state提升，如果多个组件共同映射一个数据，则将state设置到 两个组件最近的parent组件中。

## 组合 vs 继承
举例说明了下，使用组合的好处吧。。
提供了给组件传递jsxchild的方法，故使用组合模式会更易用一些(有点类似ng的trancation,从思想上来说，有点类似函数式编程的概念，通过各种组合能够实现很多丰富的变化)

## 思考
虚拟dom的价值？ 更好的维护dom，而且可以屏蔽dom底层的一些浏览器差异等问题。。这或许是更好的方式，以自己的方式来虚拟一层dom，这样便于维护与管理，首先体现在，其作为js代码 而不是html

## 总结
总的来说，react其实就是三部分: react + react-dom + jsx
react的使用其实很简单:

- React.render 绑定根组件与dom
- 其他的都是组件

react引入虚拟dom的方式来管理html这里很好的解决了一些问题：

- 屏蔽底层dom的差异，让开发者更专注与业务实现
- 引入jsx，这样可以更好的实现组件化，我们不再需要模版template文件，而是很好的跟组件代码结合

现在在想想react的核心特点：

- 虚拟dom
    屏蔽底层dom的差异，让开发者更专注与业务实现，引入jsx，这样可以更好的实现组件化，我们不再需要模版template文件，而是很好的跟组件代码结合
- 组件化
    定义了组件化的机制以及生命周期等，非常方便组件的复用与维护
- 状态机
    前端框架都涉及到一个核心问题，model与view的映射以及view的更新机制，react提出状态机的方式来解决这个问题，并且在某些场景下实现服务器渲染十分方便



