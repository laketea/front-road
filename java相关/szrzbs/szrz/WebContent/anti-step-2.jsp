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
				<h2>��α��֤</h2>

				<p>CopyRight</p>

			</div>
			<ul>
				<li flag="1334826892978320" class="depth_1">
					<ul style="" class="nav2_list">
						<li flag="1334828962169537" class="depth_2">
							<div class="nav2_bg">
								<a target="_self" href="antiImg.action?type=check"
									class="lv2btn nav2_off"><span>ˮӡ���</span></a>
							</div>

						</li>
						<li flag="1334828962169537" class="depth_2">
							<div class="nav2_bg">
								<a target="_self" href="antiImg.action?type=embed"
									class="lv2btn nav2_off"><span>ˮӡǶ��</span></a>
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
					class="nav_has_no_link">��Ȩ����</label><label class="nav_sep_color"> &gt;&gt; </label><label
					class="nav_has_no_link">	
					<c:choose>
											<c:when test="${fn:contains(type,'check')}">
												<c:out value="ˮӡ���" />
											</c:when>
											<c:otherwise>
												<c:out value="ˮӡǶ��" />
											</c:otherwise>
										</c:choose>
										</label>
			</div>
			<div id="content" class="main_con">
				<table width="100%" cellspacing="0" cellpadding="0" border="0">
					<tbody>
						<tr>
							<td align="left" class="about-content">

									<table width="95%">

										<tr>
											<td height="25px" colspan="3">����:${anti.imgName}&nbsp;</td>
										</tr>

										<tr>
											<td id="oldImg" width="300px"><img
												src="oldPath/${anti.oglPath}" width="300px"></td>
											<td><button id="jqBtn">Ƕ��</button></td>
											<td id="newImg"></td>
										</tr>
										<tr>
											<td colpsan="3" height="25px">${errMsg}
												<input type="hidden" id="oldPath"
												value="${anti.oglPath}" />
												<input type="hidden" id="type"
												value="${type}" />
											</td>

										</tr>
									</table>
								</td>
						</tr>
						<script>
						var oldPath =$("#oldPath").val();
						var type =$("#type").val();
						$("#jqBtn").click(function(){
							alert("��ϵͳ�������ṩͼ����һ����Ϊ���ṩ��Ȩ�������ڴ�֮ǰ��ͼ��İ�Ȩ�������û����и����ɴ˶�������Ȩ�����뱾ϵͳ�޹�!");
							$.post("antiImg!step2.action", {
								oldPath:oldPath,
								type:type
							}, function(data) {
								if (data == 0) {
									alert("����ʧ�ܣ�ˮӡ����ʧ��!");
								} else if(data == 1)  {
									alert("ˮӡ���ɹ�����ע��ͼƬ��û�а׵�!");
									$("#newImg").html("<img src='newsPath/"+type+"_"+oldPath+"' width='300px' >");
								} else if(data == 2)  {
									alert("ϵͳ����ˮӡ���ʧ��!");
								} else if(data == 3)  {
									alert("ˮӡǶ��ɹ�!");
									$("#newImg").html("<img src='newsPath/"+type+"_"+oldPath+"' width='300px' >");
									
								} else  {
									alert("ϵͳ����ˮӡǶ��ʧ��!");
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