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
 

String yuanxihao=request.getParameter("yuanxihao");
String yuanximingcheng=request.getParameter("yuanximingcheng");
//ResultSet RS_result=connDbBean.executeQuery("select * from [fdsfds] where fdsfssd='"+fdsfd+"'");

// if(RS_result.next())
//{
//out.print("<script>alert('�ð༶�Ѿ�����,�뻻�������Ƶİ༶!');window.history.go(-1);</script>");
//	}
//else{
      PrintWriter ou = response.getWriter();
	
  	  	String sql="insert into yuanxi(yuanxihao,yuanximingcheng) values('"+yuanxihao+"','"+yuanximingcheng+"') ";
  	  	
  	  	connDbBean.executeUpdate(sql);
  	  	ou.print("<script>alert('��ӳɹ�!!');location.href='yuanxi_add.jsp';</script>");
  	  
//	}
//RS_result.close();

 %>
  </body>
</html>

