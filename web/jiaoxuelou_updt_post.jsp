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
String jiaoxuelouhao=request.getParameter("jiaoxuelouhao");String jiaoxueloumingcheng=request.getParameter("jiaoxueloumingcheng");
String id=request.getParameter("id");
String sql="update jiaoxuelou set jiaoxuelouhao='"+jiaoxuelouhao+"',jiaoxueloumingcheng='"+jiaoxueloumingcheng+"' where id= "+id;
connDbBean.executeUpdate(sql);
ou.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='jiaoxuelou_list.jsp';</script>");
%>
  </body>
</html>


