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
<title>���ַ�α��֤</title>
<link type="text/css" rel="stylesheet" href="css/css.css" />
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
</head>


<body>

	<%@include file="head.jsp"%>

	<div class="main">
		<div class="main_left l">
			<div class="nav_title">
				<h2>��Ȩ����</h2>

				<p>CopyRight</p>

			</div>
			<ul>
				<li flag="1334826892978320" class="depth_1">
					<ul style="" class="nav2_list">
						<li flag="1334828962169537" class="depth_2">
							<div class="nav2_bg">
								<a target="_self" href="copyright.action"
									class="lv2btn nav2_off"><span>��Ȩ����</span></a>
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
				��ǰλ�ã���ҳ <label class="nav_sep_color"> &gt;&gt; </label><label
					class="nav_has_no_link">��Ȩ����</label>
			</div>
			<div id="content" class="main_con">
				<table width="100%" cellspacing="0" cellpadding="0" border="0">
					<tbody>
						<tr>
							<td align="left" class="about-content">

									<table width="95%">

										<tr>
											<td height="25px" colspan="3">����:${copyRight.imgName}&nbsp;����:${copyRight.typeName}</td>
										</tr>

										<tr>
											<td id="oldImg" width="300px"><img
												src="oldPath/${copyRight.oglPath}" width="300px"></td>
											<td><button id="jqBtn">Ƕ��</button></td>
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
							alert("��ϵͳ�������ṩͼ����һ����Ϊ���ṩ��Ȩ�������ڴ�֮ǰ��ͼ��İ�Ȩ�������û����и����ɴ˶�������Ȩ�����뱾ϵͳ�޹�!");
							$.post("copyright!step2.action", {
								imgName : imgName,
								typeId : typeId,
								oldPath:oldPath
							}, function(data) {
								if (data == 0) {
									alert("����ʧ�ܣ�ˮӡ��Ϣ��ȡ����!");
								} else if(data == 1)  {
									alert("��ͼƬ���ܱ�ϵͳ�����������ظ�����!");
								} else if(data == 2)  {
									alert("��¼ʧЧ�������µ�¼!");
								} else if(data == 3)  {
									alert("ϵͳ����ˮӡǶ��ʧ��!");
								} else  {
									alert("Ƕ��ɹ�!");
									$("#newImg").html("<img src='newPath/"+data+"' width='300px' >");
								}
							});
							
							
						})
						
						</script>
						<tr>
							<td align="center" class="news_info"></td>
						</tr>

						<!--�ڽ����ſ�ʼ-->

						<!--�ڽ����Ž���-->


						<!--������ſ�ʼ-->
						<!--������Ž���-->

						<!--�������ۿ�ʼ-->
						<!--�������۽���-->
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