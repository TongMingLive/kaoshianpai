
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>

<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>���Գɼ�</title><script language="javascript" src="js/Calendar.js"></script>
      <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>

  </head>
  <body style="margin: 50px">
  <h3>���˿��Գɼ���</h3>
  <br>
  <%
  String sql="select * from xueshengxinxi where xuehao='"+request.getSession().getAttribute("username")+"'";
  int score=0;
    
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
    score = RS_result.getInt("score");
  }

  if (score == -1){%>
    <h2><a href="zaixiankaoshi.jsp">��δ���ԣ������������߿���</a></h2>
  <%}else if (score>=60){%>
    <h2>���ĳɼ�Ϊ��<%=score%>���Ժϸ�</h2>
  <%}else {%>
    <h2>���ĳɼ�Ϊ��<%=score%>���Բ��ϸ�</h2>
  <%}%>

  <script>history.forward()</script>
  </body>
</html>


