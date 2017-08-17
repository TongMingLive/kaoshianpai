<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>


<head >
     <base href="<%=basePath%>">
    <title>无标题页</title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	background-color: #2286C2;
}
-->
</style>
</head>
<body >

 
    <div>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    
    
  <tr>
  
  
    <td id=frmTitle noWrap name="fmTitle" align="center" valign="top" style="height: 619px; width: 200px;">
      <iframe name="I1" height="100%" width="100%" src="admin/mygo.jsp" border="0" frameborder="0" scrolling="no"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
    </td>
 


    <td width="2" style="height: 619px"></td>
    
    
    <td align="center" valign="top" style="height: 619px">
      <iframe name="hsgmain" height="100%" width="100%" frameborder="0" src="admin/sy.jsp"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
    </td>
    
  </tr>
  
</table>
    </div>
   
</body>


