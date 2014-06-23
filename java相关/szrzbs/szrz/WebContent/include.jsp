<%@ page pageEncoding="GBK"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.szrz.service.impl.*" %>
<%@ page import="com.szrz.service.*" %>
<%@ page import="com.szrz.dao.*" %>
<%@ page import="com.szrz.dao.impl.*" %>
<%@ page import="com.szrz.domain.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  

<%@ taglib uri="/struts-tags" prefix="s"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
