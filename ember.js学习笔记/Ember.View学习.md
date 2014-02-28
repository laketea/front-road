#Ember.View学习
===

Ember.View 这块相对来说比较简单，view的主要功能是将原始事件转换为应用事件，转发给控制器。  
一般在如下两种情况，需要用到View:

- 处理复杂的事情
- 构建可重用的组件


### 一。基本功能
基本功能跟Backbone的view差不多，但是这块的view不处理业务逻辑，事件交给控制器层处理，而不像之前的backbone，如果没注意的话，经常会在view中写controller的处理。



#####自定义tag
两种方式，view中定义，或者模板中设置	

	App.MyView = Ember.View.extend({
	  tagName: 'span'
	});

	{{view App.InfoView tagName="span"}}

#####className绑定
类似以上两种方式

	App.MyView = Ember.View.extend({
	  classNameBindings: ['priority'],
	  priority: 'highestPriority'
	});
	{{view App.AlertView classBinding="isUrgent priority"}}

#####属性绑定
类似以上两种方式

	App.MyView = Ember.View.extend({
	  attributeBindings: ['href'],
	  href: "http://emberjs.com"
	});

	<input type="checkbox" {{bind-attr disabled=isAdministrator}}>

#####绑定事件
一种：直接添加事件名称对应的方法.很简单。
另外一种：在eventManager方法里面定义。

疑问：如何支持对子dom的事件处理呢(click .table.tr.td)。
难道只能通过定义子view，当然通过下面的嵌套view，定义一个very easy的子view，然后在模板中设置子view模板，再在子view中处理事件。
或者在event中判断原始事件对象来处理·· 
但是这种方式显然还是没有(click .table.tr.td)方便。

	App.ClickableView = Ember.View.extend({
	  click: function(evt) {//evt,jquery event对象
	    this.get('controller').send('turnItUp', 11);
	  }
	});

	AView = Ember.View.extend({
		doubleClick:function(event){
			//像这种情况，这个方法就永远不会被调用
		}
	  eventManager: Ember.Object.create({
	    doubleClick: function(event, view) {
	    	//event，jquery event对象，view是事件触发的view，有可能是当前view，也可能是子view.
	    	//如果eventManager中定义了事件，则优先级大于当前view直接定义的事件名方法，view中直接定义的事件方法则不会被触发。
	    	//如果父view的eventManager定义的事件方法，子view也定义了相同事件名对应的方法，则当前方法的优先级大于子view对应方法的优先级，子view对应的方法不会call。
	    }
	  })
	});



#####View嵌套
一种是:view的定义之间没有关系，直接在父view的template里面插入其他view,这种方式呢，可以在template直接使用子view的template，也可以在template里面设置子view的template
	
	<script type="text/x-handlebars" data-template-name="user">
	  User: {{view.firstName}} {{view.lastName}}
	  {{view App.InfoView}}// 直接使用子view的默认方式
	</script>

	<script type="text/x-handlebars" data-template-name="user">
	  User: {{view.firstName}} {{view.lastName}}
		{{#view App.InfoView}}//直接在template里面指定子view的template
		  <b>Posts:</b> {{view.posts}}
		  <br>
		  <b>Hobbies:</b> {{view.hobbies}}
		{{/view}}
	</script>

另外一种是：父view的内部定义了子view的属性，那么在tempate中使用，则对view必须使用一个相对的名称({{view view.infoView}})

	App.UserView = Ember.View.extend({
	  firstName: "Albert",
	  infoView: Ember.View.extend({
	    templateName: 'info',
	    hobbies: "Riding bicycles"
	  })
	});

	User: {{view.firstName}} {{view.lastName}}
	{{view view.infoView}}

疑问：子view如何访问父view的属性与方法呢（包过在template中）

#####布局模板与内容模板
View可以定义两种模板，布局模板与内容模板，分别通过layoutName,templateName指定。
解析的时候，内容模板会插入到布局模板中{{yield}}指定的位置.
疑问：理论上说也可以合在一起，布局提供的功能比较简单，只提供了一个插口，而且没看到动态修改内容模板的功能，难道是为了不同的view之间layout或者template重用

	<script type="text/x-handlebars" data-template-name="my_layout">
	  <div class="content-wrapper">
	    {{yield}}
	  </div>
	</script>

	<script type="text/x-handlebars" data-template-name="my_content">
	  Hello, <b>{{view.name}}</b>!
	</script>

	//生成的html
	<div class="content-wrapper">
	  Hello, <b>Teddy</b>!
	</div>

#####View容器
容器View 感觉应该是一种类数组嵌套view功能，类数组的方式对子view处理，包过在运行时中添加，删除子view的功能。  
渲染时，子view会根据在childview的顺序以此加载进容器view的html中。  
ContainerView不支持templdate与layout等template属性（不支持模板与布局），他的html只会加载子view的html。 
疑问：类数组，感觉还是不够灵活，不支持模板，所有不能通过指定位置outlet的方式放入，当然也可能是我想太多

初始化定义子view有两种方式:

	//通过init函数中，pushObject方式
	init: function() {
	    this._super();
	    this.pushObject(App.FirstView.create());
	    this.pushObject(App.SecondView.create());
	  }

	通过定义childViews属性
	var container = Ember.ContainerView.extend({
	  childViews: [App.FirstView, App.SecondView]
	  //或者
	  //childViews: ['firstView', 'secondView'],
	  //firstView: App.FirstView,
	  //secondView: App.SecondView
	});

可编程的方式处理子view就比较灵活了，由于mix了Ember.MutableArray的功能，所以可以通过MutableArray的数组API来处理子view

	container.get('firstView')
	pushObject, popObject, shiftObject, unshiftObject, insertAt, removeAt

#####内建View
一些表单等。略。


### 二。总结
基本功能呢跟backview差不多，这里特别地方有三处：嵌套View，布局与内容模板，View容器。那么这三个功能的典型应用。。。。
	



	



