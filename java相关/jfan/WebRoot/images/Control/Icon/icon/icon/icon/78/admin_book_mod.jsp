<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>

<%@page import="com.bookstore.service.*"%>
<%@page import="com.bookstore.po.*"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat" %>

<%


SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

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
<style type="text/css">
<!--
body {
	font-size: 10px;
	background:#DBDFE8 url(images/mainback.jpg) repeat-x fixed;
}
.STYLE1 {font-size: 12px}
-->
</style></head>
<script>
function checkform(){
	if (document.form1.name.value=="") {      
		alert("����������!");
		document.form1.name.focus();        
		return false;
	} 
	if (document.form1.author.value=="") {      
		alert("����������!");
		document.form1.author.focus();        
		return false;
	}
	if (document.form1.company.value=="") {      
		alert("�����������!");
		document.form1.company.focus();        
		return false;
	}
	if (document.form1.version.value=="") {      
		alert("������汾!");
		document.form1.version.focus();        
		return false;
	}
	if (document.form1.price.value=="") {      
		alert("������۸�!");
		document.form1.price.focus();        
		return false;
	}
	if (document.form1.isbn.value=="") {      
		alert("������ISBN!");
		document.form1.isbn.focus();        
		return false;
	}
	if (document.form1.size.value=="") {      
		alert("������װ֡/����!");
		document.form1.size.focus();        
		return false;
	}
	if (document.form1.createdate.value=="") {      
		alert("�������������!");
		document.form1.createdate.focus();        
		return false;
	}

}
</script>



<body >
<table width="700" border="0" cellpadding="0" cellspacing="0" class="CContent"  >
	<tr>
		<td class="CTitle" >��Ʒ����</td>
	</tr>
	<tr>
		<td class="SubMenu" ><a href="admin_book.jsp?columnid=1" >��Ʒ�б�</a><span class="STYLE1">|<a href="admin_book_add.jsp" >�����Ʒ</a></td>
	</tr>
	<tr >
		<td class="CPanel"  >
	<%
Gods gods =(Gods)request.getAttribute("gods");
 request.getSession().setAttribute("ff",gods.getMinphoto());
 request.getSession().setAttribute("fs",gods.getMaxphoto());
 %>
		
	
		
		<table width="750" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td class="TDHead" colspan="2" >�޸���Ʒ��Ϣ</td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1" height="10"></td>
			  <td width="663" class="STYLE1"> </td>
			</tr>
			 <html:form action="/godsAction" enctype="multipart/form-data" styleId="form1" onsubmit="return checkform()"  > <html:hidden property="method" value="update" />  <html:hidden property="id" value="<%=gods.getId().toString() %>" /> 
			<tr>
			  <td width="74" align="right" class="STYLE1">��Ʒ���ƣ�</td>
			  <td width="663" class="STYLE1"> <html:text property="name"  size="56" value="<%=gods.getName()%>"/><span class="redhat">*</span></td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">ԭ�ۣ�<br></td>
			  <td width="663" class="STYLE1">
			  	<html:text property="oldprice" value="<%=gods.getOldprice().toString()%>"  size="20"/><span class="redhat">*</span> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				�ּۣ�<html:text property="newprice" value="<%=gods.getNewprice().toString()%>"   size="20"/><span class="redhat">*</span>
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">��ҳ�Ƽ���<br></td>
			  <td width="663" class="STYLE1">
			  	<html:select property="defaultstatus" >
			  		<html:option value="">��ѡ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</html:option>
					<html:option value="0">��</html:option>
					<html:option value="1">��</html:option>
				</html:select><span class="redhat">*</span> 
				&nbsp;&nbsp;&nbsp;&nbsp;�ö��Ƽ���<html:select property="firststatus" >
					<html:option value="">��ѡ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</html:option>
					<html:option value="0">��</html:option>
					<html:option value="1">��</html:option>
				</html:select> <span class="redhat">*</span> 
				
			  <br></td>
			</tr>
			
			<tr>
			  <td width="74" align="right" class="STYLE1">״̬��<br></td>
			  <td width="663" class="STYLE1">
			  	<html:select property="status" >
			  		<html:option value="">��ѡ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</html:option>
					<html:option value="0">����</html:option>
					<html:option value="1">�¼�</html:option>
				</html:select><span class="redhat">*</span> 
				&nbsp;&nbsp;&nbsp;&nbsp;������<html:text property="sellcount" value="<%=gods.getSellcount().toString()%>"  size="20"/><span class="redhat">*</span> 
				
			  <br></td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">��Ʒ���ࣺ</td>
			  <td width="663" class="STYLE1"> <html:text property="types"  size="20" value="<%=gods.getFirst().toString()%>"/><span class="redhat">*</span>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				���֣�<html:text property="point" value="<%=gods.getPoint().toString()%>"   size="20"/><span class="redhat">*</span>
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">��ʼʱ�䣺<br></td>
			  <td width="663" class="STYLE1">
			  	<input value="<%=gods.getStartdate().toString()%>"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}'})"
            type="text" id="begin_time" name="begin_time" readOnly/><span class="redhat">*</span>&nbsp;&nbsp;&nbsp;&nbsp;
����ʱ�䣺<input value="<%=gods.getEnddate().toString()%>"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'begin_time\')}'})"
            type="text" id="end_time" name="end_time" readOnly/><span class="redhat">*</span>
			  </td>
			</tr>
			
			<tr>
			  <td width="74" align="right" class="STYLE1">����ͼ��<br></td>
			  <td width="663" class="STYLE1">
			  	<%=gods.getMinphoto()%><span class="redhat">*</span> 
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">��ͼ��<br></td>
			  <td width="663" class="STYLE1">
			  	<%=gods.getMaxphoto()%><span class="redhat">*</span> 
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" valign="top" class="STYLE1">������<br></td>
			  <td width="663" class="STYLE1"><TEXTAREA  name="discript" rows="5" cols="65"><%=gods.getDiscript()%></TEXTAREA><span class="redhat">*</span> <br></td>
			</tr>
			<tr>
			  <td width="74" align="right" valign="top">��ϸ˵����<br></td> 
			  <td width="663"> <html:hidden property="content" value="<%=gods.getContent()%>"  />
			  <IFRAME ID="eWebEditor1" src="ewebeditor.htm?id=content&style=mini" frameborder="0" scrolling="no" width="550" height="350"></IFRAME>
			  <br></td>
			</tr>
			
			<tr>
			  <td width="74">			              <br></td>
			  <td width="663"><html:submit>�ύ</html:submit>
<html:reset >����</html:reset></td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1" height="10"></td>
			  <td width="663" class="STYLE1"> </td>
			</tr>
			 </html:form>
		</table>

		</td >
	</tr>
	
</table>
</body>
<script language="javascript">
function confirmdelete(Planid){
  if(confirm('ȷ��Ҫɾ����������')){
  	location.replace('<%=request.getContextPath()%>/planAction.do?method=delete&amp;id='+Planid);
  }
}
</script>
</html>
