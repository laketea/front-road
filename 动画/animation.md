# 前端动画原理与实现

---

> 主要参考[月影的ppt分享](http://matrix.h5jun.com/slide/show?id=117#/)    
动画的本质:
> - 定时器改变元素的属性
> - 浏览器/GPU的渲染过程

动画的种类:
- JavaScript 动画
    DOM 动画
    Canvas 动画
- CSS3 动画
    transition
    animation
- SVG 动画

## Javascript动画
### 原理
实现动画，有两种方式，
一种是定义速度的方式（逐帧）,由于javascript单线程阻塞模式的限制，通过requestAnimationFrame(setTimeout,setInterval)，很难保证某一个动画的frame，严格按照固定的时间间隔执行，特别是 动画中，存在多个动画动作时，会导致每一个time延迟执行，而这个延迟执行是不可预期的，导致动画混乱。
所以，为了保证精确控制动画，应该使用时间与动画联系起来。
另外一种，根据当前时间在总时间上的进度，来决定位移的距离

举个例子：

//方式1:增量方式
requestAnimationFrame(function change(){
    self.style.transform = "rotate(" + (deg++) +"deg)";
    requestAnimationFrame(change);
  });

//方式2: 时间方式
block.addEventListener("click", function(){
  var self = this, startTime = Date.now(),
      duration = 1000;
  setInterval(function(){
    var p = (Date.now() - startTime) / duration;
    self.style.transform = "rotate(" + (360 * p) +"deg)";
  }, 1000/60);
});

 方式1: 逐帧方式
 逐帧方式 可以保证每一帧都执行，但是由于js的特性，会导致每一帧的执行间隔不一致， 所以预期是一秒钟完成的一周，可能会延迟到2秒
 1 －20ms－ 2 -30ms- ........ -xx360

 方式2: 时间方式
 时间方式，可以保证动画在规定的时间内完成，根据当前时间在总时间上的进度，来决定位移的距离，不延迟，但是有可能掉帧，


### API 
javascript 实现动画有两种api
定时器: setTimeout/setInterval,传统方式，兼容性较好
animation-timing接口: requestAnimationFrame (https://www.w3.org/TR/animation-timing/)
RAF，raf的执行完全由浏览器决定,浏览器在每次需要重新绘制动画前,会调用这个参数所指定的函数，浏览器的刷新频率大概在66-75之间，每秒重绘65-75之间，
但是RAF也是运行在js主线程上，所以也不能完全保证raf按照固定的频率执行，特别是主线程繁忙的时候
优点:
- 对于一个侦中对DOM的所有操作，只进行一次Layout和Paint（在重绘前，执行所有的RAF传递的函数，然后再进行重绘制）
- 如果发生动画的元素被隐藏了，那么就不再去Paint。

RAF仅ie10+支持，我们项目需要支持IE9,可以对raf做个简单的模拟\

    window.requestAnimationFrame = window.requestAnimationFrame
    || window.mozRequestAnimationFrame
    || window.webkitRequestAnimationFrame
    || window.msRequestAnimationFrame
    || window.oRequestAnimationFrame
    || function(callback) {
    setTimeout(callback, 1000 / 60);
    };

#### 单线程阻塞模型



### 封装
列举下常见的运动：
匀速运动：s = S*P;
匀加速运动：s = S*P*P;
匀减速运动: s = S*p*(2-p)
圆周运动x轴: s = S*cos(wt)
圆周运动y轴: s = S*sin(wt)

从上面的方程可以得到: e = E(p); e就是缓动函数(easing)
从上面我们可以简易的封装，动画的主要要素:

- 动画时长： T = duration(总时长)
- 动画进程： p = t/T ( 0<P<1)
- 缓动函数:  easing = f(p);//不同的运动规律缓动函数不同
- 过程函数:  progress = h(f(p))
- 动画方程： [x,y] = g(T,progress,easing);
- 动画生命周期：开始、进行中、结束。

根据以上的总结 我们可以封装一个动画类

 function Animator(durtion,progress,easing){
 	this.duration = duration;
 	this.progress = progress;
 	this.easing = easing || function(p){return p;}//默认匀速运动
 }

 Animator.prototype = {
 	//暂时只做最简单的视线
 	start:function(){
 		var startTime = Date.now(),
 			duration = this.duration,
 			self = this;

 		requestAnimationFrame(function step(){

 			var currentTime = Date.now();

 			var p = (startTime - currentTime) / duration;

 			if(p<=1){
 				self.progress(self.easing(p),p);
 				step();
 			}

 		})
 	}
 }

