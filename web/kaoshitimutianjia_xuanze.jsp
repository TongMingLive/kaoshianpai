
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

  <h3>添加选择题</h3>
  <form action="AddXuanzeServlet">
      <h4>请选择专业名称</h4>
      <select name="zhuanyemingcheng">
          <%for (String zhuanyemingcheng : list){%>
            <option value="<%=zhuanyemingcheng%>"><%=zhuanyemingcheng%></option>
          <%}%>
      </select>
      <h4>请输入考试题目</h4>
      <input name="timuTitle" type="text">
      <h4>请输入选项A</h4>
      <input name="xuanze1" type="text">
      <h4>请输入选项B</h4>
      <input name="xuanze2" type="text">
      <h4>请输入选项C</h4>
      <input name="xuanze3" type="text">
      <h4>请输入选项D</h4>
      <input name="xuanze4" type="text">
      <h4>请选择题答案</h4>
      <select name="daan">
          <option value="1">A</option>
          <option value="2">B</option>
          <option value="3">C</option>
          <option value="4">D</option>
      </select>
      <br><br>
      <button type="submit">提交</button>
  </form>

</body>
</html>

