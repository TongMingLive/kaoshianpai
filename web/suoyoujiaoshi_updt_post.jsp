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
String jiaoxuelouhao=request.getParameter("jiaoxuelouhao");String jiaoxueloumingcheng=request.getParameter("jiaoxueloumingcheng");String louceng=request.getParameter("louceng");String jiaoshi=request.getParameter("jiaoshi");String leixing=request.getParameter("leixing");String zhuangtai=request.getParameter("zhuangtai");String beizhu=request.getParameter("beizhu");String daxiao=request.getParameter("daxiao");
String id=request.getParameter("id");
String sql="update suoyoujiaoshi set jiaoxuelouhao='"+jiaoxuelouhao+"',jiaoxueloumingcheng='"+jiaoxueloumingcheng+"',louceng='"+louceng+"',jiaoshi='"+jiaoshi+"',leixing='"+leixing+"',zhuangtai='"+zhuangtai+"',beizhu='"+beizhu+"',daxiao='"+daxiao+"' where id= "+id;
connDbBean.executeUpdate(sql);
ou.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='suoyoujiaoshi_list.jsp';</script>");
%>
  </body>
</html>


