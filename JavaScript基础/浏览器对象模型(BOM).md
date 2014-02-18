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
window对象有两重身份，一个是js浏览器的接口，一个是ECMAScript的global对象。

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
	
	
                                                                                                                                   
	
	


