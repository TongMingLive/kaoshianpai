<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
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
String yuanximingcheng=request.getParameter("yuanximingcheng");
  String zhuanyemingcheng=request.getParameter("zhuanyemingcheng");
String id=request.getParameter("id");
String sql="update [zhuanye] set yuanximingcheng='"+yuanximingcheng+"',zhuanyemingcheng='"+zhuanyemingcheng+"' where id= "+id;
connDbBean.executeUpdate(sql);
    PrintWriter ou = response.getWriter();
ou.print("<script>alert('修改成功!!');location.href='zhuanye_list.jsp';</script>");
%>
  </body>
</html>


