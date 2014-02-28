#Todos分析
===

从Todos来看，已经实现的核心功能如下:

#### 路由功能
路由的主要功能是管理应用程序状态，在状态改变时，处理url以及controller以及template之类的展示,
也就是说，目前页面状态的改变都是路由驱动的（不知道是否理解正确）···

#####路由核心设置(绝大部分遵守约定命名规则):
-path: 也就是设置url与router的映射，在跟router map中设定
-template: 在renderTemplate中重写
-controller: 重写renderTemplate方法来实现加载指定的controller
-model: 从例子来看，都是从router这一层就指定了对应router的model模型数据，setup中默认指定model到controller,对应一些比较大的应用，数据复杂的情况下如何处理呢？


#####setupController方法
这个方法主要是处理当前router的model以及controller，而model其实是传递给controller使用的。默认根据约定来设置。

	setupController: function(controller, model) {
		//设置当前controller的model
    	controller.set('model', model);

    	//可以设置其他controller的model
    	this.controllerFor('topPost').set('model', model);
  	}

#####renderTemplate方法
主要是处理加载渲染模板相关,默认根据约定来设置，如下所示，自定义此方法后可以指定加载的outlet以及template以及controller

	renderTemplate: function() {
	    this.render('favoritePost', {   // the template to render
	      into: 'posts',                // the route to render into
	      outlet: 'posts',              // the name of the outlet in the route's template
	      controller: 'blogPost'        // the controller to use for the template
	    });
	    this.render('comments', {
		      into: 'favoritePost',
		      outlet: 'comment',
		      controller: 'blogPost'
	    });
  	}


路由可以指定path，controller，template，model，大部分都是根据约定来自动指定。 
以下为自定义设置的方法:
model:通过model属性设置
path:目前是通过跟路由来设置,
controller:renderTemplate中设置路由用到的controller
template:renderTemplate中设置路由用到的template


模板中通过设置 link-to实现，但是如果通过程序的方式主动路由到其他地址呢？




