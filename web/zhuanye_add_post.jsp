<%@ page language="java"  pageEncoding="gb2312" import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("gb2312"); 
response.setCharacterEncoding("gb2312"); 
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
    

  </head>
  
  <body>
  <%

      PrintWriter ou = response.getWriter();
	String yuanximingcheng=request.getParameter("yuanximingcheng");
  String zhuanyemingcheng=request.getParameter("zhuanyemingcheng");

	
  	  	String sql="insert into zhuanye(yuanximingcheng,zhuanyemingcheng) values('"+yuanximingcheng+"','"+zhuanyemingcheng+"') ";
  	
  	  	connDbBean.executeUpdate(sql);
  	  	ou.print("<script>alert('Ìí¼Ó³É¹¦!!');location.href='zhuanye_add.jsp';</script>");
  	  
 %>
  </body>
</html>

