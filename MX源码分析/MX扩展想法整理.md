MX扩展想法整理

---

- $include支持html静态文件
    mx.containers.HtmlContainer实现了加载html，但是缺少模板机制
- 引入TPL模板机制
- 引入指令机制
- 
mx模块的以及继承的写法太过累赘，考虑下如何扩展改进，
继承写法太过累赘
函数应该包含在匿名函数块中
模块名需要显示的赋值
。。。

MX现有机制的一些思考：在整个UAP前端开发中，UAPUI模型的可视化编辑是一个重点，但是在可视化编辑器不是十分灵活方便（存在很多BUG）的情况下，这个功能可能是一个鸡肋，一线开发人员可能很少使用
当然这种可视化编辑器对于大部分javaweb开发人员可能更方便，也不需要对css布局精通


