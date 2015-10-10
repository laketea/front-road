open-stf前端数据分析

---

#一。与后台请求接口

- 权限相关 auth/index.js
	登录接口
－ app数据 

－ 主websocket
－ 图片websocket


#二。devices分析

##view分析：

－ device-list-stats 设备状态统计
－ device-list-icons 设备列表（icon）
－ device-list-details 设备列表（表格）

DeviceListDetailsDirective指令分析

主要分析点击单个手机的逻辑:
从代码可以看到，打开手机操作界面有多种方式：

点击区域为图片： 直接router到设备操作界面
alt + 点击其他区域： invitedevice （）
shfit ＋ 点击其他区域： 弹出一个新的手机操作界面 StandaloneService.open(device)

手机link为：#!/control/6326ec7c


	element.on('click', function (e) {

        var id

        if (e.target.classList.contains('thumbnail')) {
          id = e.target.id
        } else if (e.target.classList.contains('device-status') ||
          e.target.classList.contains('device-photo-small') ||
          e.target.classList.contains('device-name')) {
          id = e.target.parentNode.parentNode.id
        }

        if (id) {
          var device = mapping[id]

          if (e.altKey && device.state === 'available') {
            inviteDevice(device)
            e.preventDefault()
          }

          if (e.shiftKey && device.state === 'available') {
            StandaloneService.open(device)
            e.preventDefault()
          }

          if (device.using) {
            kickDevice(device)
            e.preventDefault()
          }
        }
      })


##数据流分析
核心数据代码如下：
  $scope.tracker = DeviceService.trackAll($scope)
  $scope.control = ControlService.create($scope.tracker.devices, '*ALL')
tracker作为设备数据容器，层层往下传递
control是前端设备操作类，提供所有对设备操作的接口

###DeviceService
/res/app/components/stf/device/
这个service主要处理所有的device数据
devices数组中，缓存了所有的设备数据

里面包含两个主要的类：

-Tracker
tracker其实是设备的容易类，提供获取/查询/增加/删除 设备的功能
tracker含有 devices数据的饮用，也就是说每一个tracker实例，都饮用了devices数组
tracker监听socket的设备信息，与适时更新设备数据
	scopedSocket.on('device.add', addListener)
    scopedSocket.on('device.remove', changeListener)
    scopedSocket.on('device.change', changeListener)

tracker的fetch 是fetch单个数据
device数据更改后，都会在tracker上触发对应的事件


-deviceService
	主要由如下接口：

		trackAll
			绑定$scope,如果数据更新，则触发scope的脏值检测,
			且会调用/app/api/v1/devices接口，获取devices数据，并插入devices中
		trackGroup
			与trackgroup类似，但是group？不太理解
		load
			'/app/api/v1/devices/' + serial
			从后台接口获取单个设备的数据
		get
			获取单个设备的track数据

－socket
/res/app/components/stf/socket/
socket-service 使用socket.io建立连接，

	var websocketUrl = AppState.config.websocketUrl || ''

  	var socket = io(websocketUrl, {
    	reconnection: false, transports: ['websocket']
  	})


###ControlService
ControlService只有一个接口，也就是创建controller服务的实例接口，
传入的参数为：target,channel
target：为设备数据，可以是一组，也可以是单个，
channel：频道， ＃all等

controllerservice 是对socket设备基础操作接口的封装（按下，划过，打开home，打开浏览器等等）
所有操作接口都会发送socket数据

	function sendOneWay(action, data) {
      socket.emit(action, channel, data)
    }

    function sendTwoWay(action, data) {
      var tx = TransactionService.create(target)
      socket.emit(action, channel, tx.channel, data)
      return tx.promise
    }

 transaction－service
 应该是手机操作的事务处理：
 简单点说：发送一个操作命令后，需要promise判断何时开始结束等


#三。control分析（单个手机操作界面）
control主要是处理手机操作界面

##Views

	control-panes.html - ControlPanesHotKeysCtrl
		//独立设备界面，仅独立窗口时可见
		control-panes/device-control/device-control-standalone.jade

		//标准设备控制界面
			//默认设备界面
			control-panes/device-control/device-control.jade - DeviceControlCtrl
				//device-context-menu 右键彩蛋
				//device-screen 设备屏幕核心类
				//
			//两个tabs操作界面，
			nice-tabs

##DeviceControlCtrl
入口ctrl
topTabs //top标签页
belowTabs //下部标签页

通过getDevice获取单个设备的tracker（也就是scope.device）
并根据device创建 control控制对象

##ControlPanesHotKeysCtrl
比较简单，绑定一些快捷操作

##DeviceControlCtrl
对设备界面，坐一些简单的处理，如选择其他设备，剔出设备等



##涉及到的第三方库

oboe
	json http库，可直接对json后的数据遍历

eventemitter3
	js事件







