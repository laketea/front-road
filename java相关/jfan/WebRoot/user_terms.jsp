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
        <td width="201" height="52" bgcolor="#93AC64" class="faq_RT">&nbsp;</td>
        <td width="201" rowspan="9" align="left" valign="top" class="faq_R">
		
		<DIV class="content">
<H1>�û�Э��</H1>
<DIV class="sector">
<H2>�û�Э��</H2>
<H4>һ���������������ȷ�������</H4>
<P>����վ�ϵĸ�����ӷ��������Ȩ������Ȩ�鱾վ����վ�ṩ�ķ�����ȫ�����䷢���ķ�������Ͳ��������ϸ�ִ�С��û�������ȫͬ�����з���������ע����򣬲��ܳ�Ϊ

��վ����ʽ�û����û�ȷ�ϣ���Э�������Ǵ���˫��Ȩ������ĵ�ȻԼ�����ݣ�����Υ������ǿ���Է��ɣ�����ʼ����Ч�����¶�����ͬʱ����Ҳͬʱ��������ӵ�й�����Щ��Ʒ��Ȩ������

����Ϊ���������ҽ��������ڶ������ṩ��������Ϣ����ʵ�Ը���</P></DIV>
<DIV class="sector">
<H4>����������</H4>
<P>��վ�����Լ��Ĳ���ϵͳͨ�����ʻ�������Ϊ�û��ṩ�������ͬʱ���û����룺��</P>
<P>&nbsp;&nbsp;A�������䱸�����������豸���������˵��ԡ����ƽ�����������ر�����װ�á�</P>
<P>&nbsp;&nbsp;B�����и�������������֧������˷����йصĵ绰���á�������á� </P>
<P>���ڱ�վ���ṩ������������Ҫ�ԣ��û�Ӧͬ�⣺</P>
<P>&nbsp;&nbsp;A�����꾡��׼ȷ�ĸ������ϡ�</P>
<P>&nbsp;&nbsp;B�����ϸ���ע�����ϣ����ϼ�ʱ���꾡��׼ȷ��Ҫ��</P>
<P>		��վ���û��ĵ����ʼ����ֻ��ŵ���˽���Ͻ��б�������ŵ������δ����û���ɵ���������Խ��û��ĸ���������Ϣ�������۸��κε�������������������⣺		</P>
<P>&nbsp;&nbsp;A���û�ͬ���õ������������ϣ�</P>
<P>&nbsp;&nbsp;B���û�ͬ�⹫����������ϣ�����Ϊ���ṩ�Ĳ�Ʒ�ͷ���</P>
<P>&nbsp;&nbsp;C����վ�����û�Υ���˱�վ���������վ����ʹ�ù涨��</P></DIV>
<DIV class="sector">
<H4>�����۸������</H4>
<P>��վ��Ʒ�ļ۸�Ϳɻ��Զ��ڱ�վ��ָ����������Ϣ����ʱ�����Ҳ����κ�֪ͨ����Ʒ�ļ۸񶼰�������ֵ˰����������������������ȷ�������Ķ��������ڹ�Ӧ����ۣ�˰��仯��

��ļ۸�仯������Ȩȡ�����Ķ�������ϣ�����ܼ�ʱͨ�������ʼ���绰֪ͨ��վ�ͻ����񲿡�</P></DIV>
<DIV class="sector">
<H4>�ġ��ͻ�</H4>
<P>��վ����Ѳ�Ʒ�͵�����ָ�����ͻ���ַ�������ڱ�վ���г����ͻ�ʱ��Ϊ�ο�ʱ�䣬�ο�ʱ��ļ����Ǹ��ݿ��״���������Ĵ�����̺��ͻ�ʱ�䡢�ͻ��ص�Ļ����Ϲ��Ƶó��ġ�
		<BR><BR>		�����׼ȷ����д������ʵ�������ͻ���ַ����ϵ��ʽ�������������ɶ����ӳٻ��޷����͵ȣ���վ���޷��е��������͵����Σ�
		<BR>&nbsp;&nbsp;A��	�ͻ��ṩ������Ϣ�Ͳ���ϸ�ĵ�ַ�� 
<BR>&nbsp;&nbsp;B��	�����ʹ�����ǩ�գ��ɴ���ɵ��ظ������������ķ��ü���صĺ���� 
<BR>&nbsp;&nbsp;C��	���ɿ��������磺��Ȼ�ֺ�����ͨ���ϡ�ͻ��ս���ȡ� 		</P></DIV>
<DIV class="sector">
<H4>�塢�û����˻�������Ͱ�ȫ��</H4>
<P>�û�һ��ע��ɹ�����Ϊ��վ�ĺϷ��û������õ�һ��������û�����������ʱ����ָʾ�ı��������롣�û������û��������밲ȫ��ȫ�����Ρ����⣬ÿ���û���Ҫ�������û������е�

���л���¼���ȫ���û��������κηǷ�ʹ���û��˻�����ڰ�ȫ©���������������ͨ�汾վ��
		<BR><BR>		�緢�����ü����������ж���ע�ᡢ���롢��������Σ�������Ʒ��Ȩ�ڲ�����֪ͨ�û�������µ������жϻ���ֹ���û��ṩ���������ͨ

֪�û���		</P></DIV>
<DIV class="sector">
<H4>�����ܾ��ṩ����</H4>
<P>�û����˶���������ʹ�óе����ա���վ�Դ˲����κ����͵ĵ�������������ȷ�Ļ������ģ����ǲ�����ҵ�Ե������������ض�Ŀ�ĺͲ�Υ���涨���ʵ����������ơ���վ����������һ

���������û���Ҫ��Ҳ���������񲻻����жϣ��Է���ļ�ʱ�ԣ���ȫ�ԣ���������������������վ���ڱ�վ�ϵõ����κ���Ʒ���������׽��̣�����������		</P></DIV>
<DIV class="sector">
<H4>�ߡ��û���˽�ƶ�</H4>
<P>�����û�������˽�Ǳ�վ��һ��������ߡ����ԣ���Ϊ�����ϵڶ���ע�����Ϸ����Ĳ��䣬��վһ��������δ���Ϸ��û���Ȩʱ�������༭��͸¶��ע�����ϼ������ڱ�վ�еķǹ�������

��		</P></DIV>
<DIV class="sector">
<H4>�ˡ����û���Ϣ�Ĵ洢������</H4>
<P>��վ�����û���������Ϣ��ɾ���򴢴�ʧ�ܸ��𡣱�վ���ж��û�����Ϊ�Ƿ���ϱ�վ���������Ҫ��;���ı���Ȩ��������û�Υ���˷�������Ĺ涨����վ���ж϶����ṩ�������

��Ȩ����		</P></DIV>
<DIV class="sector">
<H4>�š���������</H4>
<P>�û���վ����ʱ����ʵ������ж�һ������������񡣱�վ������κθ��˻�������������ʱ�жϷ����û��Ժ����������޸������飬��Ա�վ�ķ�������������ʹ����Ȩ����
		<BR>&nbsp;&nbsp;A��ֹͣʹ�ñ�վ���������<BR>&nbsp;&nbsp;B��ͨ�汾վֹͣ�Ը��û��ķ��� <BR>
		�����û�������û�ʹ����������Ȩ��������ֹ������ʱ���û�û��Ȩ��Ҫ��վ����վҲû���������κ�δ�������Ϣ���ṩδ��ɵķ�����û����������		</P></DIV>
<DIV class="sector">
<H4>ʮ��ͨ��</H4>
<P>���з����û���ͨ�涼��ͨ����Ҫҳ��Ĺ��������ʼ��򳣹���ż����͡���վ�Ļ��ϢҲ������ͨ��ҳ�湫�漰�����ʼ���ʽ���û����͡��û�Э��������޸ġ���������������

��Ҫ�¼���ͨ�涼���Դ���ʽ���С�		</P></DIV>
<DIV class="sector">
<H4>ʮһ������������ݵ�����Ȩ</H4>
<P>��վ���������������ݰ��������֡������������ͼƬ��¼��ͼ������е�ȫ�����ݣ������ʼ���ȫ�����ݣ���վΪ�û��ṩ��������Ϣ��������Щ�����ܰ�Ȩ���̱ꡢ��ǩ������

�Ʋ�����Ȩ���ɵı��������ԣ��û�ֻ���ڱ�վ�͹������Ȩ�²���ʹ����Щ���ݣ����������Ը��ơ�������Щ���ݡ������������йص�������Ʒ����վ���е����°�Ȩ��ԭ�����ߺͱ�վ

��ͬ���У��κ�����Ҫת�ر�վ�����£���������ԭ�����߻�վ��Ȩ��		</P></DIV>
<DIV class="sector">
<H4>ʮ������������</H4>
<P>���򲻿ɿ�����������վ�޷����Ƶ�ԭ��ʹ��վ����ϵͳ�������޷�����ʹ�õ������Ͻ����޷���ɻ�ʧ�йص���Ϣ����¼�ȣ���վ���е����Ρ����Ǳ�վ�ᾡ���ܺ����Э�������ƺ�

���ˣ���Ŭ��ʹ�ͻ����ܾ�����ʧ��		</P></DIV>
<DIV class="sector">
<H4>ʮ�������ɹ�Ͻ������</H4>
<P>			��Э��Ķ�����ִ�кͽ��ͼ�����Ľ����Ӧ�����й����ɡ�<BR><BR>
			�緢����վ�����������й�������ִ�ʱ������Щ�����ȫ�����ɹ涨���½��ͣ��������Ϸ����������ɱ��ֶ��û���������Ч����Ӱ�졣<BR><BR>
			��Э��Ĺ涨�ǿɷָ�ģ��籾Э���κι涨���ö�Ϊ��Ч�򲻿�ִ�У��ù涨�ɱ�ɾ������������Ӧ����ִ�С�<BR><BR>
			��˫���ͱ�Э�����ݻ���ִ�з����κ����飬˫��Ӧ�����Ѻ�Э�̽����Э�̲���ʱ���κ�һ��������վ���ڵص�����Ժ�������ϡ�		</P></DIV></DIV>		  </td>
      </tr>
      <tr>
        <td height="32" align="left" bgcolor="#93AC64" class="faq_Rr">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="faq.jsp" style="color:#000000; font-size:14px;font-weight: bold;">����Ҫ������</a></td>
      </tr>
      <tr>
        <td height="42" bgcolor="#93AC64" class="faq_Rr">&nbsp;</td>
      </tr>
      <tr>
        <td height="32" align="left" bgcolor="#93AC64" class="faq_Rr" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="privacy.jsp" style="color:#000000; font-size:14px;font-weight: bold;">��˽����</a></td>
      </tr>
      <tr>
        <td height="42" bgcolor="#93AC64" class="faq_RB">&nbsp;</td>
      </tr>
      <tr>
        <td height="32" align="left" bgcolor="#FFFFFF" class="faq_LL" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="user_terms.jsp" style="color:#000000; font-size:14px;font-weight: bold;">�û�Э��</a></td>
      </tr>
      <tr>
        <td height="42" bgcolor="#93AC64" class="faq_Rr">&nbsp;</td>
      </tr>
      <tr>
        <td height="32" align="left" bgcolor="#93AC64" class="faq_Rr" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="contact.jsp" style="color:#000000; font-size:14px;font-weight: bold;">��ϵ����</a></td>
      </tr>
      <tr>
        <td height="2100" bgcolor="#93AC64" class="faq_RB">&nbsp;</td>
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
