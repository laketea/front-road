#MX RPC对象分析

---

核心参数：
var client = new mx.rpc.RESTClient();
baseUrl
mode：如果是queue则，以队列的方式发送ajax请求
async： false同步，true异步 （文档里面说null是误导啊··）
        从代码看，me.async优先级大于各个方法中传入的p_async参数
    var async = true;
        if (me.async != null)
        {
            async = me.async;
        }
        else if (me.async == null && p_async != null)
        {
            async = p_async;
    }
核心方法：

send(p_path, p_method, [p_data], [p_async], [p_callback]) 方法

get(p_path, [p_data], [p_callback])
getSync(p_path, [p_data]) 
post(p_path, [p_data], [p_callback]) 
put(p_path, [p_data], [p_callback]) 
remove(p_path, [p_data], [p_callback])
send(p_path, p_method, [p_data], [p_async], [p_callback]) 
sendSync(p_path, p_method, [p_data])
setBaseUrl(p_baseUrl) 


总结：
RPC也就是AJAX封装对象，这个封装最主要的作用还是对path的统一处理，至于get，post等方法都是比较常见的

是否可以考虑参考angular.js对RPC进一步的封装成resource对象？
当然也可能没这个必要，因为MX里面的有一个数据源的概念。
可以考虑下resource
