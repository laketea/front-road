<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script type="text/javascript" src="loadxml.js"></script>
<script type="text/javascript" src="C_area.js"></script>
<script type="text/javascript">
	window.onload = function() {
		

		//省市地区联动（无默认值）
		var lp = new Province('lp', 'lx');
		var lc = new City('lc', 'lxx');
		var la = new Area('la', 'lxxx', '', false);
		lp.linkCity(lc);
		lc.linkArea(la);

		

	}
</script>
</head>
<body>

<br />
<fieldset><legend>市地区联动</legend> 无默认值： <span id="lp"></span><span
	id="lc"></span> <span id="la"></span> </fieldset>
	<script language="javascript">

function look(){
     var se =document.getElementById("la");   
                 var option=se.getElementsByTagName("option");   
                 var str = "" ;   
                 for(var i=0;i<option.length;++i)   
                 {   
                 if(option[i].selected)   
                 {   
                 document.getElementById("test").value = option[i].text;   
                 }   
                 }   

}
</script>

<input type="button" onClick="look()" o value="测试" >
			<input type="text" name="test" id="test">
	
</body>
</html>