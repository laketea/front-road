<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>数字防伪认证</title>
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
            <h2>新闻动态</h2>

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
        <div class="main_title">当前位置：首页 <label class="nav_sep_color"> &gt;&gt; </label><label class="nav_has_no_link">新闻动态</label>
           </div>
        <div id="content" class="main_con">
            <!--新闻列表开始-->
            <div class="news_list">
                <div class="clr"></div>
                <c:forEach var="item" items="${typeLst}" varStatus="s">
                <div class="menu_1"><a href="newsType.action?id=${item.id}">${item.name}</a></div>
                <ul>
                	 <c:forEach var="subitem" items="${item.lst}" varStatus="s">
                    <li><span>${subitem.publishTime}</span><a
                            href="newsShow.action?id=${subitem.id}"
                            title="${subitem.title}">${subitem.title}</a></li>
                     </c:forEach>
                </ul>
                <div class="pager"></div>
                </c:forEach>
            </div>
            <!--新闻列表结束--></div>
    </div>
    <div class="clr"></div>
</div>
<%@include file="bottom.jsp"%>
</body>
</html>