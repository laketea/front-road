# babel插件开发

babel是 javascript编译器， 源码到源码的转换器
babel的主要有三个处理步骤: 解析，转换，生成, 下面分别详细说明下.

## 解析

解析步骤主要负责接收代码并输出 AST。 这个步骤分为两个阶段：词法分析和语法分析，学习过编译原理的应该都清楚

### 词法分析

词法分析阶段主要是将代码字符串转换为tokens

```javascript
n * n;

// 解析为：

[
  { type: { ... }, value: "n", start: 0, end: 1, loc: { ... } },
  { type: { ... }, value: "*", start: 2, end: 3, loc: { ... } },
  { type: { ... }, value: "n", start: 4, end: 5, loc: { ... } },
  ...
]

```


### 语法分析

语法分析阶段主要是将tokens转换为ast的形式, 这里我们要重点讲下ast抽象语法树

#### 抽象语法树（ASTs）

babel使用一个基于 ESTree 并修改过的 AST，
下面我们举例说明

```javascript 
function square(n) {
  return n * n;
}
```

上面的这段代码可以解析成如下的结构:

```javascript
{
  type: "FunctionDeclaration",
  id: {
    type: "Identifier",
    name: "square"
  },
  params: [{
    type: "Identifier",
    name: "n"
  }],
  body: {
    type: "BlockStatement",
    body: [{
      type: "ReturnStatement",
      argument: {
        type: "BinaryExpression",
        operator: "*",
        left: {
          type: "Identifier",
          name: "n"
        },
        right: {
          type: "Identifier",
          name: "n"
        }
      }
    }]
  }
}
```

抽象语法树, 也就是将代码根据语法转换为属性结构，每一层结构都称为节点(node),每一个节点都有一个type属性，代表节点的类型, 常见的节点类型:

- Program 代码顶级节点
- VariableDeclaration 变量定义
- FunctionDeclaration 函数定义
- BlockStatement 代码块
- ReturnStatement 返回语句
- BinaryExpression 表达式
- Identifier 标志符

> [AST Explorer](http://astexplorer.net/) 是一个在线的ast分析网站，方便你了解代码的树

### babylon
babylon是babel的解析器，负责将源码解析为ast形式.
按照方法

```bash
$ npm install --save babylon
```

简单示例

```javascript
import * as babylon from "babylon";

const code = `function square(n) {
  return n * n;
}`;

babylon.parse(code);
// Node {
//   type: "File",
//   start: 0,
//   end: 38,
//   loc: SourceLocation {...},
//   program: Node {...},
//   comments: [],
//   tokens: [...]
// }
```

parse方法用来将源码转换为ast结构，下面列一下常用参数，

- code: string,
- options: object
    + sourceType: module/script, module类型支持es6模块，sript可以理解为普通的源码解析
    + plugins: Array: 解析插件，如果需要解析jsx，需要加上jsx插件

parse方法返回值是一个类型为file的node节点,其子属性program

parse方法详细文档请参考[babylon](https://github.com/babel/babylon/blob/master/README.md#plugins)

## 转换
转换ast树，是babel最负责的部分，需要对节点进行便利，构建以及修改

### 遍历节点
转换ast树需要进行递归遍历, babel支持访问者模式来对节点便利，访问者模式即提供一个对象，定义了用于在一个树状结构中获取具体节点的方法。

```javascript
const MyVisitor = {
  Identifier(path) {
    console.log("Called!");
  }
};

const MyVisitor = {
  Identifier: {
    enter(path) {
      console.log("Entered!");
    },
    exit(path) {
      console.log("Exited!");
    }
  }
};
```

如上示例，每次遍历遇到Identifier类型的节点时，则会调用此函数,调用函数一般发生在进入节点时，也可以在退出节点时候调用函数

> 注意： Identifier() { ... } 是 Identifier: { enter() { ... } } 的简写形式。.

在访问者函数中的参数，其实并不是node节点，而且路径path, path就是对node节点的包装，包含了一些元数据以及提供了一些对路径进行操作的方法，通过path.node可以访问到该路径对应的节点对象

#### babel-traverse
babel-traverse主要用来对ast进行便利操作，支持访问者对象

首先按照traverse

```bash
$ npm install --save babel-traverse
```

通过traverse来便利ast

```javascript
import * as babylon from "babylon";
import traverse from "babel-traverse";

const code = `function square(n) {
  return n * n;
}`;

const ast = babylon.parse(code);

traverse(ast, {
  enter(path) {
    if (
      path.node.type === "Identifier" &&
      path.node.name === "n"
    ) {
      path.node.name = "x";
    }
  }
});
```

traverse函数第一个参数是 ast根节点，第二个函数即是遍历函数对象

另外path对象也支持traverse方法，如果在path对象上调用traverse,则遍历当前节点以及子节点

```javascript
path.traverse({
  Identifier(path) {
    if (path.node.name === this.paramName) {
      path.node.name = "x";
    }
  }
};);
```

### 修改节点
babel转换为ast树后，通过遍历函数可以得到path以及node节点，通过path以及node对象均可以对ast树进行调整，下面列举下常用的一些操作方法


##### 获取子节点的Path

    path.node.left;
    path.get('left');

##### 检查节点的类型

    t.isIdentifier(path.node.left)
    t.isIdentifier(path.node.left, { name: "n" })

##### 检查路径（Path）类型

    path.get('left').isIdentifier({ name: "n" }
    t.isIdentifier(path.node.left, { name: "n" })

##### 查找指定的父path

    path.findParent((path) => path.isObjectExpression());
    path.getFunctionParent();
    path.getStatementParent();

##### 获取兄弟路径
如果path处于function或者program节点的body中，则拥有兄弟path

- 通过path.inList 判断是否拥有兄弟path
- path.getSibling(index) 获取指定的兄弟path
- path.key 获取当前path的序列号
- path.container 获取容器对象
- path.listKey 获取容器对象名词

##### 停止遍历

    path.skip()
    path.stop()

##### 替换节点

    path.replaceWith(
        t.binaryExpression("**", path.node.left, t.numberLiteral(2))
      );

##### 用多节点替换单节点

    path.replaceWithMultiple([
        t.expressionStatement(t.stringLiteral("Is this the real life?")),
        t.expressionStatement(t.stringLiteral("Is this just fantasy?")),
        t.expressionStatement(t.stringLiteral("(Enjoy singing the rest of the song in your head)")),
    ]);

##### 用源码字符串体会节点

    // 注意不是所有类型的path都支持此方法
    path.replaceWithSourceString(`function add(a, b) {
        return a + b;
    }`);

##### 插入兄弟节点

    path.insertBefore(t.expressionStatement(t.stringLiteral("Because I'm easy come, easy go.")));
    path.insertAfter(t.expressionStatement(t.stringLiteral("A little high, little low.")));

##### 插入节点到容器中

    path.unshiftContainer('body', t.stringLiteral('before'));
    path.pushContainer('body', t.stringLiteral('after'));

##### 删除一个path

    path.remove();

##### 替换父节点

    path.parentPath.replaceWith(
        t.expressionStatement(t.stringLiteral("Anyway the wind blows, doesn't really matter to me, to me."))
      );

##### 删除父节点

    path.parentPath.remove();



### 构建节点
Babel Types提供了构造、验证以及变换 AST 节点的方法

安装

```bash
$ npm install --save babel-types
```

使用

```javascript
import traverse from "babel-traverse";
import * as t from "babel-types";

traverse(ast, {
  enter(path) {
    if (t.isIdentifier(path.node, { name: "n" })) {
      path.node.name = "x";
    }
  }
});
```

#### Definitions（定义）

Babel Types模块拥有每一个单一类型节点的定义，包括节点包含哪些属性，什么是合法值，如何构建节点、遍历节点，以及节点的别名等信息。

参考表达式的定义如下:

```javascript
defineType("BinaryExpression", {
  builder: ["operator", "left", "right"],
  fields: {
    operator: {
      validate: assertValueType("string")
    },
    left: {
      validate: assertNodeType("Expression")
    },
    right: {
      validate: assertNodeType("Expression")
    }
  },
  visitor: ["left", "right"],
  aliases: ["Binary", "Expression"]
});
```

> 这里仅使用BinaryExpression作为示例，官方文档并没有列出所有类型的定义，如果需要查找节点类型定义，需要参考Definitions目录下的源码, [Definitions](https://github.com/babel/babel/tree/v6.24.0/packages/babel-types/src/definitions)

#### Builders（构造器）

你会注意到上面的 BinaryExpression 定义有一个 builder 字段， builder数组即代表对应构造器的参数个数以及对应的意义

```javascript
builder: ["operator", "left", "right"]

// 创建表达式节点
t.binaryExpression("*", t.identifier("a"), t.identifier("b"));
```

#### Validators（验证器）

BinaryExpression 的定义还包含了节点的字段 fields 信息，以及如何验证这些字段。
这里非常重要的一点，是说明上面的构造器参数的类型,
以下面来示例，operator类型是string, left以及right类型是Expression,

```javascript
fields: {
  operator: {
    validate: assertValueType("string")
  },
  left: {
    validate: assertNodeType("Expression")
  },
  right: {
    validate: assertNodeType("Expression")
  }
}
```

除此之外，还提供types还提供类型验证函数，在遍历的时候非常有用。

```javascript
t.isBinaryExpression(maybeBinaryExpressionNode);
```


## 代码生成
Babel Generator模块是 Babel的代码生成器，它读取AST并将其转换为代码和源码映射（sourcemaps）

安装

```bash
$ npm install --save babel-generator
```

使用

```javascript
import * as babylon from "babylon";
import generate from "babel-generator";

const code = `function square(n) {
  return n * n;
}`;

const ast = babylon.parse(code);

const code = generate(ast, {
  retainLines: false,
  compact: "auto",
  concise: false,
  quotes: "double",
}).code;
```

> 注意：babel对中文字符有些问题，生成的代码需要对unicode字符进行解码
> 

另外还提供了babel-template让你编写字符串形式且带有占位符的代码来代替手动编码

## 插件开发

babel插件开发本质就是返回一个访问者对象

```javascript
//types: babel-types
export default function({ types: t }) {
  return {
    visitor: {
      Identifier(path, state) {},
      ASTNodeTypeHere(path, state) {}
    }
  };
};
```

## 实战

下面我们以curie中对service添加引用来作为实例练习一下.

我们需要在文件中添加一个import 以及对export对象添加一个属性, 注释的地方即为我们需要添加的代码

```javascript
import * as layout from './layout';
import * as user from './user';
// import * as project from './project';

export default {
  user,
  layout,
  // project
};
```

首先我们需要分析代码的ast结构，将原始代码copy到astexplorer中转换为ast, 我们可以得到如下的ast json数据.

```javascript
{
  "type": "Program",
  "body": [
    {
      "type": "ImportDeclaration",
      "specifiers": [
        {
          "type": "ImportNamespaceSpecifier",
          "local": {
            "type": "Identifier",
            "name": "layout"
          }
        }
      ],
      "source": {
        "type": "Literal",
        "value": "./layout",
        "raw": "'./layout'"
      }
    },
    {
      "type": "ImportDeclaration",
      "specifiers": [
        {
          "type": "ImportNamespaceSpecifier",
          "local": {
            "type": "Identifier",
            "name": "user"
          }
        }
      ],
      "source": {
        "type": "Literal",
        "value": "./user",
        "raw": "'./user'"
      }
    },
    {
      "type": "ExportDefaultDeclaration",
      "declaration": {
        "type": "ObjectExpression",
        "properties": [
          {
            "type": "Property",
            "method": false,
            "shorthand": true,
            "computed": false,
            "key": {
              "type": "Identifier",
              "name": "user"
            },
            "kind": "init",
            "value": {
              "type": "Identifier",
              "name": "user"
            }
          },
          {
            "type": "Property",
            "method": false,
            "shorthand": true,
            "computed": false,
            "key": {
              "type": "Identifier",
              "name": "layout"
            },
            "kind": "init",
            "value": {
              "type": "Identifier",
              "name": "layout"
            }
          }
        ]
      }
    }
  ]
}
```

分析ast我们可以理清楚我们要对ast做哪些操作:

- 在program.body中插入一条ImportDeclaration节点
- 在ExportDefaultDeclaration的ObjectExpression节点中插入一条Property属性

### 插入ImportDeclaration节点

首先需要确定import节点的位置，我们上面介绍了path的一些方法，可以通过insert节点到container对象，我们这里 通过定位ExportDefaultDeclaration, 然后再在export节点前插入新的节点.

```javascript
var visitor = {
    ExportDefaultDeclaration(path) {
      path
        .getPrevSibling()
        .insertBefore(xxx);
    }
}
```

如何创建ImportDeclaration节点？
在上文我们有介绍,官方文件并没有列出所有的类型定义，只能通过types源码来查找其定义以及构造方法

通过源码我们找到ImportDeclaration的定义如下:

```javascript
defineType("ImportDeclaration", {
  visitor: ["specifiers", "source"],
  aliases: ["Statement", "Declaration", "ModuleDeclaration"],
  fields: {
    specifiers: {
      validate: chain(
        assertValueType("array"),
        assertEach(assertNodeType("ImportSpecifier", "ImportDefaultSpecifier", "ImportNamespaceSpecifier"))
      )
    },
    source: {
      validate: assertNodeType("StringLiteral")
    }
  }
});
```

从类型定义中可以分析出构造函数:

构造函数: 

- t.importDeclaration (一般为类型名词的首字母小写)

参数： 

- specifiers: array, 子类型为ImportSpecifier/ImportDefaultSpecifier/ImportNamespaceSpecifier
- source: 类型为StringLiteral

然后我们通过这种方法逐级的找到对应类型的构造函数以及参数类型,最终可以构造出import节点:

```javascript
t.importDeclaration([t.ImportNamespaceSpecifier(t.identifier(variable))], t.stringLiteral(source));
```

最后的实现代码如下:

```javascript
const t = require("babel-types");

const types = {
    importNamespaceDeclaration(key,importPath) {
        reutrn t.importDeclaration([t.ImportNamespaceSpecifier(t.identifier(variable))], t.stringLiteral(source));
    },
    shortObjectProperty(key) {
        return t.objectProperty(t.identifier(key), t.identifier(key), false, true);
    }
}

const visitor = {
    ExportDefaultDeclaration(path) {
      path
        .getPrevSibling()
        .insertBefore(types.importNamespaceDeclaration(key,importPath));
    },
    ObjectExpression(path) {
      path
        .node
        .properties
        .push(types.shortObjectProperty(key));
    }
}
```

