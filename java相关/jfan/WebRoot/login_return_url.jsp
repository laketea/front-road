<%
/* *
 ���ܣ�֧����ҳ����תͬ��֪ͨҳ��
 �汾��3.2
 ���ڣ�2011-03-17
 ˵����
 ���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
 �ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���

 //***********ҳ�湦��˵��***********
 ��ҳ����ڱ������Բ���
 �ɷ���HTML������ҳ��Ĵ��롢�̻�ҵ���߼��������
 //********************************
 * */
%>
<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.alipay.util.*"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.service.OrderService"%>
<%@page import="com.bookstore.po.User"%>
<%@page import="com.bookstore.po.Orders"%>
<%@page import="java.util.Date"%>
<%@ page import="com.alipay.services.*"%>
<%@ page import="com.alipay.config.*"%>
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<title>֧����ҳ����תͬ��֪ͨҳ��</title>
  </head>
  <body>
<%
	//��ȡ֧����GET����������Ϣ
	Map<String,String> params = new HashMap<String,String>();
	Map requestParams = request.getParameterMap();
	for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
		String name = (String) iter.next();
		String[] values = (String[]) requestParams.get(name);
		String valueStr = "";
		for (int i = 0; i < values.length; i++) {
			valueStr = (i == values.length - 1) ? valueStr + values[i]
					: valueStr + values[i] + ",";
		}
		//����������δ����ڳ�������ʱʹ�á����mysign��sign�����Ҳ����ʹ����δ���ת��
		valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
		params.put(name, valueStr);
	}

	
	//��ȡ֧������֪ͨ���ز������ɲο������ĵ���ҳ����תͬ��֪ͨ�����б�(���½����ο�)//

	//֧�����û�id
	String user_id = request.getParameter("user_id");
	//��Ȩ����
	String token = request.getParameter("token");
	String real_name = request.getParameter("real_name");





	//֧��
	String trade_no = request.getParameter("trade_no");				//֧�������׺�
	
	//��ȡ֧������֪ͨ���ز������ɲο������ĵ���ҳ����תͬ��֪ͨ�����б�(���Ͻ����ο�)//
	
	//����ó�֪ͨ��֤���
	boolean verify_result = AlipayNotify.verify(params);

	//��ȡ֧������֪ͨ���ز������ɲο������ĵ���ҳ����תͬ��֪ͨ�����б�(���Ͻ����ο�)//
	
	//����ó�֪ͨ��֤���
	//boolean verify_result = AlipayNotify.verify(params);
	String url="default.jsp";
	if(verify_result){
		if(trade_no==null||"".equals(trade_no)){
		session.setAttribute("token",token);
		
		//out.println("��֤�ɹ�<br />token:"+token);
		//out.println("֧�����û�<br />user_id:"+user_id);
		real_name = new String(real_name.getBytes("ISO-8859-1"), "gbk");
		UserService service = new UserService();
		User uss =  service.getUserByEname(real_name);
		if(uss==null){
		User user = new User();
		user.setUsername(real_name);
		user.setEmail(user_id+"_alipay");
		user.setCode("0");
		user.setPoint(new Long("0"));
		user.setStatus(new Long("0"));
		user.setPassword("123456");	
		service.addUser(user);	
		User us = service.getUserByEname(user.getUsername());
		session.setAttribute("user",us);
		session.setAttribute("userid",us.getId().toString());
		} else {
			session.setAttribute("user",uss);
			session.setAttribute("userid",uss.getId().toString());
		}
		String url_dz = (String)session.getAttribute("url_dz");
		url = "default.jsp";
		if(url_dz!=null){
			url="submitorder.jsp";
		}
		
		} else {
			
			String order_no = request.getParameter("out_trade_no");	        //��ȡ������
			String total_fee = request.getParameter("total_fee");	        //��ȡ�ܽ��
			String subject = new String(request.getParameter("subject").getBytes("ISO-8859-1"),"gbk");//��Ʒ���ơ���������
			String body = "";
			if(request.getParameter("body") != null){
				body = new String(request.getParameter("body").getBytes("ISO-8859-1"), "gbk");//��Ʒ������������ע������
			}
			String buyer_email = request.getParameter("buyer_email");		//���֧�����˺�
			String trade_status = request.getParameter("trade_status");		//����״̬
			if(trade_status.equals("TRADE_SUCCESS")){
				OrderService oservice = new OrderService();
				Orders order = oservice.getOrder((Long.valueOf(order_no)-10000));
				order.setPayflag("1");
				order.setZfbprice(Double.valueOf(total_fee));
				order.setZfbuser(buyer_email);
				order.setZfbid(trade_no);
				Date now = new Date();
				String zfbdate = now.toString();
				order.setZfbdate(zfbdate);
				order.setZfbstatus(trade_status);
				UserService uservice = new UserService();
				String userids = (String)session.getAttribute("userid");
				User us = uservice.getUser(Long.valueOf(userids));
				long pt= us.getPoint()+order.getPoint()-order.getUserpoint();
				us.setPoint(pt);
				uservice.UpdateUser(us);
				oservice.UpdateOrder(order);
				
				
			}
			



			out.println("��֤�ɹ�<br />");
		out.println("trade_no=" + trade_no);
		out.println("order_no=" + order_no);
		out.println("<br />total_fee=" + total_fee);
		out.println("<br />subject=" + subject);
		out.println("<br />body=" + body);
		out.println("<br />buyer_email=" + buyer_email);
		out.println("<br />trade_status=" + trade_status);
			}
			response.sendRedirect(url);
	}
		
%>
  </body>
</html>
