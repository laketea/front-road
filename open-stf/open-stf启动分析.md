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