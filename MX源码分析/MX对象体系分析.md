#MX对象体系分析


---

###如下为MX对象体系的核心代码：
假设从MXButton -> MXComponent -> MXObject分析

var btn = new MXButton(){
    var me = $extend(MXComponent);
        //me = new MXComponent(){
                me = $extend(MXObject);
                ..
                    me = new MXObject();
                        me = new MXObject();
                扩展

                return me;
            }
        retrun me;
            //
        }
}

所以，me对象其实本质是MXObject函数new之后的对象，只是在不同的中间函数中，增加了一些额外的属性。所以所有的MX对象 (me instanceof MXObject ==true);
这种方式的继承，是安全性较高，无法对现有的超类修改
相对来说，运行期，无法对其父类进行扩展··

那么在这种情况下，如何实现类型判断以及父类的判断呢？
使用__class__,以及__superClasses__
以及对象本身上的instanceOf()函数来实现类型标志

总体来说，比较简单的继承体系

    MXComponent = function()
        {
            var me = $extend(MXObject);
            var base = {};
            ....
        }

    function $extend(p_baseClass)
    {
        if (typeof(p_baseClass) == "function")
        {
            var inst = new p_baseClass();
            inst.__class__ = $extend.caller;
            if (p_baseClass != MXObject && p_baseClass != MXComponent)
            {
                inst.__superClasses__.push(p_baseClass);
            }
            return inst;
        }
    }


###me._ 函数

这个函数有点意思···
负责实例化对象的 参数，的初始化
参数中以on开头的，自动注册事件。
其他的则，直接赋值到对象上



    me._ = function(p_options)
    {
        if (me.canConstruct())
        {
            if ($.isPlainObject(p_options))
            {
                var isEventDispatcher = typeof (me.on) == "function";
                for ( var key in p_options)
                {
                    var option = p_options[key];
                    if (isEventDispatcher && typeof (me[key]) == "object"
                            && typeof (option) == "function"
                            && key.startsWith("on"))
                    {
                        me.on(key.substr(2), option);
                    }
                    else
                    {
                        me[key] = option;
                    }

                    option = null;
                    p_options[key] = null;
                }
            }
            me.constructed = true;

            p_options = null;
        }
    };

