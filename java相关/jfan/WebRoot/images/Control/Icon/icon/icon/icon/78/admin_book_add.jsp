<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>

<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.po.Gods"%>
<%@page import="com.bookstore.po.Subject"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat" %>

<%


SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>���߷�α��֤ϵͳ��̨����ϵͳ</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="control.css" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="css/calendar.css">
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
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
	if (document.form1.grade.value=="") {      
		alert("��ѡ���꼶!");
		document.form1.grade.focus();        
		return false;
	}
	if (document.form1.subject.value=="") {      
		alert("��ѡ���Ŀ!");
		document.form1.subject.focus();        
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
     var regImg = new RegExp(/\.(gif|GIF|jpg|JPG|jpeg|JPEG)$/);
    var obj=document.getElementById('photo').value;
    if(obj.match(regImg)){    
    }else{
        alert('���ϴ�ͼƬ��ʽ�ļ�');
        document.getElementById('photo').focus();
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

		
	
		
		<table width="750" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td class="TDHead" colspan="2" >�����Ʒ</td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1" height="10"></td>
			  <td width="663" class="STYLE1"> </td>
			</tr>
			 <html:form action="/godsAction" enctype="multipart/form-data" styleId="form1" onsubmit="return checkform()"  > <html:hidden property="method" value="add" />
			  
			<tr>
			  <td width="74" align="right" class="STYLE1">��Ʒ���ƣ�<br></td>
			  <td width="663" class="STYLE1"><html:text property="name"  size="56"/><span class="redhat">*</span> <br></td>
			</tr>
						
			<tr>
			  <td width="74" align="right" class="STYLE1">ԭ�ۣ�<br></td>
			  <td width="663" class="STYLE1">
			  	<html:text property="oldprice"  size="20"/><span class="redhat">*</span> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				�ּۣ�<html:text property="newprice"  size="20"/><span class="redhat">*</span>
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
			  <td width="74" align="right" class="STYLE1">���ࣺ<br></td>
			  <td width="663" class="STYLE1">
			  	<html:select property="types" >
			  		<html:option value="">��ѡ����Ʒ����</html:option>
			<% UserService service = new UserService();
			List results = null;
			results = service.getSubjectList(1);
			for(int i=0;i<results.size();i++){
				Subject subject  =(Subject)results.get(i);
			%>		
					<html:option value="<%=subject.getId().toString() %>"><%=subject.getFirstname() %></html:option>
				
			<%
			} %>
				</html:select> 
				 <span class="redhat">*</span> &nbsp;���֣� 
				
			  <br></td>
			</tr>
			
			<tr>
			  <td width="74" align="right" class="STYLE1">��ʼʱ�䣺<br></td>
			  <td width="663" class="STYLE1">
			  	<input  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}'})"
            type="text" id="begin_time" name="begin_time" readOnly/><span class="redhat">*</span>&nbsp;&nbsp;&nbsp;&nbsp;
����ʱ�䣺<input  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'begin_time\')}'})"
            type="text" id="end_time" name="end_time" readOnly/><span class="redhat">*</span>
			  </td>
			</tr>
			
			<tr>
			  <td width="74" align="right" class="STYLE1">����ͼ��<br></td>
			  <td width="663" class="STYLE1">
			  	<html:file property="minphoto" size="46"  /><span class="redhat">*</span> 
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">��ͼ��<br></td>
			  <td width="663" class="STYLE1">
			  	<html:file property="maxphoto" size="46"  /><span class="redhat">*</span> 
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" valign="top" class="STYLE1">������<br></td>
			  <td width="663" class="STYLE1"><TEXTAREA  name="discript" rows="5" cols="65"></TEXTAREA><span class="redhat">*</span> <br></td>
			</tr>
			<tr>
			  <td width="74" align="right" valign="top">��ϸ˵����<br></td> 
			  <td width="663"> <html:hidden property="content"  />
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
