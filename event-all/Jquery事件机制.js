#Jquery事件机制深入解析

---
本文以jquery-1.11.1为分析对象

###Jquery event源码结构

	- jquery常用工具函数 jquery.event
	- jquery.Event 事件对象
	- 事件特例 mouseover等
	- 事件公共接口 on,bind,unbind,off,trigger等
	- 常用事件的便捷接口 click,select,change,等


###事件绑定深入分析

1.事件绑定API
从源码中可以看出，jquery中绑定事件有三种方式
- 常用事件的便捷接口：click,select,change:8000
- on，one接口
	1.11.1版本暴露到公共接口中的函数，
- bind，delegate接口
	从源码的位置来看，保留这几个接口应该是为了兼容旧版本
以上绑定事件接口的本质都是调用on方法

2.on函数
on函数的主要作用处理不同的参数类型，为了方便接口的使用，以及灵活传递参数，on函数对不同个数不同
类型的参数，进行解析，统一传递并调用jQuery.event.add( this, types, fn, data, selector )（遍历调用，this是jquery选择器中的dom）;
on函数内部也处理了一次绑定多个函数的对象参数格式。
以及处理one函数的情况，对fn进行包装，在fn执行前，先执行off方法（也就是接触当前事件绑定）

3.jQuery.event.add
add函数是事件绑定的核心实现。
参数说明：
	elem：事件绑定的dom
	types：绑定的事件类型
	handler：绑定的事件函数（实际执行的fn）
	data：传递的数据
	selector：委托选择子

通过 jQuery._data( elem )取出dom的内存缓存数据elemData，如果没有缓存数据，则返回（？）
取得或初始化dom上的事件列表events = elemData.events 
获取或初始化eventHandle = elemData.handle,eventHandle是真正绑定到dom上的函数
eventHandle的核心代码是：jQuery.event.dispatch.apply( eventHandle.elem, arguments ) :

对事件的type处理，部分特殊type会进行type转换

包装handleObj对象：
		jQuery.extend({
			type: type,
			origType: origType,
			data: data,
			handler: handler,
			guid: handler.guid,
			selector: selector,
			needsContext: selector && jQuery.expr.match.needsContext.test( selector ),
			namespace: namespaces.join(".")
		}, handleObjIn );
取出type对应的handlers数组（events[ type ]），如果为空，则说明未对dom绑定过type事件，则将eventHandle函数绑定到dom的type事件上（addEventListener/attachEvent）
根据selector判断是否是委托事件，如果是委托事件，则存入delegateCount对应的位置，否则则push，这样能保证委托事件在全局事件的前面。
（这个设计十分巧妙，用一个数组加一个变量进行分类，完成一般情况下需要两个数组完成的事情，这个变量有点类似游标的意义）

总结一下：jquery的事件绑定，并没有将fn直接绑定到dom中，而是通过一个通用函数绑定到dom中，每个dom每种类型事件只绑定一次。而事件的fn则存入到dom的内部缓存对象中。
jquery._data(dom)[type]:['handleObj'];handleObj是一个包装的handler对象，包含数据，fn，selector等等。


###事件触发深入分析
jquery事件触发的代码相对清晰一点，核心函数是：jQuery.event.dispatch

1.jQuery.event.dispatch
首先通过jQuery.event.fix函数，对原生event对象进行包装，包装为jqueryEvent，$Event对象实现了部分W3C三级dom规范，以及处理了部分跨浏览器坐标兼容问题
通过jQuery._data( this, "events" ) 取出type对应的handlers数组，
通过jQuery.event.handlers对handlers进行归纳排序（根据委托节点的深度以及绑定的先后顺序）
handlerQueue数组为两级数组
	[
		{
			elem:'',
			handlers:[{},{}]
		}
	]
第一级根据委托的dom层级来分类，层级越深，index越靠前。第一级根据isPropagationStopped是否冒泡，来判断是否执行
第二级，则是保存同一层dom的handlers，handler绑定的越早，越靠前。第二级根据isImmediatePropagationStopped，来判断是否停止执行（Immediate同时也会导致停止冒泡）
最终遍历handlerQueue,
event对象层层传递
根据上面的规则，使得事件的触发，优先从底层的handler执行，越早绑定的优先级越高
同事判断
2.jQuery.event.fix
fix的兼容性分析

3.jQuery.event.handlers
以event.target为起始dom，逐渐往父级dom递归，直到dom为绑定的dom位置
每一级dom，遍历event[type],如果dom包含selector对应的dom，则将handler存入当前Queue对象的handlers中

###解除事件绑定分析

###事件命名空间实现分析

###trigger实现分析


