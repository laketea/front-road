<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.io.*"%>
<%@ include file="include.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>���ַ�α��֤</title>
<link type="text/css" rel="stylesheet" href="css/css.css" />
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
</head>
<%
	String login = "0";
	HttpSession sessions = request.getSession(true);
	login = (String) sessions.getAttribute("login");
	User user = (User) sessions.getAttribute("user");
%>
<script>
	$(document).ready(function() {
		$("#menu ul li a").click(function(e) {
		})
	});
</script>
<body>
	<%@include file="head.jsp"%>
	<div class="home_com">
		<div class="home_com_l">
			<div class="home_swzn">
				<ul class="jsswzn">
					<li><a href="#">��Ȩ����ָ�ϣ���������</a></li>
				</ul>
				<ul class="xsswzn">
					<li><a href="#">��α��ָ֤�ϣ���α����</a></li>
				</ul>
			</div>
			<div class="home_wlfw">
				<!--<ul class="wlfw_box">-->
				<ul class="sub_cate">
					<li depth="1" class="depth_1"><a target="_self"
						href="#">����������ҵ</a>
					</li>
					<li p_id="1334826184908890" depth="1" id="1334827694765051"
						class="depth_1"><a target="_self"
						href="#">����������ҵ</a>
					</li>
					<li p_id="1334826184908890" depth="1" id="1334827730556639"
						class="depth_1"><a target="_self"
						href="#">WEB��ҵ</a>
					</li>
					<li p_id="1334826184908890" depth="1" id="1334827775400250"
						class="depth_1"><a target="_self"
						href="#">����ϵͳ��ҵ</a>
					</li>
					<li p_id="1334826184908890" depth="1" id="1349765043469106"
						class="depth_1"><a target="_self"
						href="#">��ҵ��ȫ</a></li>
					<li p_id="1334826184908890" depth="1" id="1349756109800890"
						class="depth_1"><a target="_self"
						href="#">����ǩ��</a></li>
					<li p_id="1334826184908890" depth="1" id="1349758306687224"
						class="depth_1"><a target="_self"
						href="index.php?classid=1349758306687224">��ý��</a></li>
					<li p_id="1334826184908890" depth="1" id="1349835701746192"
						class="depth_1"><a target="_self"
						href="#">ͳһ��Դƽ̨</a></li>
				</ul>
				<!--</ul>-->
			</div>
			<div class="home_xxfw">
				<!--<ul class="xxfw_box">-->
				<ul class="sub_cate">
					<li p_id="1334826760476847" depth="1" id="1334828639977813"
						class="depth_1"><a target="_self"
						href="#">���ֻ�У԰</a></li>
					<li p_id="1334826760476847" depth="1" id="1349675516569812"
						class="depth_1"><a target="_self"
						href="#">�����֤</a></li>
					<li p_id="1334826760476847" depth="1" id="1349675541351811"
						class="depth_1"><a target="_self"
						href="#">�����ʼ�</a></li>
					<li p_id="1334826760476847" depth="1" id="1349675646214184"
						class="depth_1"><a target="_self"
						href="#">���ӹ���</a></li>
					<li p_id="1334826760476847" depth="1" id="1349675687908574"
						class="depth_1"><a target="_self"
						href="#">��ȫ����</a></li>
					<li p_id="1334826760476847" depth="1" id="1349675778832168"
						class="depth_1"><a target="_self"
						href="#">��ȫ����</a></li>
					<li p_id="1334826760476847" depth="1" id="1349675821930267"
						class="depth_1"><a target="_self"
						href="#">��ȫ��ͨ</a></li>
					<li p_id="1334826760476847" depth="1" id="1349835315438408"
						class="depth_1"><a target="_self"
						href="#">����ȫ</a></li>
					<li p_id="1334826760476847" depth="1" id="1349675859279272"
						class="depth_1"><a target="_self"
						href="#">��վ��ȫ</a></li>
					<li p_id="1334826760476847" depth="1" id="1349835421992696"
						class="depth_1"><a target="_blank"
						href="#">����ȫ</a></li>
				</ul>
				<!--</ul>-->
			</div>
		</div>
		<div class="home_com_m">
			<div class="home_ggtz">
				<div class="home_ggtz_title">
					<span><img src="img/ggtz_title.jpg"></span><a
						href="#"><img src="img/more.jpg"></a>
				</div>
				<div class="home_ggtz_list">
					<!--�����б�ʼ-->
					<div class="news_list">
						<ul>
							<c:forEach var="item" items="${cpNewsLst}" varStatus="s">
								<li><span>${item.publishTime}</span><a
									href="/newsShow.action?id=${item.id}" title="${item.title}"> <c:choose>
											<c:when test="${fn:length(item.title) > 10}">
												<c:out value="${fn:substring(item.title, 0, 15)}" />
											</c:when>
											<c:otherwise>
												<c:out value="${item.title}" />
											</c:otherwise>
										</c:choose>

								</a></li>
							</c:forEach>
						</ul>
					</div>
					<!--�����б����-->
				</div>
			</div>
			<div class="wswd_box">
				<ul>
					<li><a href="?classid=1335283079098597"><img width="122"
							height="44" src="img/wswd.jpg"></a></li>
					<li><a href="?classid=1335283111680998"><img width="122"
							height="44" src="img/gzbx.jpg"></a></li>
					<li><a href="?classid=1335283159771390"><img width="122"
							height="44" src="img/wjdc.jpg"></a></li>
				</ul>
				<div class="clr"></div>
			</div>
			<div class="home_cjwt">
				<div class="home_cjwt_title">
					<span><img src="img/cjwt_title.jpg"></span><a
						href="#"><img src="img/more.jpg"></a>
				</div>
				<div class="home_cjwt_list">
					<!--�����б�ʼ-->
					<div class="news_list">
						<ul>
							<c:forEach var="item" items="${hyNewsLst}" varStatus="s">
								<li><span>${item.publishTime}</span><a
									href="newsShow.action?id=${item.id}" title="${item.title}"> <c:choose>
											<c:when test="${fn:length(item.title) > 10}">
												<c:out value="${fn:substring(item.title, 0, 15)}" />
											</c:when>
											<c:otherwise>
												<c:out value="${item.title}" />
											</c:otherwise>
										</c:choose>

								</a></li>
							</c:forEach>

						</ul>
					</div>
					<!--�����б����-->
				</div>
			</div>
		</div>
		<div class="home_com_r">
			<div class="user_login">
				<div class="user_login_t">
					<img src="img/login_title.jpg">
				</div>
				<div class="user_login_box">


					<table width="260" cellspacing="0" cellpadding="0" border="0"
						class="userlogin_box">
						<c:choose>
							<c:when test="${fn:contains(login,'1')}">
								<tbody>
									<tr>
										<td width="70px">��&#12288;&#12288;����</td>
										<td>[${user.nick}]</td>
										<td></td>
									</tr>
									<tr>
										<td>��&#12288;&#12288;����</td>
										<td><a href="user!loginOut.action">[�˳�]</a></td>
										<td></td>
									</tr>
								</tbody>
							</c:when>
							<c:otherwise>



								<tbody>
									<tr>
										<td>��&#12288;&#12288;����</td>
										<td width="130"><input type="text"
											style="display: block;" class="name" id="username"
											name="Login.Token1"></td>
										<td><input type="submit" class="login_2" value=""
											name="submit" onClick="login();"></td>
									</tr>
									<tr>
										<td>��&#12288; &#12288;�룺</td>
										<td><input type="password" style="display: block;"
											id="password" class="psssword" name="Login.Token2"></td>
										<td><input type="button" class="login_3" value=""
											id="button_help" name="button"></td>
									</tr>
								</tbody>
							</c:otherwise>
						</c:choose>
					</table>

					<script type="text/javascript">
						//var classid = 1334826109760551;

						function login() {
							var username = $("#username").val();
							var pass = $("#password").val();
							if (!username) {
								alert("�û�������Ϊ��!");
								return;
							}
							if (!pass) {
								alert("���벻��Ϊ��!");
								return;
							}
							$.post("user!login.action", {
								name : username,
								pwd : pass
							}, function(data) {
								if (data == 1) {
									alert("��½�ɹ�");
									window.location.reload()
									//$(".user_login_box").html(data);
								} else {
									alert("��½ʧ��");
									$("#username").val("");
									$("#password").val("");
								}
							});

						}
					</script>
				</div>
			</div>
			<div style="display: none; width: 360px; padding-left: 10px;"
				id="help_box">

				<p>1����ϵͳ����ѧУ "ͳһ�����֤ϵͳ" ���ʺ�/������е�¼;</p>

				<p>2��"ͳһ�����֤ϵͳ" ���û���Ϊ���Ĺ��ţ�����֤��ţ���ѧ�ţ���ר�������о�����;</p>

				<p>3��ѧУ�ڱ�Ľ�ְ����ѧ��ʹ��ѧУ "ͳһ�����֤ϵͳ"
					���û������������ϵͳ��¼��֤����ѧУ�ڱ���Ա��ʹ��������������������û������������ϵͳ��¼��֤��</p>

			</div>
			<div class="tongjiyouxiang">
				<ul>
					<li><a target="_blank" href="#"><img
							width="118" height="42" src="img/tjyx.jpg"></a></li>
					<li><a target="_blank" href="#"><img
							width="118" height="42" src="img/vpnjr.jpg"></a></li>
					<li><a href="?classid=1334828639977813"><img width="118"
							height="42" src="img/szxy.jpg"></a></li>
					<li><a target="_blank" href="#"><img
							width="118" height="42" src="img/xydt.jpg"></a></li>
				</ul>
			</div>
			<div class="dwonload">
				<div class="dwonload_t">
					<img width="260px" height="25px;" border="0" usemap="#Map"
						src="img/dwonload_title.jpg">
					<map id="Map" name="Map">
						<area href="#" coords="203,2,255,23"
							shape="rect">
					</map>
				</div>
				<div class="download_list">
					<ul>
						<c:forEach var="item" items="${guestLst}" varStatus="s">
							<li><a href="guestBook.jsp?id=${item.id}"> <c:choose>
										<c:when test="${fn:length(item.title) > 10}">
											<c:out value="${fn:substring(item.title, 0, 15)}" />
										</c:when>
										<c:otherwise>
											<c:out value="${item.title}" />
										</c:otherwise>
									</c:choose>
							</a></li>
						</c:forEach>

						<div class="clr"></div>
					</ul>
				</div>
				<div></div>
			</div>
			<div class="friendlink">
				<div class="friendlink_t">
					<img src="img/friendlink_title.jpg">
				</div>
				<div class="friendlink_list">
					<script type="text/javascript">
						$(function() {
							$('.link').change(function() {
								var val = $(this).val();
								if (val != '') {
									window.open(val);
								}
							});
						});
					</script>
					<select class="link">
						<option value="">---��������---</option>
						
						<option value="http://software.tongji.edu.cn/">---����˹������ɱ�����---</option>
						<option value="http://software.tongji.edu.cn/">---΢���������ϵͳ��칫���---</option>
						<option value="http://www.moe.edu.cn/">---�л����񹲺͹�������---</option>
						<option value="http://www.edu.cn/">---�й����н����������---</option>
						<option value="http://www.chinaedu.edu.cn/">---�й�������Ϣ��---</option>
					</select>
					<!--
            <select name="select">
              <option> ׿Խ�˲��������˳�Ա��У </option>
            </select>
            -->
				</div>
			</div>
		</div>
	</div>



	<%@include file="bottom.jsp"%>


	<div style="display: none; padding-left: 40px;" id="login_box">

		<form method="post"
			action="http://tjis.tongji.edu.cn:58080/amserver/UI/Login?goto=http://nic.tongji.edu.cn/?classid=1334826109760551&amp;action=login&amp;gotoOnFail=http://nic.tongji.edu.cn/?classid=1334826109760551&amp;action=login"
			id="mylogin" name="mylogin">

			<table width="360" cellspacing="0" cellpadding="0" border="0">

				<tbody>
					<tr>

						<td width="70" height="30" align="center">����/ѧ�ţ�</td>

						<td align="left">&nbsp;&nbsp;<input type="text"
							style="width: 150px;" size="20" id="username" name="Login.Token1"></td>

					</tr>

					<tr>

						<td height="30" align="center">��&#12288; &#12288;�룺</td>

						<td align="left">&nbsp;&nbsp;<input type="password"
							style="width: 150px;" size="20" id="pass" name="Login.Token2"></td>

					</tr>

					<tr>

						<td height="30">&nbsp;</td>

						<td>&nbsp;&nbsp;<input type="submit" class="btn_login"
							value=" " id="button" name="button"></td>

					</tr>

				</tbody>
			</table>

		</form>

	</div>




</body>
</html>