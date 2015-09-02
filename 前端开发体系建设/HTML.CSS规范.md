#HTML规范

---

###基本结构

统一使用HTML5的标准文档类型：<!DOCTYPE html>；

必须申明文档的编码charset 推荐使用UTF-8编码<meta charset="utf-8"/>
	根据页面内容以及需求填写keywords/description
	PC端网页，需要使用360meta标签，默认使用极速模式
		<meta name="renderer" content="webkit"> 
	移动端网页
		 <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
		 <meta name="format-detection" content="telephone=no">

常用meta标签查考：
	http://fex.baidu.com/blog/2014/10/html-head-tags/
	http://segmentfault.com/a/1190000002407912

使用link将css文件引入，并置于head中
使用script将js文件引入，并置于body底部（SPA应用不强制要求）
除特殊页面外（邮件等），禁止写内联样式

###代码结构

按照从上至下、从左到右的视觉顺序书写HTML结构
table不建议用于布局，但表现具有明显表格形式的数据，table还是首选
每一个块级元素都另起一行，每一行都使用Tab缩进对齐（head和body的子元素不需要缩进）。删除冗余的行尾的空格。
使用4个空格代替1个Tab（大多数编辑器中可设置）
对于内容较为简单的表格，建议将tr写成单行
你也可以在大的模块之间用空行隔开，使模块更清晰
要求html模块必须写注释
尽量避免冗余的结构
语义化标签尽量避免class



###代码格式
严格的嵌套
尽可能以最严格的xhtml strict标准来嵌套，比如内联元素不能包含块级元素等等。
正确闭合标签且必须闭合。
严格的属性
属性和值全部小写，每个属性都必须有一个值，每个值必须加双引号。
没有值的属性必须使用自己的名称做为值（checked、disabled、readonly、selected等等）。
可以省略style标签和script标签的type属性。

常用的标签
常见标签表
标签	语义	嵌套常见错误	常用属性（加粗的为不可缺少的或建议的）
<a></a>	超链接/锚	a不可嵌套a	href,name,title,rel,target
<br />	换行	 	 
<button></button>	按钮	不可嵌套表单元素	type,disabled
<dd></dd>	定义列表中的定义（描述内容）	只能以dl为父容器，对应一个dt	 
<del></del>	文本删除	 	 
<div></div>	块级容器	 	 
<dl></dl>	定义列表	只能嵌套dt和dd	 
<dt></dt>	定义列表中的定义术语	只能以dl为父容器，对应多个dd	 
<em></em>	强调文本	 	 
<form></form>	表单	 	action,target,method,name
<h1></h1>	标题	从h1到h6，不可嵌套块级元素	 
<iframe></iframe>	内嵌一个网页	 	frameborder,width,height,src,scrolling,name
<img />	图像	 	alt,src,width,height
<input />	各种表单控件	 	type,name,value,checked,disabled,maxlength,readonly,accesskey
<label></label>	标签为input元素定义标注	 	for
<li></li>	列表项	只能以ul或ol为父容器	 
<link />	引用样式或icon	不可嵌套任何元素	type,rel,href
<meta />	文档信息	只用于head	content,http-equiv,name
<ol></ol>	有序列表	只能嵌套li	 
<option></option>	select中的一个选项	仅用于select	value,selected,disabled
<p></p>	段落	不能嵌套块级元素	 
<script></script>	引用脚本	不可嵌套任何元素	type,src
<select></select>	列表框或下拉框	只能嵌套option或optgroup	name,disabled,multiple
<span></span>	内联容器	 	 
<strong></strong>	强调文本	 	 
<style></style>	引用样式	不可嵌套任何元素	type,media
<sub></sub>	下标	 	 
<sup></sup>	上标	 	 
<table></table>	表格	只可嵌套表格元素	width,align,background,cellpadding,cellspacing,summary,border
<tbody></tbody>	表格主体	只用于table	 
<td></td>	表格中的单元格	只用于tr	colspan,rowspan
<textarea></textarea>	多行文本输入控件	 	name,accesskey,disabled,readonly,rows,cols
<tfoot></tfoot>	表格表尾	只用于table	 
<th></th>	表格中的标题单元格	只用于tr	colspan,rowspan
<thead></thead>	表格表头	只用于table	 
<title></title>	文档标题	只用于head	 
<tr></tr>	表格行	嵌套于table或thead、tbody、tfoot	 
<ul></ul>	无序列表	只能嵌套li	

###内容语义

内容类型决定使用的语义标签
在网页中某种类型的内容必定需要某种特定的HTML标签来承载，也就是我们常常提到的根据你的内容语义化HTML结构。
加强“资源型”内容的可访问性和可用性
在资源型的内容上加入描述文案，比如给img添加alt属性，在audio内加入文案和链接等等。
加强“不可见”内容的可访问性
背景图上的文字应该同时写在html中，并使用css使其不可见，有利于搜索引擎抓取你的内容，也可以在css失效的情况下看到内容。

适当使用实体
以实体代替与HTML语法相同的字符，避免浏览解析错误。
字符	名称	实体名	实体数
"	双引号	&quot;	&#34;
&	&符	&amp;	&#38;
<	左尖括号（小于号）	&lt;	&#60;
>	右尖括号（大于号）	&gt;	&#62;
 	空格	&nbsp;	&#160;
　	中文全角空格	 	&#12288;
