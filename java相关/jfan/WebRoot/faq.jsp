<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.po.User"%>
<%@page import="com.bookstore.po.Gods"%>
<%@page import="com.bookstore.po.Subject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.bookstore.util.UtilFun"%>
<%@page import="com.bookstore.util.Page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�񷲷�</title>

<link href="css.css" rel="stylesheet" type="text/css" />
<SCRIPT type="text/javascript" charset="GB2312" src="js/jquery-1.4.22.min.js"></SCRIPT>
<SCRIPT language=Javascript>
			<!--
				var initialTimeElement = new Array();
				var showTimeElement = new Array();
				
				initialTimeElement[0] = 0.1;					
				showTimeElement[0] = "leftTime0";		
				
			 //-->
    </SCRIPT>

<script language="javascript">
//��ʼ��
var def="6";
function mover(object){
  //���˵�
  var mm=document.getElementById("m_"+object);
  mm.className="m_li_a";
  //��ʼ���˵�����Ч��
 
  //�Ӳ˵�
   
}
function mout(object){
  //���˵�
  var mm=document.getElementById("m_"+object);
  mm.className="m_li";
  
}
</script>
<style type="text/css">
<!--
.STYLE1 {color: #000000}
-->
</style>
</head>

<%GodsService godsservice = new GodsService();
	Gods topgods = godsservice.getTopGods();
	Page todaylist = godsservice.getTodayGods(1,35,1);
	List result = todaylist.getThisPageElements();
	Date now = new Date();
    long nowLong = now.getTime();

%>


<body>
<jsp:include page="heads.jsp"  />
<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
        <td colspan="3" height="20px"></td>
</tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" height="200" align="center" valign="top" bgcolor="#FFFFFF" class="faq" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="28" height="300" rowspan="9" bgcolor="#93AC64" class="faq_L">&nbsp;</td>
        <td width="201" height="52" bgcolor="#93AC64" class="faq_R">&nbsp;</td>
        <td width="201" rowspan="9" align="left" valign="top" class="faq_R">
		
		<div class="content">
		<h1>��������</h1>
		<ul class="faqlist">
                    <li>
                        <h4><span>��Ʒ��֤</span><div class="switch"></div></h4>
                        <p>���Ӱ��ƣ�ȡ֮�е����ڳ����ձ�ȱ������������Ų��Ե���Ϊ�ɹ�����������֤����վ������Ʒ����Ϊ��Ʒ����һ��ʮ��˵��������</p>
                    </li>
                    <li>
                        
                        <h4><span>��������</span><div class="switch"></div></h4>
                        <p>������ݣ�ȫ���ϸ��ܰ�װ����ݵ���Ҳ������ʾ�κ����Ʒ��ص����֣�����ǩ�տ��ʱ�����Ρ�</p>
                    </li>
					
					<li>
                        
                        <h4><span>���Ѿ������ˣ�ʲôʱ�򷢻���</span><div class="switch"></div></h4>
                        <p>ÿ��17:00ǰ�Ķ������췢��������17:00�ڶ��췢����</p>
                    </li>
					
					<li>
                        
                        <h4><span>��θ��</span><div class="switch"></div></h4>
                        <p>Ŀǰ֧����֧��������������֧��ƽ̨��ȷ�����Ľ��װ�ȫ��</p>
                    </li>
					
					<li>
                        
                        <h4><span>�ʷ���ô���㣿</span><div class="switch"></div></h4>
                        <p>�����ĳ�ֵ�Ź����µ���Ʒȫ�������ȫ�����ʷѣ����ʼ�EMS��6Ԫ��ۡ�</p>
                    </li>
					
				
					
					<li>
                        
                        <h4><span>�Ź��ɹ����һ��ܹ���ô��</span><div class="switch"></div></h4>
                        <p>�Ź��ɹ����Կ��Լ�������</p>
                    </li>
					
					<li>
                        
                        <h4><span>�Ҷ���Ʒ�����⣬���Խ����˻���</span><div class="switch"></div></h4>
                        <p>��ܰ��ʾ�����ݹ�����ط��ɹ涨������Ʒ����������ʹ�ã�18��������ʿ����������Ʒ�������⣬һ���۳������������⣬�Ų��˻�������£�лл��</p>
                    </li>
                </ul>
            </div>
		<SCRIPT type="text/javascript">
    $('.faqlist li h4').click(function(){
        $('.faqlist li p').not($(this).nextAll()).hide();
        $('.faqlist li h4 .switch_on').not($(this).children('.switch')).removeClass('switch_on');
        $(this).nextAll().toggle();
        $(this).children('.switch').toggleClass('switch_on');
    }).nextAll().hide();
</SCRIPT>		</td>
      </tr>
      <tr>
        <td height="32" align="left" class="faq_LL">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="faq.jsp" style="color:#000000; font-size:14px;font-weight: bold;">����Ҫ������</a></td>
      </tr>
      <tr>
        <td height="42" bgcolor="#93AC64" class="faq_RT">&nbsp;</td>
      </tr>
      <tr>
        <td height="32" align="left" bgcolor="#93AC64" class="faq_Rr" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="privacy.jsp" style="color:#000000; font-size:14px;font-weight: bold;">��˽����</a></td>
      </tr>
      <tr>
        <td height="42" bgcolor="#93AC64" class="faq_Rr">&nbsp;</td>
      </tr>
      <tr>
        <td height="32" align="left" bgcolor="#93AC64" class="faq_Rr" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="user_terms.jsp" style="color:#000000; font-size:14px;font-weight: bold;">�û�Э��</a></td>
      </tr>
     <tr>
        <td height="42" bgcolor="#93AC64" class="faq_Rr">&nbsp;</td>
      </tr>
      <tr>
        <td height="32" align="left" bgcolor="#93AC64" class="faq_Rr" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="contact.jsp" style="color:#000000; font-size:14px;font-weight: bold;">��ϵ����</a></td>
      </tr>
      <tr>
        <td height="500" bgcolor="#93AC64" class="faq_RB">&nbsp;</td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<jsp:include page="bottom.jsp"  />
<A id=top-link onClick="goTop();return false;" 
href="javascript:void(0);">&nbsp;&nbsp;&nbsp;&nbsp;</A>
</body>
</html>
<SCRIPT type=text/javascript>
function goTop(acceleration, time) {
 acceleration = acceleration || 0.1;
 time = time || 16;
 var x1 = 0;
 var y1 = 0;
 var x2 = 0;
 var y2 = 0;
 var x3 = 0;
 var y3 = 0;
 
 if (document.documentElement) {
  x1 = document.documentElement.scrollLeft || 0;
  y1 = document.documentElement.scrollTop || 0;
 }
 if (document.body) {
  x2 = document.body.scrollLeft || 0;
  y2 = document.body.scrollTop || 0;
 }
 var x3 = window.scrollX || 0;
 var y3 = window.scrollY || 0;
 var x = Math.max(x1, Math.max(x2, x3));
 var y = Math.max(y1, Math.max(y2, y3));
 var speed = 1 + acceleration;
 window.scrollTo(Math.floor(x / speed), Math.floor(y / speed));

 if(x > 0 || y > 0) {
  var invokeFunction = "goTop(" + acceleration + ", " + time + ")";
  window.setTimeout(invokeFunction, time);
 }
}
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
function _fresh()
{
 var endtime=new Date("<%=topgods.getEnddate().toString().replace("-","/")%>");
 var nowtime = new Date();
 var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000);
 __d=parseInt(leftsecond/3600/24);
 __h=parseInt((leftsecond/3600)%24);
 __m=parseInt((leftsecond/60)%60);
 __s=parseInt(leftsecond%60);
 document.getElementById("times").innerHTML=__d+"�� "+__h+"Сʱ"+__m+"��"+__s+"��";
 if(leftsecond<=0){
 document.getElementById("times").innerHTML="�����ѽ���";
 clearInterval(sh);
 }
}
_fresh()
var sh;
sh=setInterval(_fresh,1000);
</SCRIPT>
<script language="javascript">
function confirmadd(bookid){
  if(confirm('ȷ��Ҫ���빺�ﳵô!')){
  	location.replace('<%=request.getContextPath()%>/cartAction.do?method=add&amp;bookid='+bookid);
  }
}
</script>
