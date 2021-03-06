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
        <div class="main_title">当前位置：首页 <label class="nav_sep_color"> &gt;&gt; </label><label class="nav_has_no_link">新闻动态</label><label class="nav_sep_color"> &gt;&gt; </label><label class="nav_has_no_link">${news.typeName}</label>
            </div>
        <div id="content" class="main_con">
            <table width="100%" cellspacing="0" cellpadding="0" border="0">
                <tbody><tr>
                    <td align="center" class="news_title">${news.title}</td>
                </tr>
                <tr>
                    <td align="center" class="news_info">
                        &#12288;
                        发表时间：${news.publishTime}&#12288;
                        阅读次数：${news.viewCount}
                    </td>
                </tr>
                <tr>
                    <td class="news_content">
                    	${news.content}
                        </td>
                </tr>
                <!--邻近新闻开始-->
                <tr>
                    <td class="page_two">
                        <div class="prev_news near_news">
                        </div>
                        <div class="next_news near_news">
                                      </div>
                    </td>
                </tr>
                <!--邻近新闻结束-->


                <!--相关新闻开始-->
                <!--相关新闻结束-->

                <!--新闻评论开始-->
                <!--新闻评论结束-->
                </tbody></table>

        </div>
    </div>
   
   
   
    <div class="clr"></div>
</div>
<%@include file="bottom.jsp"%>
</body>
</html>