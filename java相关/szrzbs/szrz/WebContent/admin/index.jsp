<%@ page language="java" pageEncoding="GBK"
	contentType="text/html;charset=GBK"%>
<%@ include file="/admin/common/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>������֤��̨����ϵͳ</title>
<link href="themes/css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="login">
		<div id="login_header">
			<h1 class="login_logo">
				<a href="#"><img src="themes/default/images/login_logo.gif" /></a>
			</h1>
			<div class="login_headerContent">
				<div class="navList">
					<ul>
						<li><a href="#">��Ϊ��ҳ</a></li>
						<li><a href="#">����</a></li>
						<li><a href="#" target="_blank">����</a></li>
					</ul>
				</div>
				<h2 class="login_title"><img src="themes/default/images/login_title.png" /></h2>
			</div>
		</div>
		<div id="login_content">
			<div class="loginForm">
			<div style="position: absolute; height: 30px;color: red; line-height: 30px; width: 150px; left: 80px; top: 15px;">${req}</div>
				<form action="admin!adminLogin.action" method="post">
					<p>
						<label>�û�����</label>
						<input type="text" name="admin.name" size="20" class="login_input" />
					</p>
					<p>
						<label>���룺</label>
						<input type="password" name="admin.pwd" size="20" class="login_input" />
					</p>
					<p>
						<label>��֤�룺</label>
						<input class="code" type="text" size="5" />
						<span><img src="themes/default/images/header_bg.png" alt="" width="75" height="24" /></span>
					</p>
					<div class="login_bar">
						<input class="sub" type="submit" value=" " />
					</div>
				</form>
			</div>
			<div class="login_banner"><img src="themes/default/images/login_banner.jpg" /></div>
			<div class="login_main">
				<ul class="helpList">
					<li><a href="#">������������</a></li>
					<li><a href="#">��ΰ�װ��Կ��������</a></li>
					<li><a href="#">����������ô�죿</a></li>
					<li><a href="#">Ϊʲô��¼ʧ�ܣ�</a></li>
				</ul>
				<div class="login_inner">
					<p>������ʹ�ù���ϵͳ�鿴����</p>
					<p>��������ʹ�� ����ϵͳ�����ʼ���</p>
					<p>������֤����ϵͳ��</p>
				</div>
			</div>
		</div>
		<div id="login_footer">
			Copyright &copy; 2012 Laktea Inc. All Rights Reserved.
		</div>
	</div>
</body>
</html>