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
String jiaoshibianhao=request.getParameter("jiaoshibianhao");String jiaoshixingming=request.getParameter("jiaoshixingming");String xingbie=request.getParameter("xingbie");String suoshuyuanxi=request.getParameter("suoshuyuanxi");String zhicheng=request.getParameter("zhicheng");String shenfenzhenghao=request.getParameter("shenfenzhenghao");String mima=request.getParameter("mima");
String sql="update jiaoshixinxi set jiaoshibianhao='"+jiaoshibianhao+"',jiaoshixingming='"+jiaoshixingming+"',xingbie='"+xingbie+"',suoshuyuanxi='"+suoshuyuanxi+"',zhicheng='"+zhicheng+"',shenfenzhenghao='"+shenfenzhenghao+"',mima='"+mima+"' where jiaoshibianhao= '"+request.getSession().getAttribute("username")+"'";
connDbBean.executeUpdate(sql);
ou.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='jiaoshixinxi_updt2.jsp';</script>");
%>
  </body>
</html>


