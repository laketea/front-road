<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>���ַ�α��֤</title>
    <link type="text/css" rel="stylesheet" href="css/css.css"/>
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
            <h2>���Ŷ�̬</h2>

            <p>News</p>

        </div>
        <ul>
            <li flag="1334826892978320" class="depth_1">
                <ul style="" class="nav2_list">
                	
                <c:forEach var="item" items="${typeLst}" varStatus="s">
                    <li flag="1334828962169537" class="depth_2">
                        <div class="nav2_bg"><a target="_self"
                                                href="newsType.action?id=${item.id}"
                                                class="lv2btn nav2_off"><span>${item.name}</span></a></div>
                    </li>
                  </c:forEach>
                </ul>
            </li>
        </ul>
        <ul class="kuaisu">
            <li><a href="?classid=1335283079098597"><img width="188" height="54"
                                                         src="img/pic1.jpg"></a>
            </li>
            <li><a href="?classid=1335283111680998"><img width="188" height="54"
                                                         src="img/pic2.jpg"></a>
            </li>
            <li><a href="?classid=1335283159771390"><img width="188" height="54"
                                                         src="img/pic3.jpg"></a>
            </li>
        </ul>
    </div>
    <div class="main_right r">
        <div class="main_title">��ǰλ�ã���ҳ <label class="nav_sep_color"> &gt;&gt; </label><label class="nav_has_no_link">���Ŷ�̬</label><label class="nav_sep_color"> &gt;&gt; </label><label class="nav_has_no_link">${newsType.name}</label>
           </div>
        <div id="content" class="main_con">
            <!--�����б�ʼ-->
            <div class="news_list">
                <div class="clr"></div>
                <div class="menu_1"><a href="newsType.action?id=${newsType.id}">${newsType.name}</a></div>
                <ul>
                	 <c:forEach var="item" items="${newsPage.list}" varStatus="s">
                    <li><span>${item.publishTime}</span><a
                            href="newsShow.action?id=${item.id}"
                            title="${item.title}">${item.title}</a></li>
                     </c:forEach>
                </ul>
                <div class="pager"></div>
            </div>
            <!--�����б����--></div>
    </div>
    <div class="clr"></div>
</div>
<%@include file="bottom.jsp"%>
</body>
</html>