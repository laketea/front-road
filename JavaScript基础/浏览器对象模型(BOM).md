# 浏览器对象模型
===

BOM也就是浏览器模型对象，  
BOM由多个对象组成，而window对象是BOM的顶层对象，其他对象都是该对象的子对象  
BOM结构如下：

	- window
		- document
		- frames
		- history
		- location
		- navigator
		- screen
		
##一.window
window对象有两重身份，一个是js访问浏览器的接口，一个是ECMAScript的global对象。

在全局作用域上声明的变量函数等都是window的属性或方法，这样定义的属性或变量有一个名为[[Configurable]]的特性（false），不可以通过delete删除，但是直接在window中定义的属性或方法可以通过delete删除。

	//IE<9 使用 delete 会报错
	var age = 10;
    var getName = function(){
        return this.name;
    };
    window.name = 'Jim';
    function getAge(){
        return 'fk';
    }
    console.log(delete window.age);//false
    console.log(delete window.getName);//false
    console.log(delete window.getAge);//false
    console.log(delete window.name);//true
    console.log(window.getAge());//fk
    console.log(window.getName());//jim
    
##### 窗口位置
ie,opera,chrome中screenLeft和screenTop中保存的是屏幕左上角到window对象表示的页面的距离，
而firefox与safari中表示的是整个浏览器窗口相对于平面左上角的距离。无法精确的获取窗口位置,但是可以通过moveTo或by可以精确的移动到
某个位置。

	window.screenLeft;//ie,opera,chrome,safari
	window.screenTop;//ie,opera,chrome,safari
	window.screenX;//firfox,chrome,safari
	window.screenY;//firfox,chrome,safari、
	//以下两个方法，在ie7+以及opera中默认禁用，且只使用与最外层的window
	window.moveTo(0,0)// 移动到某个位置，all
	window.moveBy(0,0)// 移动传入的距离，all
	//跨浏览器获取坐标的方式
	var leftPos = (typeof window.screenLeft =='number')?window.screenLeft:window.screenX;
	var topPos = (typeof window.screenTop =='number')?window.screenTop:window.screenY;
	
##### 窗口大小
由以下API可以看出，部分浏览器无法获取浏览器窗口的大小，但是可以获取页面视口的大小，
并且也可以设置浏览器窗口的大小。

	//IE9_,safari,firefox中表示页面试图区的大小
	//chrome表示viewport的大小
	window.innerWidth/innerHeight
	
	//IE9_,safari,firefox中表示浏览器窗口本身的大小
	//chrome表示viewport的大小                                                                                                                                                                                                                                                                                                                   
	window.outerWidth/outerHeight
	
	//ie(除ie6混杂模式外),firefox,safari,opera,chrome 中表示页面视口的大小
	document.documentElement.clientWidth/clientHeight;
	
	//IE6混杂模式
	document.body.clientWidth/clientHeight;
	
	//以下两个方法，在ie7+以及opera中默认禁用，且只使用与最外层的window
	window.resizeTo(100,100) // 调整浏览器窗口大小到
	window.resizeBy(100,100) // 调整高度与宽度差
		
##### 打开窗口       
	window.open(url,..)
	
##### setTimeout与setInterval
略（深坑后续分析）           

##### 系统对话框
	alert(message);//提示框
	confirm(message);//有返回值，tru确认，其他cancel
	prompt(message,defaultVlaue);//提示用户输入,返回值为输入的值，如果用户通过ok以为的方式关闭窗口，则返回null
	find();//显示查找对话框
	print();//显示打印对话框                                                                                                                                 
	
	
##二。location
location提供了当前窗口中加载的文档相关信息以及一些导航功能。location即是window的对象也是document的对象。
下面以url（http://www.laketea.com:80/news/1.html#content?q=js）为例介绍其所有属性：

	- hash //返回url中的hash，若不包含hash则返回空字符串 '#conent'
	- host //返回服务器名称以及端口号 'www.laketea.com:80' 
	- hostname //返回服务器名称 ‘www.laketea.com’
	- href //返回页面的完整url,toString返回返回的值一样 ‘http://www.laketea.com:80/news/1.html#content?q=js’
	- pathname //返回url中的目录 ‘/news/1.html’
	- port //返回端口 '80'
	- protocol //返回协议 'http:'
	- search //返回url中的查询字符串,以问号开头 '?q=js'	
#####解析查询字符串参数
location并没有提供查询字符串中的参数解析方法，可参考如下方法

	function getQueryStringArs() {
        var qs = (location.search.length > 0 ? location.search.substring(1) : ''),
                args = {},
                items = qs.length ? qs.split('&') : [],
                item = null,
                name = null,
                value = null;

        for(var i= 0,len=items.length;i<len;i++){
            item = items[i].split('=');
            name = decodeURIComponent(item[0]);
            value = decodeURIComponent(item[1]);
            if(name.length){
                args[name] = value;
            }
        }
        
        return args;
    }	

#####位置操作
以下语句都会使得当前页面以新的url加载(hash除外),并且浏览器的历史记录会生成一条记录，可以通过浏览器的后退按钮返回。

	location.assign('www.laketea.com') //
	window.location = 'http://www.laketea.com';
	location.href = 'http://www.laketea.com';//必须加协议名称,否则当成相对路径
	location.hash = '#conent';//除外
	location.search = '?q=jss';
	location.hostname = 'www.laketea.com';
	location.pathname = 'mydir';
	location.port = 8080;
	
replace方法会加载新的url，但是不会在历史记录中生成新的记录，后退无效。

	replace('http://www.baidu.com')
	
reload方法，作用是重新加载当前页面，不传参数则，判断页面是否改变来决定从缓存中还是从服务器加载，如果传入true，则强制从服务器重新加载
	
	reload();//可能从缓存
	reload(true);//从服务器

## 三.frames
window.frames,如果页面包含框架，则每个框架里的页面的window包含在父页面的frames中，通过数值（0开始，从左到右，从上到下）或框架名称来访问。  

**window.top**对象始终指向最高层的window  
**window.parent**指向父window，如果没有框架，则=当前window  
**self** 指向当前页面的window  

	注意：每个框架都有自己的一套构造函数，这些构造函数一一对应，但是并不相等。
	top.Object 不等于 top.frames[0].Object, 主要影响到instanceof操作符

//一种获取iframe window的方式
this.$("iframe")[0].contentWindow

	
## 四.navigator
提供识别客户端浏览器的信息

## 五.screen
screen对象主要保存一些显示器的信息，

## 六.history
history对象保存用户上网的历史记录（当前窗口）。开发人员无法获取访问列表，但是可以实现后退，前进，以及获取历史记录总数

	history.go(-1);//后退一页
	history.go(1);//前进一页
	history.go(2);//前进两页
	//如果传入的参数是字符串，则从历史记录查找包含该历史记录的位置，如果包含，则调整到最近的位置，如果不包含，则什么也不做
	history.go('www.baidu.com');	
	history.back();//后退
	history.forward();//前进
	history.length // =0，则可确定当前页面是打开窗口后的第一个页面
	













                         
 
                                                                                                          
	
	


