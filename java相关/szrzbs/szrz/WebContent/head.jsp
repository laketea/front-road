<%@ page pageEncoding="GBK"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
SimpleDateFormat f=new SimpleDateFormat("y��M��d�� E",Locale.CHINA);
Calendar c=Calendar.getInstance(Locale.CHINA);
c.setFirstDayOfWeek(Calendar.MONDAY); //����1Ϊ����
c.setTimeInMillis(System.currentTimeMillis());//��ǰʱ��
%>
<div class="top">
		<div class="logo">
			<div id="my_date" class="home_date"><%=f.format(c.getTime())%></div>
		</div>
		<div class="menu">
			<ul>
				<li class="home"><a href="/szrz/index.action">��ҳ</a></li>
				<li class="swzn"><a href="/szrz/about.jsp">��������</a></li>
				<li class="wlfu"><a href="/szrz/news.action">���Ŷ�̬</a></li>
				<li class="wlaq"><a href="/szrz/solution.jsp">�������</a></li>
				<li class="cysz"><a href="/szrz/application.jsp">����Ӧ��</a></li>
				<li class="sygf"><a href="/szrz/copyright.action">��Ȩ����</a></li>
				<li class="xzzq"><a href="/szrz/antiImg.action?type=check">��α��֤</a></li>
				<li class="cjwt"><a href="/szrz/guestBook.action">��ѯ����</a></li>
				<li class="wldh"><a href="/szrz/help.jsp">ʹ�ð���</a></li>
				<li class="gflt"><a href="/szrz/contact.jsp">��ϵ����</a></li>
			</ul>
		</div>
	</div>