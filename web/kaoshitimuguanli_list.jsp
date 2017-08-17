
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="dao.Kaoshitimu" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Xuanze" %>
<%@ page import="bean.Tiankong" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理题目</title>
       <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>
    <script language="javascript" src="js/Calendar.js"></script>

  </head>
<%
    Kaoshitimu dao = new Kaoshitimu();
    List<Xuanze> xuanzes = dao.selectAllXuanzeByzy();
    List<Tiankong> tiankongs = dao.selectAllTiankong();
%>
  <body >

  <h3>管理题目</h3>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td width="60" align="center" bgcolor='#CCFFFF'>题目类型</td>
    <td width="150" align="center" bgcolor='#CCFFFF'>专业名称</td>
    <td bgcolor='#CCFFFF'>题目</td>
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <% for (Xuanze xuanze : xuanzes){%>
    <tr>
        <td align="center"><%=xuanze.getTimuId()%></td>
        <td align="center">选择题</td>
        <td align="center"><%=xuanze.getZhuanyemingcheng()%></td>
        <td align="center"><%=xuanze.getTimuTitle() %></td>
        <td width="60" align="center"><a href="/DeleteXuanzeByIdServlet?timuId=<%=xuanze.getTimuId()%>" onClick="return confirm('真的要删除？')">删除</a></td>
    </tr>
  <%}%>
  <% for (Tiankong tiankong : tiankongs){%>
  <tr>
    <td><%=tiankong.getTimuId()%></td>
    <td>填空题</td>
    <td><%=tiankong.getZhuanyemingcheng()%></td>
    <td align="center"><%=tiankong.getTimuTitle() %></td>
    <td width="60" align="center"><a href="/DeleteTiankongByIdServlet?timuId=<%=tiankong.getTimuId()%>" onClick="return confirm('真的要删除？')">删除</a></td>
  </tr>
  <%}%>


</table><br>

</body>
</html>

