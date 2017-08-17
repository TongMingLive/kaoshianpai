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
 

String xuehao=request.getParameter("xuehao");
String xingming=request.getParameter("xingming");
String xueyuan=request.getParameter("yuanximingcheng");
String zhuanye=request.getParameter("zhuanyemingcheng");
String jiaoxuelou=request.getParameter("jiaoxuelouhao");  
String jiaoshi=request.getParameter("jiaoshi");
String louceng=request.getParameter("louceng");
String kemu=request.getParameter("kemu");
String shijian=request.getParameter("shijian");

      PrintWriter ou = response.getWriter();

  	  	String sql="insert into kaoshixinxi(xuehao,xingming,xueyuan,zhuanye,jiaoxuelou,jiaoshi,louceng,kemu,shijian) values('"
		+xuehao+"','"+xingming+"','"+xueyuan+"','"+zhuanye+"','"+jiaoxuelou+"','"+jiaoshi+"','"+louceng+"','"+kemu+"','"+shijian+"')";
  	 	// 	out.print(sql);
  	  connDbBean.executeUpdate(sql);
  	 	ou.print("<script>alert('Ìí¼Ó³É¹¦!!');location.href='kaoshixinxi_add.jsp';</script>");
  	  


 %>
  </body>
</html>

