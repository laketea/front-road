
#盒子模型

##盒模型，就是浏览器回根据渲染模型，为每个元素生成4个嵌套的矩形框，分别为content box，padding-box，border-box，margin box，
上面的4个box分别有自己的边界，对应分别为：content边界/内边界，padding边界，border边界，margin边界/外边界
每一个box都包含content，padding，border，margin区域

margin：
    其值：百分比，宽度，auto，
    应用：非table，以及以及 table 类型中 table-caption, table 和 inline-table，无效，对于行内非替换元素（例如 SPAN），垂直方向的margin不起作用

padding:
    值：百分比，宽度，没有auto（默认0）
    应用：除table-row-group’, ‘table-header-group’, ‘table-footer-group’, ‘table-row’, ‘table-column-group’ 和 ’table-column外的所以元素

border:
    border-with
    border-style
    border-color


##外边距重叠

1.概念：
    Collapsing margin，指的是毗邻的两个或多个外边距 (margin) 会合并成一个外边距，即外边距折叠。

    从物理的角度来理解，就是物理的相邻，例如：父节点与子节点，兄弟节点直接,父子节点可以多层嵌套，互相之间也是同门。
    两个或多个外边距没有被非空内容、padding、border或clear分隔开
    些margin都处于普通流(in-flow，非浮动元素，非定位元素)中

2.规则：
    1.两个或多个毗邻的普通流中的块元素垂直方向上的margin会折叠
        A. 两个或多个
        B. 毗邻
            指没有被非空内容、padding、border或clear分隔开且相邻的元素
            margin-top会重叠，
            margin-bottom，重叠需要条件，（如果一个元素的height特性的值不是 auto）
        C. 垂直方向
        D. 折叠后margin的计算，
            如果正负不同，则找出最大的正数 跟最小的整数，相加得到的就是最终的
            如果同正或者同负，margin值设为margin最大与margrin最小的
浮动元素/inline-block的元素/绝对定位元素的margin不会和垂直方向上的其他元素的margin折叠
    2.浮动元素/inline-block的元素/绝对定位元素的margin不会和垂直方向上的其他元素的margin折叠

    3. 创建了块级格式化内容的元素，不和它的子元素发生margin折叠
        浮动元素，绝对定位元素，以及 overflow值不是’visible’的元素
    4. 元素自身的margin-bottom和margin-top相邻时也会折叠为
        自身margin相邻，就要求内容区域高度为0，


#可视化格式模型

视觉格式化模型(visual formatting model)是用来处理文档并将它显示在视觉媒体上的机制,视觉格式化模型根据 CSS 盒模型为文档的每个元素生成 0，1 或多个盒,盒子的布局会由以下因素影响：

    盒尺寸：明确指定，受限或没有指定
    盒类型：行内(inline), 行内级别(inline-level), 原子行内级别(atomic inline-level), 块(block)盒；
    定位方案(positioning scheme): 常规流，浮动或绝对定位；
    树中的其它元素: 它的子代与同代；
    视口(viewport) 尺寸与位置；
    内含图片的固定尺寸；
    其它信息

##盒子的生成

盒子的类型取决于display属性。

###块级元素
1。块级元素 ： display 为 block, list-item 或 table，源文件中会被格式化成块状（例：段落）的元素
2.块级框：是参与块格式化上下文的框，每个块级元素至少生成一个块级盒，称为主要块级盒(principal block-level box) （list-item会生成一个另外的块级盒）
3.块级内容盒：个块级盒可能也是一个块容器盒。块容器盒要么只包含块级框，要么创建一个行格式化上下文而只包含行内级框
4.块盒：同时是块容器盒的块级盒即是快盒。
    这里有两个例外：
        table框与可替换元素，是块级框，但不是块级内容盒
        不可替换的行内块和不可替换的table cell，是块级内容盒，但不是块级框
        问题来，补课替换这个属性的意思？
5.匿名快盒
    匿名快盒，没有名字，也不能被css选中，那么则开着这不能控制样式。其所有继承的css属性值为inhert，会继承他的父元素，非继承属性则会取默认值
    匿名快盒在两种情况下会产生：
        - 块级容器盒同时包含块级盒以及行内级盒时候，将创业以匿名块级来包含行内级盒
        - 行内容器盒包含块级盒,级盒，跟上面类似。
        
###行内级元素
1，行内级元素：display 为 'inline'，'inline-table'，'run-in'，源文件中会被格式化成块状（例：段落）的元素
2.行内级盒：行内级元素生成行内级盒(inline-level boxes)，参与行内格式化上下文(inline formatting context)？？
3，行内盒：同时参与生成行内格式化上下文的行内级盒，所有display:inline 的非替换元素生成的盒是行内盒。不参与生成行内格式化上下文的行内级盒称为原子行内级盒(atomic inline-level boxes)。这些盒由可替换行内元素，或 display 值为 inline-block 或 inline-table 的元素生成，不能拆分成多个盒
4.匿名行内盒：什么时候产生?
    任何直接被包含在一个块容器元素（而不是行内元素）中的文本，都会创建对应的匿名行内盒

###插入框？


##定位体系
css2.1中有三种定位方案
- 常规流（normal flow）
- 浮动
- 绝对定位

###常规流
在常规流中，框必须属于一个格式化上下文，块级框参与块格式化上下文。行内级框产于行内格式化上下文。
常规流有两种情况：
    position：static
    postition：relative
在 CSS2.1中，常规流包括块框(block boxes)的块格式化(blok formatting 后续会讲到)，行内框(inline boxes)的行内格式化(inline formatting 后续会讲到)，块框或行内框的相对定位，以及插入框的定位

####块格式化上下文 Block formatting contexts
1.触发：浮动框、绝对定位框、非块框的块容器Note.png、'overflow'属性非'visible'的块框
？需要再深入了解

####行格式化上下文 Inline formatting contexts
1.行框：把在一行上的框都完全包含进去的一个矩形区域，被称为该行的行框。
    行框的宽度是由包含块和存在的浮动来决定。行框的高度由行高计算这一章所描述的规则来决定。

####相对定位
这里要注意相对定位：left/right的取值以及优先级


###浮动


###绝对布局

###'display'，'position'和'float'相互关系
1. 如果 'display' 的值为 'none'，那么 'position' 和 'float' 不起作用
2. 当元素是绝对定位时，浮动失效，display会被按规则重置
3. 当元素浮动时，display属性会被浏览器按照表中的规则重置














#包含块

1.概念：
    一个(元素的)box为它的子孙节点建造了包含块
    注意：元素的包含块并不是它的父元素

2.规则
    1.根元素，就是处于文档树最顶端的元素，它没有父节点.根元素存在的包含块，被叫做初始包含块 (initial containing block)
    根元素是html元 素

    2.“static”和”relative”定位的元素
        static,relative定位的元素，它的包含块由它最近的块级、单元格 （table cell）或者行内块（inline-block）祖先元素的内容框创建，内边框，也就是内边届

    3.“position:fixed” 定位的元素
        它的包含块是当前可视窗口。
    4.'position: absolute' 定位的元素
        由离它最近的 position 属性为 “absolute”、“relative” 或者 “fixed” 的祖先元素创建
        这里右份两种情况：
        a：如果其祖先元素是行内元素，则包含块取决于其祖先元素的 “direction” 特性，
            如果“direction” 'direction'  是 'ltr'，父元素的内边界的左上角与内边界的右下角。
            如果“direction” 'direction'  是 'rtl'，父元素的内边界的右下角与内边界的左上角。
        b：其他情况下，如果祖先元素不是行内元素，那么包含块的区域应该是祖先元素的内边距边界。

