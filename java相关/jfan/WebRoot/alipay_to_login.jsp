<%
/* *
 *���ܣ���ݵ�¼�ӿڽ���ҳ
 *�汾��3.2
 *���ڣ�2011-03-17
 *˵����
 *���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
 *�ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���

 *************************ע��*****************
 *������ڽӿڼ��ɹ������������⣬���԰��������;�������
 *1���̻��������ģ�https://b.alipay.com/support/helperApply.htm?action=consultationApply�����ύ���뼯��Э�������ǻ���רҵ�ļ�������ʦ������ϵ��Э�����
 *2���̻��������ģ�http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9��
 *3��֧������̳��http://club.alipay.com/read-htm-tid-8681712.html��
 *�������ʹ����չ���������չ���ܲ�������ֵ��
 **********************************************
 */
%>
<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="gbk"%>
<%@ page import="com.alipay.services.*"%>
<%@ page import="com.alipay.util.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<title>֧������ݵ�¼�ӿ�</title>
	</head>
	<%
    
		////////////////////////////////////�������//////////////////////////////////////
		
		//ѡ�����//

		//������ʱ���
		String anti_phishing_key  = "";
		//��ȡ�ͻ��˵�IP��ַ�����飺��д��ȡ�ͻ���IP��ַ�ĳ���
		String exter_invoke_ip= "";
		//ע�⣺
		//1.������ѡ���Ƿ��������㹦��
		//2.exter_invoke_ip��anti_phishing_keyһ�������ù�����ô���Ǿͻ��Ϊ�������
		//3.���������㹦�ܺ󣬷��������������Ա���֧��Զ��XML�����������úøû�����
		//4.����ʹ��POST��ʽ��������
		//ʾ����
		//anti_phishing_key = AlipayService.query_timestamp();	//��ȡ������ʱ�������
		//exter_invoke_ip = "202.1.1.1";
		
		//////////////////////////////////////////////////////////////////////////////////
		
		//������������������
		Map<String, String> sParaTemp = new HashMap<String, String>();
        sParaTemp.put("anti_phishing_key", anti_phishing_key);
        sParaTemp.put("exter_invoke_ip", exter_invoke_ip);
		
		//���캯������������URL
		String sHtmlText = AlipayService.alipay_auth_authorize(sParaTemp);
		out.println(sHtmlText);
	%>
	<body>
	</body>
</html>
