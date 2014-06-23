<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>���ַ�α��֤</title>
<link type="text/css" rel="stylesheet" href="css/css.css" />
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
</head>
<script>
    $(document).ready(function () {
    });
</script>
<body>

	<%@include file="head.jsp"%>

	<div class="main">
		<div class="main_left l">
			<div class="nav_title">
				<h2>������ѯ</h2>

				<p>GuestBook</p>

			</div>
			<ul>
				<li flag="1334826892978320" class="depth_1">
					<ul style="" class="nav2_list">

						<c:forEach var="item" items="${gtList}" varStatus="s">
							<li flag="1334828962169537" class="depth_2">
								<div class="nav2_bg">
									<a target="_self" href="guestBook.action?id=${item.id}"
										class="lv2btn nav2_off"><span>${item.name}</span></a>
								</div>
							</li>
						</c:forEach>
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
					class="nav_has_link"><a
					href="index.php?classid=1335284402425692" class="nav_has_link">������ѯ</a></label><label
					class="nav_sep_color"> &gt;&gt; </label><label
					class="nav_has_no_link">${guestType.name}</label>
			</div>
			<div id="content" class="main_con">
				<div id="showbox"></div>
				<div class="online_qa_list">

					<div class="wenda_title">
						<h3>��������</h3>
						<span><input type="submit" value="��Ҫ���� " id="show_login"
							name="button" class="tiwen"></span>
					</div>
					<div id="mar" class="wenda_list">
						<ul>
							<c:forEach var="item" items="${guestPage.list}" varStatus="s">
								<li class="bggray">
									<div style="background: #f1f1f1; margin-bottom: 8px"
										class="wenda_name">
										<em>�û�����<a class="orange">${item.userName}</a></em><span>ʱ�䣺${item.guestBookTime}</span>
									</div>
									<p class="niwen">
										<strong class="t_green">����</strong><a>������⣺${item.title}</a>
									</p>
									<p class="niwen">
										<a>�������ݣ�${item.content}</a>
									</p>
									<div class="huida">
										<span class="limittext"><strong class="t_blue">�ش�</strong>${item.replyContent}</span>
									</div>
									<div class="wenda_name2">
										<em><strong> �������ͣ�</strong><a>${item.typeName}</a></em> <span>
										</span>
									</div>
									<div class="clr"></div>
								</li>
							</c:forEach>

						</ul>
						<div class="clr"></div>
						<div class="txt_page">
							��ǰ�ǣ�${page}/${guestPage.pageCount}&#12288;��${guestPage.totalRecords}����Ϣ&#12288;<span
								class="">��ҳ</span> <span class="">��һҳ</span> <a
								href="?classid=1335283079098597&amp;page_1335283079098597=2">��һҳ</a>
							<a href="?classid=1335283079098597&amp;page_1335283079098597=2">βҳ</a>
							��ת������<select
								onchange="location.href='?classid=1335283079098597&amp;page_1335283079098597='+this.value"
								name="PB_Page_Select"><option selected="" value="1">1</option>
								<option value="2">2</option></select>ҳ
						</div>
						<div class="ask">
							<div class="wenda_title">
								<h3>������ѯ</h3>
								<span></span>
							</div>
							<table>
								<tr>
									<td height="10px"></td>
									<td ></td>
								</tr>
								<tr>
									<td  align="top">����:</td>
									<td height="35px"><input type="text" name="title" size="50" style="height:20px;line-height:20px" ></td>
								</tr>
								<tr>
									<td valign="top">����:</td>
									<td><textarea cols="50" rows="6" name="content"></textarea></td>
								</tr>
								<tr>
									<td></td>
									<td><input type="submit" value="�ύ" ></td>
								</tr>
							</table>
						</div>
					</div>

					<script type="text/javascript">

                    $(function(){
                        $(".limittext").each(function(){
                            $(this).limittext({"limit":85,"fill":"......","morefn":{"status":true,"moretext":"����","lesstext":"���ز���"}});
                        });

                        $('#btn_confirm').live('click', function (){
                            var user = $('#username').val();
                            var pass = $('#password').val();
                            if (true||user!=''&amp;&amp;pass!=''){
                                $.post('?classid=1334826109760551&amp;action=login', {
                                    user_name:user,
                                    pass:pass
                                }, function(req){
                                    alert(req);
                                })
                            }
                        });

                    })

                </script>

				</div>
			</div>
		</div>

		<div class="clr"></div>
	</div>
	<%@include file="bottom.jsp"%>
</body>
</html>