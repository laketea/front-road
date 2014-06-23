<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ include file="include.jsp"%>
<%
	String login = "0";
	HttpSession sessions = request.getSession(true);
	login = (String) sessions.getAttribute("login");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>数字防伪认证</title>
<link type="text/css" rel="stylesheet" href="css/css.css" />
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
</head>


<body>

	<%@include file="head.jsp"%>

	<div class="main">
		<div class="main_left l">
			<div class="nav_title">
				<h2>版权保护</h2>

				<p>CopyRight</p>

			</div>
			<ul>
				<li flag="1334826892978320" class="depth_1">
					<ul style="" class="nav2_list">
						<li flag="1334828962169537" class="depth_2">
							<div class="nav2_bg">
								<a target="_self" href="copyright.action"
									class="lv2btn nav2_off"><span>版权保护</span></a>
							</div>

						</li>

					</ul>
				</li>
			</ul>
			<ul class="kuaisu">
				<li><a href="?classid=1335283079098597"><img width="188"
						height="54" src="img/pic1.jpg"></a></li>
				<li><a href="?classid=1335283111680998"><img width="188"
						height="54" src="img/pic2.jpg"></a></li>
				<li><a href="?classid=1335283159771390"><img width="188"
						height="54" src="img/pic3.jpg"></a></li>
			</ul>
		</div>
		<div class="main_right r">
			<div class="main_title">
				当前位置：首页 <label class="nav_sep_color"> &gt;&gt; </label><label
					class="nav_has_no_link">版权保护</label>
			</div>
			<div id="content" class="main_con">
				<table width="100%" cellspacing="0" cellpadding="0" border="0">
					<tbody>
						<tr>
							<td align="left" class="about-content">

									<table width="95%">

										<tr>
											<td height="25px" colspan="3">名称:${copyRight.imgName}&nbsp;分类:${copyRight.typeName}</td>
										</tr>

										<tr>
											<td id="oldImg" width="300px"><img
												src="oldPath/${copyRight.oglPath}" width="300px"></td>
											<td><button id="jqBtn">嵌入</button></td>
											<td id="newImg"></td>
										</tr>
										<tr>
											<td colpsan="3" height="25px">${errMsg} <input
												type="hidden" id="imgName" value="${copyRight.imgName}" />
												<input type="hidden" id="typeId" value="${copyRight.typeId}" />
												<input type="hidden" id="oldPath"
												value="${copyRight.oglPath}" />
											</td>

										</tr>
									</table>
								</td>
						</tr>
						<script>
						var imgName =$("#imgName").val();
						var typeId =$("#typeId").val();
						var oldPath =$("#oldPath").val();
						
						$("#jqBtn").click(function(){
							alert("本系统仅在您提供图像这一刻起，为您提供版权保护，在此之前，图像的版权问题由用户自行负责，由此而发生版权纠纷与本系统无关!");
							$.post("copyright!step2.action", {
								imgName : imgName,
								typeId : typeId,
								oldPath:oldPath
							}, function(data) {
								if (data == 0) {
									alert("操作失败，水印信息提取错误!");
								} else if(data == 1)  {
									alert("此图片已受本系统保护，请勿重复保护!");
								} else if(data == 2)  {
									alert("登录失效，请重新登录!");
								} else if(data == 3)  {
									alert("系统错误，水印嵌入失败!");
								} else  {
									alert("嵌入成功!");
									$("#newImg").html("<img src='newPath/"+data+"' width='300px' >");
								}
							});
							
							
						})
						
						</script>
						<tr>
							<td align="center" class="news_info"></td>
						</tr>

						<!--邻近新闻开始-->

						<!--邻近新闻结束-->


						<!--相关新闻开始-->
						<!--相关新闻结束-->

						<!--新闻评论开始-->
						<!--新闻评论结束-->
					</tbody>
				</table>

			</div>
		</div>
		<div class="clr"></div>
	</div>

	<%@include file="bottom.jsp"%>
</body>
</html>
<%
	if (login == null || "".equals(login) || "0".equals(login)) {
		response.sendRedirect("index.action");
	}
%>