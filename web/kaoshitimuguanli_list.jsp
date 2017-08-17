
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
    
    <title>������Ŀ</title>
       <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>
    <script language="javascript" src="js/Calendar.js"></script>

  </head>
<%
    Kaoshitimu dao = new Kaoshitimu();
    List<Xuanze> xuanzes = dao.selectAllXuanzeByzy();
    List<Tiankong> tiankongs = dao.selectAllTiankong();
%>
  <body >

  <h3>������Ŀ</h3>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td width="60" align="center" bgcolor='#CCFFFF'>��Ŀ����</td>
    <td width="150" align="center" bgcolor='#CCFFFF'>רҵ����</td>
    <td bgcolor='#CCFFFF'>��Ŀ</td>
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
  </tr>
  <% for (Xuanze xuanze : xuanzes){%>
    <tr>
        <td align="center"><%=xuanze.getTimuId()%></td>
        <td align="center">ѡ����</td>
        <td align="center"><%=xuanze.getZhuanyemingcheng()%></td>
        <td align="center"><%=xuanze.getTimuTitle() %></td>
        <td width="60" align="center"><a href="/DeleteXuanzeByIdServlet?timuId=<%=xuanze.getTimuId()%>" onClick="return confirm('���Ҫɾ����')">ɾ��</a></td>
    </tr>
  <%}%>
  <% for (Tiankong tiankong : tiankongs){%>
  <tr>
    <td><%=tiankong.getTimuId()%></td>
    <td>�����</td>
    <td><%=tiankong.getZhuanyemingcheng()%></td>
    <td align="center"><%=tiankong.getTimuTitle() %></td>
    <td width="60" align="center"><a href="/DeleteTiankongByIdServlet?timuId=<%=tiankong.getTimuId()%>" onClick="return confirm('���Ҫɾ����')">ɾ��</a></td>
  </tr>
  <%}%>


</table><br>

</body>
</html>

