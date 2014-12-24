$ns("mx.views");






/**
 * 提供一个容器，包含有视图与视图控制器。
 * 该类的派生类有 {@link mx.weblets.WebletContainer},
 *           {@link mx.windows.Window}。
 * @abstract 
 */
mx.views.ViewPort = function()
{
    var me = $extend(mx.containers.Container);
    var base = {};

   
    /**
     * 获取视图。参见 {@link mx.views.View}。
     */
    me.view = null;
    
    /**
     * 获取视图控制器。参见 {@link mx.views.ViewController}。
     */
    me.viewController = null;

    /**
     * 详见 {@link mx.controls.Control.getContext} 方法。
     */
    me.context = null;

    /**
     * 初始化方法。执行设置样式并初始化属性等操作。
     */
    base.init = me.init;
    me.init = function()
    {
        base.init();
        me.$e.addClass("mx");

        // 处理初始化时从 options 注入的参数
        if (me.viewController != null)
        {
            var controller = null;
            if ($isString(me.viewController))
            {
                if (me.context != null)
                {                    
                    controller = _getViewOfViewController(me.viewController, "Controller");
                }
            }
            else
            {
                controller = me.viewController;
            }
            
            me.setViewController(controller);
        }
        else if (me.view != null)
        {
            var view = null;
            if ($isString(me.view))
            {
                if (me.context != null)
                {
                    view = _getViewOfViewController(me.view, "View");
                }
            }
            else
            {
                view = me.view;
            }
            
            me.view = null;
            me.setView(view);   
        }
    };

    /**
     * 设置视图。
     * 
     * @param p_view
     *            一个 {@link mx.views.View} 对象.
     */
    me.setView = function(p_view)
    {
        if (me.view == p_view)
        {
            return;
        }

        if (me.view != null)
        {
            me.view.trigger("deactivate");
            me.removeControl(me.view);
            me.view.viewPort = null;
        }
        me.view = p_view;
        if (me.view != null)
        {
            me.view.viewPort = me;
            me.addControl(me.view);
            me.view.trigger("activate");
        }
    };

    
    /**
     * 设置视图的视图控制器。
     * 
     * @param p_viewController
     *           一个{@link mx.views.ViewController} 对象.
     */
    me.setViewController = function(p_viewController)
    {
        me.viewController = p_viewController;
        if (me.viewController != null)
        {
            me.setView(me.viewController.getView());
        }
        else
        {
            me.setView(null);
        }
    };

    function _getViewOfViewController(p_str, p_type)
    {
        var resultFun = (p_str.indexOf(me.context.id) != -1 || p_str.indexOf(".views") != -1) ? p_str : me.context.id + "." + p_str;
        
        try
        {
            resultFun = eval('('+resultFun+')');
        }
        catch (e)
        {                        
            throw new Error(mx.err(p_type == "View" ? "UNKNOWN_VIEW_TYPE" : "UNKNOWN_VIEWCONTROLLER_TYPE", [p_str]));
        }
        
        var result = null;
        if ($isFunction(resultFun))
        {
            result = new resultFun();
        }
        
        return result;
    }
    
    base.dispose = me.dispose;
    /**
     * 释放对象运行时动态生成的内容（属性、方法、事件）。
     */
    me.dispose = function()
    {
        base.dispose();
        me.view = null;
        me.viewController = null;
    };

    me.endOfClass(arguments); 
    return me;
};