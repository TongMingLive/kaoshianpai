<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
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
 
 String uid=request.getParameter("username");
 String pwd=request.getParameter("pwd");
 String cx=new String(request.getParameter("cx").getBytes("8859_1"));
 String sql="";
 if(cx.equals("��ʦ"))
 {
 	sql="select * from jiaoshixinxi where jiaoshibianhao='"+uid+"' and mima='"+pwd+"'";
 }
 else if(cx.equals("ѧ��"))
 {
 	sql="select * from xueshengxinxi where  xuehao='"+uid+"' and mima='"+pwd+"'";
 	//out.print(sql);
 }
  else
 {
 	sql="select * from allusers where username='"+uid+"' and pwd='"+pwd+"'";
 	//out.print(sql);
 }
 ResultSet RS_result=connDbBean.executeQuery(sql);
 if(!RS_result.next())
{
	ou.print("<script>alert('��������û������ڻ��������,�����µ�¼!');window.history.go(-1);</script>");
	}
else{
	
  	  session.setAttribute("username",uid);
	if(cx.equals("��ʦ"))
 	{
  	  session.setAttribute("cx","��ʦ");
  	  }
	else if(cx.equals("ѧ��"))
 	{
  	  session.setAttribute("cx","ѧ��");
  	  }
	  else
	  {
	  	session.setAttribute("cx",RS_result.getString("cx"));
	  }
	 response.sendRedirect("main.jsp");	 
	} 
RS_result.close();

 %>
  </body>
</html>

