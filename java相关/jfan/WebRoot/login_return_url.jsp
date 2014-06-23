<%
/* *
 功能：支付宝页面跳转同步通知页面
 版本：3.2
 日期：2011-03-17
 说明：
 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

 //***********页面功能说明***********
 该页面可在本机电脑测试
 可放入HTML等美化页面的代码、商户业务逻辑程序代码
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
		<title>支付宝页面跳转同步通知页面</title>
  </head>
  <body>
<%
	//获取支付宝GET过来反馈信息
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
		//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
		valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
		params.put(name, valueStr);
	}

	
	//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//

	//支付宝用户id
	String user_id = request.getParameter("user_id");
	//授权令牌
	String token = request.getParameter("token");
	String real_name = request.getParameter("real_name");





	//支付
	String trade_no = request.getParameter("trade_no");				//支付宝交易号
	
	//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
	
	//计算得出通知验证结果
	boolean verify_result = AlipayNotify.verify(params);

	//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
	
	//计算得出通知验证结果
	//boolean verify_result = AlipayNotify.verify(params);
	String url="default.jsp";
	if(verify_result){
		if(trade_no==null||"".equals(trade_no)){
		session.setAttribute("token",token);
		
		//out.println("验证成功<br />token:"+token);
		//out.println("支付宝用户<br />user_id:"+user_id);
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
			
			String order_no = request.getParameter("out_trade_no");	        //获取订单号
			String total_fee = request.getParameter("total_fee");	        //获取总金额
			String subject = new String(request.getParameter("subject").getBytes("ISO-8859-1"),"gbk");//商品名称、订单名称
			String body = "";
			if(request.getParameter("body") != null){
				body = new String(request.getParameter("body").getBytes("ISO-8859-1"), "gbk");//商品描述、订单备注、描述
			}
			String buyer_email = request.getParameter("buyer_email");		//买家支付宝账号
			String trade_status = request.getParameter("trade_status");		//交易状态
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
			



			out.println("验证成功<br />");
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
