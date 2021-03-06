webpack
---

# 特色：

- 插件机制  丰富的插件机制，使得webpack十分灵活
- loader机制 文件预处理机制，可以打包任何静态资源
- 性能 异步io以及多级缓存等增量打包
- 支持 amd,cmd等多个模块化方案
- 分包打压
- 开发工具 支持生成源码以及提供开发server
- 多平台 支持打包web,webworker,nodejs代码

# demo

- 安装 
    + npm install webpack -g
    + npm install webpack --save-dev

- 打包
    + webpack index.js bundle.js 

# cli
基本使用: 
    webpack <entry> <output>
cli参数
- 开发模式-d，(--debug --devtool source-map --output-pathinfo);
- 产品模式－p (-optimize-minimize --optimize-occurrence-order);
- --watch
- --config (--config example.config.js)
- 

# loader
loader可以理解为是模块和资源的转换器，它本身是一个函数，接受源文件作为参数，返回转换的结果，例如实际开发的时候，需要专门的loader处理其它类型的文件，比如jsx,less,image等等

### loader名称
loader名称有长名称与短名称,webpack resolveLoader.moduleTemplates来查找loader

### loader使用
- require文件的时候，指定loader
    require("!style!css!./style.css")
- cli 根据模块类型（扩展名）来自动绑定需要的 loader
- config 中配置

    //cli
    webpack entry.js bundle.js --module-bind 'css=style!css'

    //config
    {
        module: {
            loaders: [
                { test: /\.jade$/, loader: "jade" },
                // => "jade" loader is used for ".jade" files

                { test: /\.css$/, loader: "style!css" },
                // => "style" and "css" loader is used for ".css" files
                // Alternative syntax:
                { test: /\.css$/, loaders: ["style", "css"] },
            ]
        }
    }

### loader参数
loader可以通过配置query string来传递参数

//require:
require("url-loader?mimetype=image/png!./file.png");

//Configuration
{ test: /\.png$/, loader: "url-loader?mimetype=image/png" }
{
    test: /\.png$/,
    loader: "url-loader",
    query: { mimetype: "image/png" }
}

//CLI
webpack --module-bind "png=url-loader?mimetype=image/png"


### 常用loader列表

### 如何编写自定义loader

# 插件

# 配置文件



# 开发服务



