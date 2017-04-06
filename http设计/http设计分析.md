http设计分析
---

## 背景
whatwg-fetch的fetch api太过底层，实际应用的时候，每个项目都要做一些初始化的配置，比如：reponse/transform,request/transform等，故考虑基于fetch的api在封装一层http的clint类，以方便各个项目使用，并且能支持不同类型的数据,下面我们先分析下常见的几种http ajax的实现，主要侧重点再与期 config等api的设计

### fetch-it
基于fetch的增强库
#### 特点

- 支持中间件的形式，以拦截request&response
- 特供对应配置的实例(以我们目前的需求类型)

#### 基本使用

fetchIt.get(url,data,options);
fetchIt.post(url,data,options);
...

fetchIt.create({domain: ''});
    .get()
    .fetch()..

fetchIte 提供了原始的fetch方法，
另外 get，post 即提供了原始的get(request),也提供了便捷的方法

#### 如何配置
构造函数的config
middle: request, requestError, response, responseError

#### 实现



