<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.*"%>
<%@page import="com.bookstore.po.*"%>
<%@page import="com.bookstore.util.*"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat" %>

<%
String adminstatus = (String)session.getAttribute("adminstatus");
if(adminstatus == null||adminstatus.equals(""))
{
	response.sendRedirect("admin_login.jsp");
	return;
}

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String columnid = request.getParameter("columnid");
if(columnid==""||columnid==null){columnid="1";}
int pageNo= 1;
try{
pageNo=Integer.parseInt(request.getParameter("pageNo"));
}catch(Exception e){
}

int pageSize = 20;
UserService service = new UserService();
List result=null;
ReviewService rservice = new ReviewService();
Page pages = rservice.getSuggestPage(5,Integer.valueOf(pageNo),Integer.valueOf(columnid));
result = pages.getThisPageElements();

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>���߷�α��֤ϵͳ��̨����ϵͳ</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="control.css" rel="stylesheet" type="text/css" />
	<link href="css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	font-size: 10px;
	background:#DBDFE8 url(images/mainback.jpg) repeat-x fixed;
	margin-left: 10px;
	margin-top: 15px;
}
.STYLE1 {font-size: 12px}
h2 { margin:0; padding:0;font-size:10pt; font-family:'΢���ź�'; color:#00000;}
h3 { margin:0; padding:0;font-size:10pt; font-family:'΢���ź�'; color:#61861E;}
#float span { float:right; margin-top:-15px;}
-->
</style></head>



<body >
<table width="700" border="0" cellpadding="0" cellspacing="0" class="CContent"  >
	<tr>
		<td class="CTitle" >���ⷴ��</td>
	</tr>
	<tr>
		<td class="SubMenu" ><a href="admin_suggest.jsp?columnid=1" >��Ա����</a><span class="STYLE1">|</span><a href="admin_suggest.jsp?columnid=2" >�οͷ���</a></td>
	</tr>
	<tr >
		<td class="CPanel"  >

		
		<% if(columnid=="1"||columnid.equals("1"))
		{
		%>
		
		<table width="675" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td  class="TDHead" colspan="6"   >
			  ��Ա����			  </td>
			</tr>
			<tr>
	          <td   colspan="6" class="STYLE1"   >
			  <table width="100%" border="0" cellspacing="1" cellpadding="0">
              <%
	  for(int i=0;i<result.size();i++){
			Suggest suggest  =(Suggest)result.get(i);
	  %>
      <tr>
        <td height="130" colspan="3" align="center" valign="middle" id="suggest<%=i+1%>"><table width="836" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td  height="70" align="left" valign="top" class="de_table" style="padding-top:10px;"><div id="float"><h2>&nbsp;&nbsp;&nbsp;&nbsp;[<%=suggest.getUsername()%>]��<%=suggest.getContent()%></h2><span style=";color:#808080; font-size:8pt; font-family:'����'; float:right">[<%=suggest.getSdate()%>]&nbsp;<a href="#" onClick="confirmdelete(<%=suggest.getId()%>)" >[ɾ��]</a>&nbsp;</span></div></td>
          </tr>
          <tr>
            <td  height="40" align="left" valign="center" class="user_suggest"><div id="float"><h3>&nbsp;&nbsp;&nbsp;&nbsp;����ظ���
			<%if(suggest.getReply()==null){%>��δ�ظ�<%}else{%><%=suggest.getReply()%><%}%></h3><span style=";color:#808080; font-size:8pt; font-family:'����'; float:right"><%if(suggest.getReply()==null){%><a href="admin_suggest.jsp?columnid=3&id=<%=suggest.getId()%>">[�ظ�]</a><%}else{%>[<%=suggest.getRedate()%>]&nbsp;<%}%></span></div></td>
          </tr>
          
          
          
        </table></td>
      </tr>
	  <%
	  }
	  %>
	  <tr>
		<td height="35" colspan="6" align="right"  >
		  
		  <table  border="0" align="right" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style=" border-bottom: 1px solid #93ac64;border-left: 1px solid #93ac64;border-top: 1px solid #93ac64; margin-right:20">
  <tr>
  <td style="border-right:1px solid #93ac64;" width="40px" align="center"  height="25"><a href="admin_suggest.jsp?pageNo=1" >��ҳ</a></td>
  <%for(int i=1;i<=pages.getPageNumber();i++){ %>
        
        <td style="border-right:1px solid #93ac64;" width="40px" align="center"  height="25"><a href="admin_suggest.jsp?pageNo=<%=i %>" ><%=i %></a></td>
        <%} %>
	<td style="border-right:1px solid #93ac64;" width="60" align="center"><a href="admin_suggest.jsp?pageNo=<%=pages.getPageNumber()%>" >���һҳ</a></td>
	
  </tr>
</table>	  </td>	</tr>
			
            </table>
			  
			   </td>
			</tr>
			
			
		</table>
		<%}%>
		<%
		if(columnid=="2"||columnid.equals("2"))
		{
		%>
		
		<table width="675" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td  class="TDHead" colspan="6"   >
			  �οͷ���			  </td>
			</tr>
			<tr>
	          <td   colspan="6" class="STYLE1"   >
			  <table width="100%" border="0" cellspacing="1" cellpadding="0">
              <%
	  for(int i=0;i<result.size();i++){
			Suggest suggest  =(Suggest)result.get(i);
	  %>
      <tr>
        <td height="130" colspan="3" align="center" valign="middle" id="suggest<%=i+1%>"><table width="836" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td  height="70" align="left" valign="top" class="de_table" style="padding-top:10px;"><div id="float"><h2>&nbsp;&nbsp;&nbsp;&nbsp;<%=suggest.getUsername()%>��<%=suggest.getContent()%></h2><span style=";color:#808080; font-size:8pt; font-family:'����'; float:right">[<%=suggest.getSdate()%>]&nbsp;<a href="#" onClick="confirmdeleteb(<%=suggest.getId()%>)" >[ɾ��]</a>&nbsp;</span></div></td>
          </tr>
		   <tr>
            <td  height="25" align="left" valign="center" class="user_suggest"><div id="float"><h3>&nbsp;&nbsp;&nbsp;&nbsp;��ϵ��ʽ��
			<%if(suggest.getContact()==null){%>δ��д<%}else{%><%=suggest.getContact()%><%}%></h3></div></td>
          </tr>
          <tr>
            <td  height="40" align="left" valign="center" class="user_suggest"><div id="float"><h3>&nbsp;&nbsp;&nbsp;&nbsp;����ظ���
			<%if(suggest.getReply()==null){%>��δ�ظ�<%}else{%><%=suggest.getReply()%><%}%></h3><span style=";color:#808080; font-size:8pt; font-family:'����'; float:right"><%if(suggest.getReply()==null){%><%}else{%>[<%=suggest.getRedate()%>]&nbsp;<%}%></span></div></td>
          </tr>
          
          
          
        </table></td>
      </tr>
	  <%
	  }
	  %>
	  <tr>
		<td height="35" colspan="6" align="right"  >
		  
		  <table  border="0" align="right" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style=" border-bottom: 1px solid #93ac64;border-left: 1px solid #93ac64;border-top: 1px solid #93ac64; margin-right:20">
  <tr>
  <td style="border-right:1px solid #93ac64;" width="40px" align="center"  height="25"><a href="admin_suggest.jsp?pageNo=1&columnid=<%=columnid%>" >��ҳ</a></td>
  <%for(int i=1;i<=pages.getPageNumber();i++){ %>
        
        <td style="border-right:1px solid #93ac64;" width="40px" align="center"  height="25"><a href="admin_suggest.jsp?pageNo=<%=i %>&columnid=<%=columnid%>" ><%=i %></a></td>
        <%} %>
	<td style="border-right:1px solid #93ac64;" width="60" align="center"><a href="admin_suggest.jsp?pageNo=<%=pages.getPageNumber()%>&columnid=<%=columnid%>" >���һҳ</a></td>
	
  </tr>
</table>	  </td>	</tr>
			
            </table>
			  
			   </td>
			</tr>
			
			
		</table>
		<%}%>
		<% 
		if(columnid=="3"||columnid.equals("3"))
		{
		String id = request.getParameter("id");
		Suggest sg = rservice.getSuggest(Long.valueOf(id));
		 %>
		
		 <table width="500" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td class="TDHead" colspan="2" >�ظ�</td>
			</tr>
			 <form action="reviewAction.do" method="post"  ><input type="hidden" name="method" value="reply" ><input type="hidden" name="id" value="<%=sg.getId().toString()%>" >
			  <td width="91" align="right"  class="STYLE1">�û�����</td>
			  <td width="396" class="STYLE1"><input type="text" size="50" readonly="true" value="<%=sg.getUsername() %>" /></td>
			</tr>
			<tr>
			  <td align="right" valign="top"  class="STYLE1">���ⷴ��</td> 
			  <td>
			  <textarea cols="57" rows="5"><%=sg.getContent()%></textarea>
			 </td>
			<tr>
			  <td align="right"  class="STYLE1">����Ա�ظ���</td> 
			  <td>
			  <textarea cols="57" rows="5" name="reply" ></textarea>
			 </td>
			
			<tr>
			  <td></td>
			  <td><input type="submit" value="�ύ" ></td>
			</tr>
			 <form>
		</table>
		
		<%} %>
		
		
		
		</td >
	</tr>
	
</table>
</body>
<script language="javascript">
function confirmdelete(id){
  if(confirm('ȷ��Ҫɾ���÷�����')){
  	location.replace('reviewAction.do?method=deletesuggesta&amp;id='+id);
  }
}
function confirmdeleteb(id){
  if(confirm('ȷ��Ҫɾ���÷�����')){
  	location.replace('reviewAction.do?method=deletesuggestb&amp;id='+id);
  }
}
</script>
</html>
