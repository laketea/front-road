<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.service.ReviewService"%>
<%@page import="com.bookstore.po.User"%>
<%@page import="com.bookstore.po.Gods"%>
<%@page import="com.bookstore.po.Review"%>
<%@page import="com.bookstore.po.Subject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.bookstore.util.UtilFun"%>
<%@page import="com.bookstore.util.Page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
h2 { margin:0; padding:0;font-size:10pt; font-family:'微软雅黑'; color:#00000;}
#float span { float:right; margin-top:-15px;}
</style>
</head>
<%
	String id = request.getParameter("id");
	if(id==null){id="3";}
String pageNo = request.getParameter("pageNo");
	if(pageNo==null){pageNo="1";}
ReviewService rservice = new ReviewService();
	Page pages = rservice.getGodsReviewPage(5,Integer.valueOf(pageNo),id);
	List result = pages.getThisPageElements();
	
%>
<table height="0" border="0" align="center" cellpadding="0" cellspacing="0">
 <%
	  for(int i=0;i<result.size();i++){
			Review review  =(Review)result.get(i);
	  %>
      <tr>
        <td height="167" colspan="3" align="center" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="110" rowspan="2" align="center" valign="bottom"><img src="images/tg_gt_tx.png" width="51" height="51" /></td>
            <td width="836" height="30" align="left" class="de_table"><div id="float"><h2>&nbsp;&nbsp;标题：<%=review.getTitle()%></h2><span style=";color:#808080; font-size:8pt; font-family:'宋体'; float:right">[<%=review.getRedate()%>]&nbsp;</span></div></td>
          </tr>
          <tr>
            <td height="40" align="left" valign="middle" class="review_gods">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:10pt; font-family:'微软雅黑'; color:#61861e">优点：</span><%=review.getAdvantage()%></td>
          </tr>
          <tr>
            <td height="28" align="center"><%=review.getUsername()%></td>
            <td height="28" align="left" valign="top" class="review_gods">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:10pt; font-family:'微软雅黑'; color:#61861e">不足：</span><%=review.getDefect()%></td>
          </tr>
          <tr>
            <td height="46" align="center" valign="top"><p>购买日期</p>
              <p><%=review.getOrderdate()%></p></td>
            <td height="46" align="left" valign="top" class="de_gods_2">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:10pt; font-family:'微软雅黑'; color:#61861e">心得：</span><%=review.getView()%></td>
          </tr>
          
        </table></td>
      </tr>
	  <%
	  }
	  if(result.size()!=0){
	  %>
      <tr>
        <td height="50" colspan="3" align="right" valign="bottom"><table  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style=" border-bottom: 1px solid #93ac64;border-left: 1px solid #93ac64;border-top: 1px solid #93ac64; margin-right:50">
  <tr>
  <td style="border-right:1px solid #93ac64;" width="40px" align="center"  height="25"><a href="reviewiframe.jsp?pageNo=1&id=<%=id%>" >首页</a></td>
  <%for(int i=1;i<=pages.getPageNumber();i++){ %>
        
        <td style="border-right:1px solid #93ac64;" width="40px" align="center"  height="25"><a href="reviewiframe.jsp?pageNo=<%=i %>&id=<%=id%>" ><%=i %></a></td>
        <%} %>
	<td style="border-right:1px solid #93ac64;" width="60" align="center"><a href="reviewiframe.jsp?pageNo=<%=pages.getPageNumber()%>&id=<%=id%>" >最后一页</a></td>
  </tr>
</table></td>
      </tr>
	  <%}%>
</table>

</body>
</html>
