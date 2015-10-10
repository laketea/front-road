open-stf启动分析.md

---

lib/cli.js
	调用units 调用procutil启动多个进程

启动一下进程：

triproxy app 
triproxy device
processor
processor


1，tripproxy app

- App input 
- Coordinator input/output
- App output

"pull":"tcp://127.0.0.1:7113"
"dealer":"tcp://127.0.0.1:7112"
"pub":"tcp://127.0.0.1:7111"

{"name":"app001","endpoints":{"pub":"tcp://127.0.0.1:7111","dealer":"tcp://127.0.0.1:7112","pull":"tcp://127.0.0.1:7113"}}

2.triproxy device
同上，tcp绑定的参数不一样
{"name":"dev001","endpoints":{"pub":"tcp://127.0.0.1:7114","dealer":"tcp://127.0.0.1:7115","pull":"tcp://127.0.0.1:7116"}}


###app operttor

1.send to webscoket:ws://localhost:7110/socket.io/
	42["input.touchDown","RZj4Str8IYrwXcp5EOr0g18PMdA=",{"seq":1,"contact":0,"x":0.5287581699346405,"y":0.7941176470588235,"pressure":0.5}]
2.webscoket send to socket:7113



###前端express代理
1.默认将请求都转发到 appurl，
  app.use(function(req, res) {
    proxy.web(req, res, {
      target: options.appUrl
    })
  })
 2.['/static/auth/*', '/auth/*']相关的请求转发到authUrl
 3.['/s/image/*']
 4.['/s/apk/*']

{
  "port": 7100,
  "appUrl": "http://localhost:7105/",
  "authUrl": "http://localhost:7120/",
  "websocketUrl": "http://localhost:7110/",
  "storageUrl": "http://localhost:7102/",
  "storagePluginImageUrl": "http://localhost:7103/",
  "storagePluginApkUrl": "http://localhost:7104/"
}

总结：

启动多个express实例（prooxy,appurl,authurl）
prooxy将所以请求默认转发到appurl，将auth请求转发到authurl
appurl默认会跳转到app的index页面
appurl的中间件会检测jwt，如果不通过，则跳转到auth，（转发到authurl express实例上）
authurl会加载auth／mock／index。jade（这个是新的angular app）
authurl 登录后，会跳转到app url



###jwt分析

1.发送请求方

//根据name email 加密成token
var token = jwtutil.encode({
	payload: {
		email: req.body.email,
		name: req.body.name
	},
	secret: options.secret
});

//请求时，将 jwt:token附到url上
res.status(200)
	.json({
		success: true,
		//将jwt参数添加到url query字符串中
		redirect: urlutil.addParams(options.appUrl, {
			jwt: token
		})
	})
})
2.接受方

接收方目前是由/lib/units/app/middleware/auth.js中间件来处理
如果请求的参数中带jwt，则解析jwt，将解析出的数据存入数据库，并设置seesion jwt
如果参数不待jwt，根据session.jwt中的数据，查询数据库中的用户，如果不存在则转到auth页面


            







