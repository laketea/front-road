AngularPublic.js

===
这个文件主要是 用来public angular对象
这个对象也是用户操作的唯一全局对象
主要功能，就是将所有的功能接口方法函数等注册到angular对象上面

### 注册功能函数

	extend(angular,{
		.... 
	})
	..
	这个地方显然是一个扩充点
	可以将一些常用的方法注册到 angular对象上面··、

### 注册 ngLocale模块以及ng模块

	1.获取模块加载器，同时也生成了angular对象，并且注册了angular.module方法
	angularModule = setupModuleLoader(window);

	2.注册ngLocale

	3.注册ng模块

		ng模块注册指令

		 $provide.provider('$compile', $CompileProvider).
        	directive({
        		a:'//',
        		...
        		...
        	})

        ng模块注册服务
        	$provide.provider({
        		$animate:'',
        		..
        	});

        这种方式统一注册 指令以及服务，对应目前的代码组织或许可以借鉴

