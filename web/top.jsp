<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>



<html xmlns="http://www.w3.org/1999/xhtml"><head id="Head1">
<title>顶部</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type=text/css>
body {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; BACKGROUND-COLOR: #2a8dc8
}
body {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
td {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
div {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
P {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
</style>

<meta content="MSHTML 6.00.2900.3492" name="GENERATOR"></head>
<body>
<form id="form1" name="form1">
<table cellspacing="0" cellpadding="0" width="100%" border="0">
  <tbody>
  <tr>
    <td width=10><img src="index/YHTop.files/new_001.jpg" border="0"></td>
    <td background="index/YHTop.files/new_002.jpg"><font size="4"><B>考试安排系统</B></font> </td>
    <td background="index/YHTop.files/new_002.jpg">
      <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
        <tr>
          <td align=right style="height: 35px"> 您好：尊敬的管理员&nbsp;<%=request.getSession().getAttribute("username")%> |&nbsp;身份：<%=request.getSession().getAttribute("cx")%>&nbsp;</td></tr>
        <tr>
          <td align=right height=35><a href="logout.jsp"  target="_top"><font color="red"><b>安全退出</b></font></a> 
      </td></tr></tbody></table></td>
    <td width=10><img src="index/YHTop.files/new_003.jpg" border=0></td></tr></tbody></table></form></body>
    </html>
