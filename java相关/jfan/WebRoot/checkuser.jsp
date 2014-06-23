<%@ page import="com.bookstore.po.Admin"%>
<%
  Admin admin=null;
  if(session.getAttribute("admin")==null){
     response.sendRedirect("index.jsp");
  }
  else{
     admin=(Admin)session.getAttribute("admin");
  }
  
%>
