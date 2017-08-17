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
String kechengmingcheng=request.getParameter("kechengmingcheng");String xueshi=request.getParameter("xueshi");String xuefen=request.getParameter("xuefen");String leixing=request.getParameter("leixing");String beizhu=request.getParameter("beizhu");
String id=request.getParameter("id");
String sql="update kechengxinxi set kechengmingcheng='"+kechengmingcheng+"',xueshi='"+xueshi+"',xuefen='"+xuefen+"',leixing='"+leixing+"',beizhu='"+beizhu+"' where id= "+id;
connDbBean.executeUpdate(sql);
ou.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='kechengxinxi_list.jsp';</script>");
%>
  </body>
</html>


