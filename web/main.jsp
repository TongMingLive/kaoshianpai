<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>øº ‘∞≤≈≈œµÕ≥</title>
    
  </head>

  
<FRAMESET border=0 frameSpacing=0 rows="60, *" frameBorder=0>
<FRAME name=header src="top.jsp" frameBorder=0 noResize scrolling=no>
<FRAMESET cols="220, *">
<FRAME name=menu src="mygo.jsp" frameBorder=0 noResize>
<FRAME name=whlmain src="sy.jsp" frameBorder=0 noResize scrolling=yes>
</FRAMESET>
</FRAMESET>
<noframes><body>
</body>
</noframes></html>
