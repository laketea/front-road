# 行高与对齐

## 基本概念

在了解这两个属性之前先了解一些基本概念.
#### 内联元素辅助线
下图辅助线的位置仅适用于与不可替换内联元素
- baseline 小写英文字母x底端所在的水平线
- middle 小写英文字母x中部所在的水平线
- text-top 字符最高顶端所在的水平线
- text-bottom 字符最底端所在的水平线
- top line-height高度的顶端
- bottom line-height高度的低端
- sub 上标
- super 下标

#### 行距与半行距
文本的高度 ＝ 基线上方的高度 + 基线下方的深度
行距其实分为两部分，一般在文字的上方，一般在文字的下方
行距 ＝ 字体的line-height - 文本的高度
如果line-height小于文本的高度则，可能导致多行字体重叠

#### 内容区(content area)
对于可替换内联元素的内容区，我们可以理解为文字所占据的区域，在chrome 开发工具，select element时可以看到这个区域  
至于这个区域的具体高度，规范并没明确.  
但是从规范中下面这句话，我们可以推测内容区域高度应该是从 文字的上标/下标 或者 text-top/text-bottom  

	一个内联的不可替换盒的竖直padding，border和margin从内容区的top和bottom开始，并且与'line-height'无关

#### 行内盒(inline box)
就是每一个内联元素对应的区域，对于不可替换元素，他所在行内狂的高度取决于line-height ,对于可替换的内联元素，他的高度取决于与替换的内容  

#### 行盒(line box)
由内联元素组成的一行所在的框为行盒，

## line-height

line-height应用在不同类型的元素上，作用不同:

- 块容器元素: line-height用来指定此容器内行盒的最小高度(我们可以假设存在strut，宽度为0的默认字体)  
- 不可替换的内联元素: line-height用来指定此内连元素的高度，此高度会影响此内联元素所在行盒的高度  

从css规范可以看到此属性的基本属性:  

- 值类型: normal | <number> | <length> | <percentage> | inherit  
- 初始值: normal 
- 应用元素: 所有元素
- 是否可继承: 可继承
- 百分比参照: 参考元素自身的字体大小
- 计算值: 对于<length>和<percentage>是绝对的值，否则与指定值相同

line-height取值以及继承性:

- normal 不同浏览器的初始值不一样，但是基本可以认为 初始值也是number,继续性同number元素
- number 可以理解为缩放因子，参考元素的font-size大小,继承number，根据自身元素的number/font-size计算出行高
- length 绝对值(包含px em等单位),继承绝对值
- percetage 百分比,参考元素的font-size大小,将父元素的percent*font-size 得出的绝对值继承下来
- inherit 继承

从此属性的继承性来看，所有的元素都拥有line-height属性(这一点非常重要，在后面会具体说明这点的重要性)
line-height属性的作用主要是影响内联元素所在内联级盒的高度，以及内联元素所在行盒的高度，下面我们主要分析下其高度的计算方式:

### line-height对内联级盒高度的影响
注意：内敛元素对应的内敛级盒的高度，不一定等于内联元素的高度，除了内敛元素的高度可能还会包含margin等
* 对于不可替换内联元素，其内联级盒的高度就是line-height
* 对于可替换元素,inline-block元素和inline-table元素，其内联级盒就是其margin box的高度

### line-height对行盒高度的影响
* 内联级盒是根据其'vertical-align'属性竖直对齐的，行盒必须以最小的高度包含满足各种vertical-align属性的内联级盒    
* 行盒高度是最高的内联级盒的top与最低的内联级盒的bottom之间的距离    

## vertical-align

vertical-align一般作用在内联元素上，该属性会影响该元素对应的内联盒所在行盒其内部的竖直定位。     
vertical-align默认值为baseline.     
这里我们要注意下，vertical-align影响的不只是当前元素盒的竖直定位，也可能会影响行盒内部其他内联盒的竖直定位。    
当然，vertical-align最直接的作用，在于将当前元素的盒与行盒区域竖直对齐，我们如何确定判断当前元素用于对齐的盒呢？对于内联的不可替换元素，用于对齐的盒是那个高度为'line-height'的盒。对于其它所有元素(可替换内联元素，inline-block等)，用于对齐的盒都是margin box。      

vertical-align属性值有多种，一般将属性值分为两组.    
第一组属性值，是将当前元素的盒与行盒的line-height区域对齐（或者也可以说是strut区域对齐）

- baseline
	把盒的基线与父级盒的基线对齐。若该盒是可替换元素生产的盒，则该盒该盒没有基线(不可替换内联元素生产的盒)，就把bottom margin边和父级的基线对齐
- middle
	把该盒的竖直中点和父级盒的基线加上父级的半x-height对齐。若该盒是可替换元素生产的盒，竖直中点是margin box的中点，
- sub
    把该盒的基线降低到合适的位置作为父级盒的下标（该值不影响该元素文本的字体大小）
- super
    把该盒的基线提升到合适的位置作为父级盒的上标（该值不影响该元素文本的字体大小）
- text-top
	把该盒的top和父级的内容区（content area）的top对齐
- text-bottom
	把该盒的bottom和父级的内容区的bottom对齐
- <percentage>
	把该盒提升（正值）或者降低（负值）这个距离（'line-height'值的百分比）。值'0%'表示与“基线”相同
- <length>
	把该盒提升（正值）或者降低（负值）这个距离。值'0cm'表示与“基线”相同

第二组属性值，是将当前元素的盒与行盒对齐
这里要注意，当前元素的盒与行盒对齐，而不是与行盒的line-height(strut)区域对齐,理解这点非常重要。

- top
	把对齐子树的top与行盒的top对齐
- bottom
	把对齐子树的bottom与行盒的bottom对齐

## 行盒的高度以及内部的竖直布局
在了解了line-height以及vertical-algin高度后，我们可以知道这两个属性影响的是行盒高度的计算，以及行盒内部，子内联盒的垂直布局.  
行盒的高度如何计算以及内部元素如何垂直布局:

* 行盒从父元素中继承'line-height'以及'font'，由此两个属性，可以确定每一个行盒都有一个绝对的line-height值, line-heiht完全由父元素继承计算而来，不受子内敛元素的高度改变而改变,为了方便理解，我们假设行盒内先包含一个空的不可替换内联元素(strut)，此元素line-height属性继承自行盒。
* 行盒中的内联盒子盒中,所有'vertical-align'属性为第一组类型的盒子 相对于strut对齐,所有'vertical-align'属性为第二组类型的盒子相对行盒的对齐，如果同时包含多个两种类型的盒子，strut的竖直位置也就是行盒的baseline位置很难确定，规范中关于这一点也没有明确的规范
* 行盒中，最高盒子的top与最低盒子的bottom就是行盒的高度

## 示例

下面我们从浅入深的分析行盒的布局
#### demo1：图片与容器的空白区域
代码：

	<h2>demo1：图片与容器的空白区域</h2>
	<div id="demo1" style="border:1px solid #ccc;width:300px;">
	    <img height="100" src="http://img.mp.itc.cn/upload/20160323/ebfce2b87c7a4a8cbe9bd43b592aa22c_th.jpg" />
	</div>

效果：    
![行盒高度109px](https://raw.githubusercontent.com/laketea/front-road/master/html&css/images/demo1-1.png)

为何图片与容器底部会有一定的空白？
image为不可替换内联元素，image的默认vertical-algin为baseline,故image与strut的baseline对齐，而strut的baseline由继承而来的line-height决定
我们在图片后加个xxx字符就可以看到，图片底部与x的底部对齐    
![行盒高度109px](https://raw.githubusercontent.com/laketea/front-road/master/html&css/images/demo1-2.png)

#### demo2：包含多个第一组vertical-algin属性值的元素
代码:

	<div id="demo2" style="border:1px solid #ccc;width:500px;">
	    <img height="100" style="vertical-align:text-bottom" src="http://img.mp.itc.cn/upload/20160323/ebfce2b87c7a4a8cbe9bd43b592aa22c_th.jpg" />
	    <span>baseline文本:xx</span>
	    <span style="line-height:70px;vertical-align:text-top">text-top:xxx</span>
	</div>

效果:    
![行盒高度156px](https://raw.githubusercontent.com/laketea/front-road/master/html&css/images/demo2.png)    

这种情况下，先假设存在一个strut内联盒，所有的元素严格按照vertical-align与strut对齐，如果元素的盒边界会超出行盒，则行盒自动向top或者bottom扩展高度

#### demo3：包含多个第二组vertical-algin属性值的元素
代码:

	<div id="demo3" style="border:1px solid #ccc;width:500px;">
	    <img class="top-image" height="100" style="vertical-align:top" src="http://img.mp.itc.cn/upload/20160323/ebfce2b87c7a4a8cbe9bd43b592aa22c_th.jpg" />
	    <span class="bottom-text" style="line-height:150px;vertical-align:bottom">bottom:xxx</span>
	</div>

效果:    
![行盒高度150px](https://raw.githubusercontent.com/laketea/front-road/master/html&css/images/demo3.png)

这种情况下：

- 先假设存在一个strut内联盒，行盒的高度与line-height一致(28px)
- 优先将盒高度最大的盒子与行盒对齐对齐，以此确定strut的位置.bottom-text元素 高度最高，与行盒bottom对齐，故行盒往下扩展至150px，这个时候，strut就处于行盒的底部
- 再将剩下的盒子与行盒对齐,top-image高度为100px，而这个时候盒子高度已经为150px了，故只要top对齐行盒的顶端即可

#### demo4: 含混多个多种vertical-algin属性值的元素
代码：

	<h2>demo4：包含多个多种类vertical-algin属性值的元素</h2>
	<div id="demo4" style="border:1px solid #ccc;width:700px;">
	    <img height="100" style="vertical-align:top" src="http://img.mp.itc.cn/upload/20160323/ebfce2b87c7a4a8cbe9bd43b592aa22c_th.jpg">
	    <span style="vertical-align: text-bottom;line-height: 100px;">text-bottom文本:xxx</span>
	    <span style="line-height:100px;vertical-align: text-top;">text-top文本:xxx</span>
	    <span style="line-height:150px;vertical-align:bottom">bottom:xxx</span>
	    <span>baseline文本:xxx</span>
	</div>

效果：    
![行盒高度186px](https://raw.githubusercontent.com/laketea/front-road/master/html&css/images/demo4.png)

这种情况下:

- 先假设存在一个strut内联盒，行盒的高度与line-height一致(28px)
- 先筛选出所有第一种盒子，预根据strut对齐计算出行行盒的最大高度，再筛选出最高的第二种盒子
- 如果第一种盒子导致的行盒最高，则将第一种盒子与strut对齐撑高行盒，再将第二种盒子与行盒对齐
- 如果第一种盒子导致的行盒最高, 则先将剩余的第二种盒子与行盒对齐，再将剩下第一种盒子与strut对齐，如果盒子溢出，将strut反向移动，以刚好包容在行盒内。

#实际应用

### checkbox与文本对齐

### input与文本对齐

### 图片与文本对齐

### icon与文本对齐
