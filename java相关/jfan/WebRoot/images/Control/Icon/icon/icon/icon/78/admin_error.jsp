<%@ page contentType="text/html;charset=gbk" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>错误页面</title>
</head>
<body  bgcolor="#DAF9FE">
<table width="100%" border="0" cellspacing="0" bordercolor="#B0E1B3">
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#80D7F0">
      <table width="100%" border="0" align="center">
        <tr align="center" height="50" >
          <td width="90%">
				<font color="red">发生错误</font>
		  </td>
        </tr>
        <tr align="center">
          <td width="90%">
	        <%
	        	String errMsg=(String )request.getAttribute("errMsg");
	        	if(errMsg!=null && errMsg.trim().length()>0){
		        	out.println(errMsg);
	      		}else{
	      			out.println("未知错误!");
	      		}
	       %>
		  </td>
        </tr>
      </table>
   </td>
  </tr>
   <tr>
    <td >
      <table width="100%" border="0" align="center" cellspacing="0">
        <tr align="center">
          <td width="90%">
			<input type="button" name="back" value="返回" onclick="history.back();">
		  </td>
        </tr>
      </table>
   </td>
  </tr>
</table>
</body>
</html>
