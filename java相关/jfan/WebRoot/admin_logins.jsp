<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书商城后台管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>  

  <body>
  	<html:form action="/adminAction" onsubmit= "return   validateOrderForm(this) " >  
  	<html:hidden property="method" value="login" />
    <table width="50%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
      <caption>
      <span class="style1">      后台管理登 录      </span><br>
      </caption>
      <tr align="left">
        <th width="40%" height="35" align="center" scope="row">用户名:</th>
        <td width="60%"><html:text property="name" />&nbsp;<html:errors property="username" /></td>
      </tr>
      <tr align="left">
        <th height="35" align="center" scope="row">密&nbsp;&nbsp;码:</th>
        <td><html:password property="password" />&nbsp;<html:errors property="password" /></td>
      </tr>
      <tr align="center">
        <th height="35" colspan="2" scope="row"><html:submit property="submit" value="登录" />&nbsp;<html:cancel >取消</html:cancel>
         </th>
      </tr>
    </table>
    </html:form>
  </body>
</html>
  <html:javascript   formName= "Orderform "   cdata= "false " 
            dynamicJavascript= "true "   staticJavascript= "false "/> 
