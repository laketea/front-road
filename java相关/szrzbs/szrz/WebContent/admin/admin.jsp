<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>������֤��̨����ϵͳ</title>

<link href="themes/default/style.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="themes/css/core.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="themes/css/print.css" rel="stylesheet" type="text/css"
	media="print" />
<link href="uploadify/css/uploadify.css" rel="stylesheet"
	type="text/css" media="screen" />
<!--[if IE]>
<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<script src="js/speedup.js" type="text/javascript"></script>
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="xheditor/xheditor-1.1.14-zh-cn.min.js"
	type="text/javascript"></script>
<script src="uploadify/scripts/swfobject.js" type="text/javascript"></script>
<script src="uploadify/scripts/jquery.uploadify.v2.1.0.js"
	type="text/javascript"></script>

<!-- svgͼ��  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script type="text/javascript" src="chart/raphael.js"></script>
<script type="text/javascript" src="chart/g.raphael.js"></script>
<script type="text/javascript" src="chart/g.bar.js"></script>
<script type="text/javascript" src="chart/g.line.js"></script>
<script type="text/javascript" src="chart/g.pie.js"></script>
<script type="text/javascript" src="chart/g.dot.js"></script>

<script src="js/dwz.core.js" type="text/javascript"></script>
<script src="js/dwz.util.date.js" type="text/javascript"></script>
<script src="js/dwz.validate.method.js" type="text/javascript"></script>
<script src="js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="js/dwz.barDrag.js" type="text/javascript"></script>
<script src="js/dwz.drag.js" type="text/javascript"></script>
<script src="js/dwz.tree.js" type="text/javascript"></script>
<script src="js/dwz.accordion.js" type="text/javascript"></script>
<script src="js/dwz.ui.js" type="text/javascript"></script>
<script src="js/dwz.theme.js" type="text/javascript"></script>
<script src="js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="js/dwz.navTab.js" type="text/javascript"></script>
<script src="js/dwz.tab.js" type="text/javascript"></script>
<script src="js/dwz.resize.js" type="text/javascript"></script>
<script src="js/dwz.dialog.js" type="text/javascript"></script>
<script src="js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="js/dwz.cssTable.js" type="text/javascript"></script>
<script src="js/dwz.stable.js" type="text/javascript"></script>
<script src="js/dwz.taskBar.js" type="text/javascript"></script>
<script src="js/dwz.ajax.js" type="text/javascript"></script>
<script src="js/dwz.pagination.js" type="text/javascript"></script>
<script src="js/dwz.database.js" type="text/javascript"></script>
<script src="js/dwz.datepicker.js" type="text/javascript"></script>
<script src="js/dwz.effects.js" type="text/javascript"></script>
<script src="js/dwz.panel.js" type="text/javascript"></script>
<script src="js/dwz.checkbox.js" type="text/javascript"></script>
<script src="js/dwz.history.js" type="text/javascript"></script>
<script src="js/dwz.combox.js" type="text/javascript"></script>
<script src="js/dwz.print.js" type="text/javascript"></script>
<!--
<script src="bin/dwz.min.js" type="text/javascript"></script>
-->
<script src="js/dwz.regional.zh.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	DWZ.init("conf/dwz.frag.xml", {
		loginUrl:"common/login_dialog.jsp", loginTitle:"��¼",	// ������¼�Ի���
//		loginUrl:"login.html",	// ������¼ҳ��
		statusCode:{ok:200, error:300, timeout:301}, //����ѡ��
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", 

orderDirection:"orderDirection"}, //����ѡ��
		debug:true,	// ����ģʽ ��true|false��
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"themes"}); // themeBase �����indexҳ�������base·��
		}
	});
});
function auditNotPass(){
	setTimeout(function(){$.pdialog.open("demo_page4.html", "addOpinionDia", "��д��ͨ��ԭ��", {width:"600", 

height:"250"});}, 10)
	return false;
}
</script>
</head>
<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="http://j-ui.com">��־</a>
				<ul class="nav">
					
					<li><a href="changepwd.html" target="dialog" width="600">����</a></li>
					<li><a href="admin!loginOut.action">�˳�</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default">
						<div class="selected">��ɫ</div>
					</li>
					<li theme="green">
						<div>��ɫ</div>
					</li>
					<!--<li theme="red"><div>��ɫ</div></li>-->
					<li theme="purple">
						<div>��ɫ</div>
					</li>
					<li theme="silver">
						<div>��ɫ</div>
					</li>
					<li theme="azure">
						<div>����</div>
					</li>
				</ul>
			</div>

			<!-- navMenu -->
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<h2>���˵�</h2>
					<div>����</div>
				</div>

				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2>
							<span>Folder</span>�������
						</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a>�û�����</a>
								<ul>
									<li><a href="/szrz/admin/user!list.action" target="navTab"
										rel="userList">�û�����</a></li>
								</ul>
							<li><a>��Ȩ����</a>
								<ul>
									<li><a href="/szrz/admin/copyRightImg!list.action"
										target="navTab" rel="copyRightImgList">��Ȩ����</a></li>

								</ul></li>
							<li><a>��α��֤</a>
								<ul>
									<li><a href="/szrz/admin/antiImg!list.action"
										target="navTab" rel="antiImgList">��α��֤</a></li>
									<li><a href="/szrz/admin/purImg!list.action"
										target="navTab" rel="purImgList">���׼�¼</a></li>

								</ul></li>
							<li><a>���Ź���</a>
								<ul>
									<li><a href="/szrz/admin/news!list.action"
										target="navTab" rel="newsList">������Ϣ</a></li>
									<li><a href="/szrz/admin/newsType!list.action"
										target="navTab" rel="newsTypeList">���ŷ���</a></li>

								</ul></li>
							<li><a>���Թ���</a>
								<ul>
									<li><a href="/szrz/admin/guestBook!list.action"
										target="navTab" rel="guestBookList">�����б�</a></li>
									<li><a href="/szrz/admin/guestBookType!list.action"
										target="navTab" rel="nguestBookTypeList">���Է���</a></li>

								</ul></li>
							<li><a>ϵͳ����</a>
								<ul>
									<li><a href="/szrz/admin/imgType!list.action" target="navTab"
										rel="imgTypeList">ͼƬ����</a></li>
									
									<li><a href="/szrz/admin/admin!list.action" target="navTab"
										rel="adminList">��̨�˻�</a></li>
										<li><a href="/szrz/admin/loginInfo!list.action"
										target="navTab" rel="loginInfoList">��¼��Ϣ</a></li>
								</ul></li>

						</ul>
					</div>
					<div class="accordionHeader">
						<h2>
							<span>Folder</span>���͹���
						</h2>
					</div>
					<div class="accordionContent">
						
					</div>
					<div class="accordionHeader">
						<h2>
							<span>Folder</span>���͹���
						</h2>
					</div>
					<div class="accordionContent">
						
					</div>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<!-- ��ʾ���ҿ���ʱ��� 

class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span
										class="home_icon">�ҵ���ҳ</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<!-- ����ֻ��Ҫ���һ����ʽ class="tabsLeft 

tabsLeftDisabled" -->
					<div class="tabsRight">right</div>
					<!-- ����ֻ��Ҫ���һ����ʽ 

class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">��̨������ҳ</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<div class="alertInfo">
								<h2>
									
								</h2>
							</div>
							<div class="right">
								
							</div>
							<p>
								<span>������֤��̨����</span>
							</p>
							<p>
							</p>
						</div>
						<div class="pageFormContent" layoutH="80"
							style="margin- right: 230px">

							

							<div class="divider"></div>
							<h2>�̳�:</h2>
							<p>
								
							</p>

							<div class="divider"></div>
							<h2></h2>
							
						</div>

						<div style="width: 230px; position: absolute; top: 60px; right: 0"
							layoutH="80">
							<iframe width="100%" height="430" class="share_self"
								frameborder="0" scrolling="no"
								src="http://widget.weibo.com/weiboshow/index.php?

width=0&height=430&fansRow=2&ptype=1&skin=1&isTitle=0&noborder=1&isWeibo=1&isFans=0&uid=1739071261&verifier=c683dfe7

"></iframe>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>

	<div id="footer">
		Copyright &copy; 2012 Laketea
		Tel��028- 88888888
	</div>

</body>
</html>