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
String xingbie=request.getParameter("xingbie");
String chushengnianyue=request.getParameter("chushengnianyue");
String dianhua=request.getParameter("dianhua");
String youxiang=request.getParameter("youxiang");
String jiguan=request.getParameter("jiguan");
String zhaopian=request.getParameter("zhaopian");
String shenfenzheng=request.getParameter("shenfenzheng");
String mima=request.getParameter("mima");
String yuanximingcheng=request.getParameter("yuanximingcheng");
String zhuanyemingcheng=request.getParameter("zhuanyemingcheng");
      PrintWriter ou = response.getWriter();
	
  	  	String sql="insert into xueshengxinxi(xuehao,xingming,xingbie,chushengnianyue,dianhua,youxiang,jiguan,zhaopian,shenfenzheng,yuanximingcheng,zhuanyemingcheng,mima) values('"
		+xuehao+"','"
		+xingming+"','"
		+xingbie+"','"
		+chushengnianyue+"','"+dianhua+"','"+youxiang+"','"+jiguan+"','"+zhaopian+"','"+shenfenzheng+"','"+yuanximingcheng+"','"+zhuanyemingcheng+"','"+mima+"') ";
  	  	
  	  	connDbBean.executeUpdate(sql);
  	  	ou.print("<script>alert('Ìí¼Ó³É¹¦!!');location.href='xueshengxinxi_add.jsp';</script>");


 %>
  </body>
</html>

