脚手架开发

---

主要介绍下nodejs脚手架工具开发相关知识。

## CLI架构
首先，nodejs脚手架入口肯定是可执行脚本

```bash
#!/usr/bin/env node //文件头
console.log('hello world');
```

那么如何执行这个文件呢？

```bash
chmod 777 test.js
./test
```

如何全局调用此命名呢？ 
一种方法是将路径添加到环境变量path路径
另外一种 通过npm 包配置文件中bin属性

### bin
npm包配置文件中提供了bin属性，以更方便的将可执行文件添加到环境变量PATH中，
bin属性支持 对象类型以及字符串类型，如果是对象类型则 key为命令名词，属性为文件路径，如果是字符串类型，则默认命名名即为package name对应的名词,详情请参考 [package.json-bin](https://docs.npmjs.com/files/package.json#bin)

```javascript
//./bin/test.js

//package
{   
    name: 'test',
    bin: './bin/test.js'
}
```

配置好bin属性后，我们可以通过`npm link`将当前包映射到全局模块，即可执行test命令
如果是其它使用则使用，则通过npm install package -g之后，也可以直接使用test命令

### yargs
通过npm的bin属性，我们解决了全局命令行的问题，那么实际开发的时候，命令往往需要处理多个参数以及调用本地shell命名.

首先，通过npm引入yargs

```bash
npm install yargs --save
```

在脚本文件中，引入yargs中的argv对象即可获取命令行参数

```javascript
var argv = require('yargs')
    .argv;

if (argv.ships > 3 && argv.distance < 53.5) {
    console.log('Plunder more riffiwobbles!');
} else {
    console.log('Retreat from the xupptumblers!');
}
```

> 注意：yargs是参数管理工具，执行命令时，只要参数格式符合要求，都可以在argv对象中获取到对象的参数，yarg的参数配置主要是对参数进行别名／默认值/类型/是否必须

#### 参数配置
yargs默认使用两个--作为参数的前缀，参数名与参数值中间使用空格或者=都可以
yargs提供了多个接口配置参数,下面列一下常用的接口

- option 参数定义
- alias 参数别名
- demand 必须参数
- default 参数默认值
- help 帮助信息
- usage 示例

参数配置即可通过option接口，对每一个参数单独配置，也可以通过alias对具体的接口项配置

```javascript

//通过option配置参数
var argv = require('yargs')
    .option('f', {
        alias: 'file',
        demandOption: true,
        default: '/etc/passwd',
        describe: 'x marks the spot',
        type: 'string'
    })
    .argv
;

//通过其它接口定义
var argv = require('yargs')
    .alias('f', 'file')
    .demandOption('f')
    .default('f', '/etc/passwd')
    .describe('f', 'x marks the spot')
    .string('f')
    .argv
;

//上面两者其实是等价的
```

#### 子命令
yargs还支持子命令(类似git)模式，以支持复杂的cli命名行工具开发.
子命令主要是通过command或commandDir接口来实现

command支持如下几种参数模式:

- .command(cmd, desc, [builder], [handler])
- .command(cmd, desc, [module])
- .command(module)

第三种module即是一个cmd模块，这个模块需要包含command,alias,discribe,builder,handler

- command 命令定义,支持数组或者字符串个是，
- alias 别名
- discribe 描述
- builder 对象或数组，如果对象则代表命令接受的参数定义
- handler 命令解析函数

```javascript
exports.command = 'generate <type> [subType]';
exports.desc = 'gen files';
exports.aliases = ['g','gen'];
exports.builder = {
  dir: {
    alias: 'd',
    default: '.',
    describe: 'gen base dir'
  },
  schema: {
    alias: 's',
    describe: 'schema file path'
  },
  key: {
    alias: 'n',
    describe: 'domain key for single file gen'
  }
};
exports.handler = function(argv){
    const { type, subType, dir, schema, key} = argv;
    //do something..
};
```

commmandDir支持指定目录来配置子命令，并且支持嵌套, curie的子命令即是通过这个接口实现.

```javascript
require('yargs')
  .commandDir('lib/cmds')
  .demandCommand()
  .help()
  .argv;
```

上面仅作为基本示例，详细参考[yargs文档](http://yargs.js.org/)


## 文件模版与生成
通过npm以及yargs我们解决了cli的架构以及全局使用的问题，下面我们再来看脚手架如何生成以及修改文件.

需要了解nodejs以下模块：

- File System(文件系统)
- path 路径
- Global 全局变量

文件内容处理，实现方式主要是文本替换与babel语法处理

### 文本替换

文本替换主要是提前在模版代码里面埋好关键字，执行的时候，会将关键字替换.

```javascript
//模版代码
export default Model.extend({
  namespace: '${KEY}',

  state: {
    fields,
    ${KEY}s: []
  },

  subscriptions: {
    setupSubscriber({ listen }) {
      listen('/${KEY}', { type: 'fetch${UP_KEY}s'});
    }
  },

  reducers: {}
});

//替换关键字
getParttens(data) {
    return [
      {
        key: 'KEY',
        replacement: data.key
      }, {
        key: 'UP_KEY',
        replacement: util.capitalize(data.key)
      }, {
        key: 'NAME',
        replacement: data.name
      }, {
        key: 'FIELDS',
        replacement: JSON.stringify(data.fields, null, 2)
      }, {
        key: 'SERVER',
        replacement: data.server || ''
      }
    ];
  }

```

文件替换在处理一些复杂的代码时往往力不从心，故我们考虑通过ast语法分析来处理之类情况


### babel插件
此部分内容请参考 [babel插件开发]()



