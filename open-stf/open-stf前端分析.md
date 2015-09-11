open-stf前端分析.md


==

主要模块：

- layout
device-list
control-panes
menu
settings
docs
user
common/lang
stf/standalone


===


1.layout

2.device-list

2.1devcie-list
	
	$scope.tracker = $scope.tracker = DeviceService.trackAll($scope)

	/sft/device/device-service.js


	Tracker继承了 EventEmitter 一个event事件框架,
	tracker里面会缓冲设备数据

	设备数据从socket中获取

	scopedSocket = socket.scoped($scope)
	scopedSocket.on('device.add', addListener)
    scopedSocket.on('device.remove', changeListener)
    scopedSocket.on('device.change', changeListener)


    这里的socket是一个服务
    stf/socket-service.js，在scoket被注册到angular容器的时候，就会创建一个webscoket链接,
    socket.scoped方法的作用？使用的scope销毁的时候，清除对于的linstener，控制内存
    == 一个良好的模式，可以借鉴

2.2device-list-stats 设备列表的状态总和
	
	tracker事件机制，可以注册 设备的添加，修改，删除事件

	tracker的linstener没有调用dirtycheck，故手动通过dom来更新数值（性能优化）


3.control-panes
	单个设备的控制

	control－panes-controller.js
	这个ctroll是设备控制功能的主ctrl，通过devicefactory来获取设备数据，然后新建control，

	control／control－service.js 设备控制服务 ，提供所有对设备操作的接口
	screen/screen-directive 设备屏幕的指令,监听页面上的事件来调用control的接口
	screen/screen-directive 指令中，会新建立一条websocket，在websocket的事件里面，会通过canvas来drawimage


核心类

	socketservice //创建主通信websocket
	deviceservice //设备服务，缓冲设备数据
	controlservice //设备控制服务，提供设备操作接口
	screen-directive //设备屏幕区域指令，监听mouse操作事件，创建屏幕图片传输的websocket，接受数据并绘图





