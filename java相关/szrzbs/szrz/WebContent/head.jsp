<%@ page pageEncoding="GBK"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
SimpleDateFormat f=new SimpleDateFormat("y年M月d日 E",Locale.CHINA);
Calendar c=Calendar.getInstance(Locale.CHINA);
c.setFirstDayOfWeek(Calendar.MONDAY); //以周1为首日
c.setTimeInMillis(System.currentTimeMillis());//当前时间
%>
<div class="top">
		<div class="logo">
			<div id="my_date" class="home_date"><%=f.format(c.getTime())%></div>
		</div>
		<div class="menu">
			<ul>
				<li class="home"><a href="/szrz/index.action">首页</a></li>
				<li class="swzn"><a href="/szrz/about.jsp">关于我们</a></li>
				<li class="wlfu"><a href="/szrz/news.action">新闻动态</a></li>
				<li class="wlaq"><a href="/szrz/solution.jsp">解决方案</a></li>
				<li class="cysz"><a href="/szrz/application.jsp">典型应用</a></li>
				<li class="sygf"><a href="/szrz/copyright.action">版权保护</a></li>
				<li class="xzzq"><a href="/szrz/antiImg.action?type=check">防伪认证</a></li>
				<li class="cjwt"><a href="/szrz/guestBook.action">咨询留言</a></li>
				<li class="wldh"><a href="/szrz/help.jsp">使用帮助</a></li>
				<li class="gflt"><a href="/szrz/contact.jsp">联系我们</a></li>
			</ul>
		</div>
	</div>