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
String xuehao=request.getParameter("xuehao");
String xingming=request.getParameter("xingming");
String  yuanximingcheng=request.getParameter("yuanximingcheng");
 String  zhuanyemingcheng=request.getParameter("zhuanyemingcheng");
String xingbie=request.getParameter("xingbie");
String chushengnianyue=request.getParameter("chushengnianyue");
String dianhua=request.getParameter("dianhua");
String youxiang=request.getParameter("youxiang");
String jiguan=request.getParameter("jiguan");
String zhaopian=request.getParameter("zhaopian");
String shenfenzheng=request.getParameter("shenfenzheng");
String mima=request.getParameter("mima");
String sql="update xueshengxinxi set xuehao='"
+xuehao+
"',xingming='"
+xingming+
"',xingbie='"
+xingbie+"',chushengnianyue='"+chushengnianyue+"',dianhua='"+dianhua+"',youxiang='"+youxiang+"',jiguan='"+jiguan+"',zhaopian='"+zhaopian+"',shenfenzheng='"+shenfenzheng+"',mima='"+mima+"' where xuehao= '"+request.getSession().getAttribute("username")+"'";
connDbBean.executeUpdate(sql);
    PrintWriter ou = response.getWriter();
ou.print("<script>alert('�޸ĳɹ�!!');location.href='xueshengxinxi_updt2.jsp';</script>");
%>
  </body>
</html>


