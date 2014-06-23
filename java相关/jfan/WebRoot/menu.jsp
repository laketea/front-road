<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.po.User"%>
<%@page import="com.bookstore.po.Gods"%>
<%@page import="com.bookstore.po.Subject"%>
<%@page import="java.util.List"%>
<link href="css.css" rel="stylesheet" type="text/css" />

<table width="980" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="15" colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td width="80" height="27" align="left">&nbsp;&nbsp;&nbsp;<img src="images/tg_menu.gif" width="51" height="27" align="absmiddle" />&nbsp;</td>
        <td height="27" colspan="2" align="left" width="880"><div id="mid_menu">
	<ul>
	<li><a href="todayGods.jsp" >今日推荐</a></li>
	<% UserService service = new UserService();
		List results = null;
		results = service.getSubjectList(1);
			for(int i=0;i<results.size();i++){
			Subject subject  =(Subject)results.get(i);
			%>		
					<li><a href="columnGods.jsp?column=<%=subject.getId().toString() %>" ><%=subject.getFirstname() %></a></li>
			<%
			} %>
	</ul>
	</div>		</td>
      </tr>
	   <tr>
        <td height="10" colspan="3"></td>
      </tr>
	  <tr>
        <td width="80" align="left">&nbsp;&nbsp;&nbsp;<img src="images/tg_menu2.gif" width="51" height="27" align="absmiddle" />&nbsp;</td>
        <td width="500" align="left"><div id="mid_menu">
	<ul>
	<li><a id="menu1" href="#"  onclick="changebg(1)" >最新</li>
	<li><a id="menu2" href="default.jsp" onclick="changebg(2)"  >最具人气</a></li>
	<li><a id="menu3" href="default.jsp" >价格从低到高</a></li>
	<li><a id="menu4" href="default.jsp" >价格从高到低</a></li>
	</ul>
	</div>	</td>
        <td width="400" align="right" valign="middle"><input type="text" name="search" class="search_input"  /><input type="submit" value="搜索" class="search_button"  /></td>
	  </tr>
	 
      <tr>
        <td height="10" colspan="3" id="main_middle"><img src="images/tg_zhanwei.gif" width="1" height="1" /></td>
      </tr>
    </table>
	<script language="javascript">
function changeColor(id){
document.getElementById('menu'+id).style.backgroundColor='#fff';
}
</script>
	


