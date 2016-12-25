npm
---

>react技术栈基本都以npm来管理依赖，故需要对npm模块管理器做一些深入的了解
>主要参考:[npm模块管理器](http://javascript.ruanyifeng.com/nodejs/npm.html)

主要列一下npm的命令:

#### npm info 
命令可以查看每个模块的具体信息 
> npm info underscore

#### npm search
命令用于搜索npm仓库，它后面可以跟字符串，也可以跟正则表达式

#### npm list
以树型结构列出当前项目安装的所有模块，以及它们依赖的模块

#### npm install
-g 全局安装
--save 
--save-dev
设置prefix,可以指定全局模块安装路径

#### npm update
命令可以更新本地安装的模块 ,-S或--save参数，可以保存到package.json
从npm v2.6.1 开始，npm update只更新顶层模块，而不更新依赖的依赖

实现递归更新:npm --depth 9999 update

#### npm run
执行script命令
start和test属于特殊命令，可以省略run
参数，数之前要加上两个连词线（－－）
dev: 开发时构建
serve：如果没有serve命令，默认会执行node server.js
npm run不加参数的时候，会列出scripts里面所有可执行的命令

#### npm link
两种用法: 
- npm link, 将当前模块连接到全局模块中
- npm link $module, 将全局模块的$module模块，连接到当前模块中，则当前模块中可以require$module模块

#### 其他 
npm adduser, npmjs.com注册用户
npm publish, 发布到npmjs.com
npm deprecate,废弃某个版本的模块
npm owner,管理模块的维护者
npm home,
npm repo,
pm outdated
npm prune
npm shrinkwrap

#### 内部变量
$npm_package_version
$npm_package_name

"config": {
    "reporter": "xunit"
},
$npm_package_config_reporter
