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
 

String kechengmingcheng=request.getParameter("kechengmingcheng");String xueshi=request.getParameter("xueshi");String xuefen=request.getParameter("xuefen");String leixing=request.getParameter("leixing");String beizhu=request.getParameter("beizhu");
//ResultSet RS_result=connDbBean.executeQuery("select * from [fdsfds] where fdsfssd='"+fdsfd+"'");

// if(RS_result.next())
//{
//out.print("<script>alert('该班级已经存在,请换其他名称的班级!');window.history.go(-1);</script>");
//	}
//else{
      PrintWriter ou = response.getWriter();
	
  	  	String sql="insert into kechengxinxi(kechengmingcheng,xueshi,xuefen,leixing,beizhu) values('"+kechengmingcheng+"','"+xueshi+"','"+xuefen+"','"+leixing+"','"+beizhu+"') ";
  	  	
  	  	connDbBean.executeUpdate(sql);
  	  	ou.print("<script>alert('添加成功!!');location.href='kechengxinxi_add.jsp';</script>");
  	  
//	}
//RS_result.close();

 %>
  </body>
</html>

