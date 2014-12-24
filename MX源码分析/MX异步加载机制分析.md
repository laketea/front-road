#MX异步加载机制分析

代码主要分布在framework-debug.js MX类中

明确一下分析的思路：
从异步加载以及模块机制的常用需求以及解决方法 以及常用前端模块加载库的方式来分析对比MX异步机制

MX异步加载机制主要包含两个方法：

###类JS文件加载函数
这个函数主要是处理如下问题：
- 非debug模式下，不加载文件，直接执行回调函数
- 对p_fullClassName进行处理，转换为对应的js文件路径
    从代码看出，fullClassName的命名规范，
    第一级为模块名，其他则为模块下对应的文件路径名
- debug模式下，调用include函数加载文件，callback也作为参数传入

从这段代码可以看出：mx只支持单文件模块，也就是每个js文件对应一个模块，并且模块不支持模块命名，默认根据路径以及文件名作为模块名(待商酌)



    //$import("sglogin.control.HeadPage");假设执行此方法
    me.importClass = function(p_fullClassName, p_callback)
        {
            //如果不是debug模式，则直接运行callback
            if (!me.debugMode)
            {
                if (typeof(p_callback) == "function")
                {
                    p_callback();
                }
            }
            else
            {
                var parts = p_fullClassName.split(".", 1);// parts=['sglogin']
                var path = null;
                if (parts.length == 1)
                {
                    var moduleName = parts[0];//sglogin
                    var classPath = p_fullClassName.substr(moduleName.length + 1).replace(/\./g, "/");//control/HeadPage
                    path = "~/" + moduleName + "/scripts/" + classPath + ".js";
                    //sglogin/scripts/control/HeadPage.js
                    //这个路径也就是工程face下面对应的文件路径
                }
                
                if (path != null)
                {
                    me.include(path, p_callback);
                }
            }
        };

###include文件加载核心函数

    me.include = function(p_path, p_callback)
        {
            //路径解析，转换为全路径
            var path = me.mappath(p_path);
            
            var ingList = null;
            var edList = null;
            var type = null;
            if (path.indexOf(".js") == path.length - 3)
            {
                ingList = me.loadingScripts;
                edList = me.loadedScripts;
                type = "js";
            }
            else if (path.indexOf(".css") == path.length - 4)
            {
                ingList = me.loadingStyles;
                edList = me.loadedStyles;
                type = "css";
            }
            
            if (!me.debugMode && type == "css" && path.indexOf("resources/themes") != -1)
            {
                if (path.indexOf("resources/themes/" + me.theme + "/min.css") == -1)
                {
                    if (typeof(p_callback) == "function")
                    {
                        p_callback();
                    }
                    
                    return;
                }
            }
            
            //如果path路径正在加载中，则将callback存入ingList[path]
            if (ingList[path] != null)
            {
                if (typeof(p_callback) == "function")
                {
                    ingList[path].push(p_callback);
                }
            }
            //如果path路径已经加载完，则直接调用callback
            else if (edList[path] != null)
            {
                if (typeof(p_callback) == "function")
                {
                    p_callback();
                }            
            }
            else
            {
                //如果之前没有加载过path,将path以及callback缓存进正在加载队列中
                //ingList[path] = [callback], [......,path];
                _add(ingList, path, ((typeof(p_callback) == "function") ? [ p_callback ] : []));

                //document加载成功后，动态加载
                if (document.body)
                {
                    // 在 document 已成功加载后，某一时刻动态加载一个新的文件。
                    var element = null;
                    if (type == "js")
                    {
                        element = document.createElement("script");                   
                    }
                    else if (type == "css")
                    {
                        element = document.createElement("link");
                        element.rel = "stylesheet";
                    }
                                    
                    if (element.readyState)
                    {
                        element.onreadystatechange = me._include_onload;
                    }
                    
                    element.onload = me._include_onload;
                    element.onerror = me._include_onload;
                    element.dynamic = true;
                    
                    // 必须在这里给 src 和 href 赋值，强烈鄙视 IE 的 Bug！！！
                    if (type == "js")
                    {
                        element.src = path;
                    }
                    else if (type == "css")
                    {
                        element.href = path;
                    }
                    
                    element.id = path;
                    
                    if (document.body != null && type != "css")
                    {
                        document.body.appendChild(element);
                    }
                    else
                    {
                        if (__head == null)
                        {
                            __head = document.getElementsByTagName('head')[0];
                        }
                        __head.appendChild(element);
                    }    
                }
                else
                {
                    // 在 document 正在加载的时候，加载一个新的文件。
                    var tag = null;
                    if (type == "js")
                    {
                        tag = "<script src='" + path + "'";
                    }
                    else if (type == "css")
                    {
                        tag = "<link rel='stylesheet' href='" + path + "'";
                    }
                    document.write(tag + " id='" + path + "' onerror='mx._include_onload(event)' onreadystatechange='mx._include_onload(event);' onload='mx._include_onload(event)'>" + (type == "js" ? "</script>" : ""));
                }
                /*
                上面两种加载方式：
                    1.document加载时:document.write link/scripthtml，文件加载状态函数也通过html拼接绑定(onerror,onreadystatechange,onload)
                    2.document加载后：新建dom，js文件append到body中，css文件append到head中，加载状态函数通过dom的onload/
                 */
            }
        };

        //将key，value存入对于的队列中
        //这里将数组作为两个用途，第一是将p_key存入数组，第二将key_value作为对象的键值对
        function _add(p_collection, p_key, p_value)
        {
            p_collection[p_key] = p_value;
            p_collection.push(p_key);
        }

### \_include_onload文件加载完处理函数

onload函数触发点可能有三个事件：
    onreadystatechange
    onload
    onerror


    me._include_onload = function(e)
        {
            //ie下，e = window.event
            var e = e ? e : event;
            var element = null;
            //e.srcElement srcipt或link dom
            if (e.srcElement != null)
            {
                element = e.srcElement;
            }
            else
            {
                element = e.target;
            }
            
            
            if (element.readyState)
            {
                //what？
                if (element.readyState != "loaded" && element.readyState != "complete")
                {
                    return;
                }
            }
            
            //清理onload,onerror,onread...函数
            element.onload = null;
            element.onerror = null;
            if (element.readyState)
            {
                element.onreadystatechange = null;
            }
            
            var path = null, id = element.id;
            var callbacks = [];
            if (element.tagName == "SCRIPT")
            {
                path = element.src;
                if (!id)
                {
                    id = path;
                }
                // 这里的path是绝对路径，而me.loadedScripts存储的是相对路径，因此需要使用 id 做 key。
                if (e.type != "error")
                {
                    //id为请求的相对路径，path为请求的url全路径包过http头，loadedScripts的键值对为：id:path
                    _add(me.loadedScripts, id, path);
                    callbacks = me.loadingScripts[id];
                    //loadingScripts中id对应的回调函数数组以及数组中的id值
                    _remove(me.loadingScripts, id);
                }
                else
                {
                    //仅仅提示错误
                    mx.error("Fail to load '" + path + "'.");
                }
            }
            else if (element.tagName == "LINK")
            {
                path = element.href;
                if (!id)
                {
                    id = path;
                }
                
                if (e.type != "error")
                {
                    //以js加载类似
                    _add(me.loadedStyles, id, path);
                    callbacks = me.loadingStyles[id];
                    _remove(me.loadingStyles, id);
                }
                else
                {
                    mx.error("Fail to load '" + path + "'.");
                }
            }
            
            //文件加载失败的情况下不会执行回调函数
            // 按照先进先出的顺序，触发 include 的回调函数。
            while (callbacks && callbacks.length > 0)
            {
                var func = callbacks.pop();
                /*
                仅仅是传入path，而不是对于的模块对象，也验证了之前的推断，mx的异步加载器，仅仅只是一个文件加载器，而不是模块加载器。
               
                 */
                func(path);
                func = null;
            }
            callbacks = null;
            
            // 当所有相关样式表单均已加载完毕。执行_styleReady_callbacks
            if (me.loadingStyles.length == 0 && me._styleReady_callbacks.length > 0)
            {
                while (me._styleReady_callbacks.length > 0)
                {        
                    if (me.loadingStyles.length > 0)
                    {
                        break;
                    }
                    
                    var readyFunc = me._styleReady_callbacks.pop();
                    readyFunc();
                    readyFunc = null;
                }
            }

            // 当所有相关脚本均已加载完毕。执行_scriptReady_callbacks
            if (me.loadingScripts.length == 0 && me._scriptReady_callbacks.length > 0)
            {
                
                while (me._scriptReady_callbacks.length > 0)
                {       
                    if (me.loadingScripts.length > 0)
                    {
                        break;
                    }
                    
                    var readyFunc = me._scriptReady_callbacks.pop();
                    readyFunc();
                    readyFunc = null;
                }
            }
            
            // 当所有文件均已加载完毕。执行_ready_callbacks
            if (me.loadingStyles.length == 0 && me.loadingScripts.length == 0 && me._ready_callbacks.length > 0)
            {
                
                while (me._ready_callbacks.length > 0)
                {      
                    if (me.loadingStyles.length > 0 || me.loadingScripts.length > 0)
                    {
                        break;
                    }
                    
                    var readyFunc = me._ready_callbacks.pop();
                    readyFunc();
                    readyFunc = null;
                }
            }
        };


### whenReady/whenStyleReady/whenScriptReady
    添加对于的回调函数
    whenReady：添加所以文件加载完毕后执行的函数
    whenStyleReady：添加所有样式文件加载完毕后执行的函数
    whenScriptReady：添加所有js文件加载完毕后执行的函数
    分别缓存了3个队列，调用方法时，如果正在加载中的相应文件为空，则直接执行回调函数，否则，将callback存入对于的队列中


###总结：
1。mx中分别缓存loadingScripts/loadedScripts/loadingStyles/loadedSytles，
2。加载文件时，先将文件名称转换为实际的路径名，如果是js文件，则转换为对于模块下scripts路径，如果是css文件，则转换为对应模块下resource目录。
3。然后，先判断文件是否已经加载（loaded-cache），如果是，则直接执行回调函数并返回
3。再判断path文件是否正在加载中，如果是，则将callback存入path对于的callback队列中，并返回
4。如果以上都不满足，则加载js文件。如果是document加载完成后的动态加载文件，则新建dom，（script/style），如果文件类型为js，则appendTo body，如果是css文件，则appendTo head中。
5。如果是document加载中，则拼接相关html字符串，document.write(html)
6.以上两步，均绑定onerror,onloaded,onreadystatechange事件到include函数，文件在html中加载完成或状态改变或加载失败后，执行_include_onload函数
7._include_onload函数中，
- 先考虑浏览器兼容性获取event，
- 通过event获取事件dom，
- 清理dom上绑定的状态函数，
- 取出dom对于的id/path，
- 如果加载成功
    + 以id-path为键值对，存入loaded数组中。
    + 根据id取出loading中缓存的callbacks数组
    + 清理loading中id对于的记录
    + 遍历执行回调函数，
- 如果加载失败，则提示文件加载失败
- 判断styles文件是否都加载完成，如果都加载完成则遍历执行_styleReady_callbacks
- 判断js文件是否都加载完成，如果都加载完成则遍历执行_scriptReady_callbacks
- 判断文件是否都加载完成，如果都加载完成则遍历执行_ready_callbacks

从上面看出，这个加载器，只是一个文件加载器，并没有任何模块相关的处理

主要API:
    $include
    whenStyleReady
    whenScriptReady
    whenReady