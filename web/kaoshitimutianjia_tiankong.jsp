
<%@ page language="java"  pageEncoding="utf-8"%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理题目</title>
       <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>
    <script language="javascript" src="js/Calendar.js"></script>

  </head>
  <%
      String strsql2="select * from zhuanye order by id asc";
      ResultSet rs=connDbBean.executeQuery(strsql2);
      List<String> list = new ArrayList<>();
      while(rs.next()){
          String s = rs.getString("zhuanyemingcheng");
          list.add(s);
      }
      rs.close();
  %>
  <body style="margin-left: 50px;margin-top: 20px">

  <h3>添加填空题</h3>
  <form action="AddTiankongServlet">
      <h4>请选择专业名称</h4>
      <select name="zhuanyemingcheng">
          <%for (String zhuanyemingcheng : list){%>
            <option value="<%=zhuanyemingcheng%>"><%=zhuanyemingcheng%></option>
          <%}%>
      </select>
      <h4>请输入考试题目</h4>
      <input name="timuTitle" type="text">
      <h4>请输入填空题答案</h4>
      <input name="daan" type="text">
      <br><br>
      <button type="submit">提交</button>
  </form>

</body>
</html>

