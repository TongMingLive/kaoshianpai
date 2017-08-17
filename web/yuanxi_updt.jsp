
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
    
    <title>院系</title>
    <script language="javascript" src="js/Calendar.js"></script>
    <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>

  </head>
<script language="javascript">
function check()
{
	if(document.form1.yuanxihao.value==""){alert("请输入院系号");document.form1.yuanxihao.focus();return false;}if(document.form1.yuanximingcheng.value==""){alert("请输入院系名称");document.form1.yuanximingcheng.focus();return false;}
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>
  <form name="form1" id="form1" method="post" action="yuanxi_updt_post.jsp?id=<%=id %>">
  修改院系:
  <br><br>
  <%
  String sql="select * from yuanxi where id="+id;
  String yuanxihao="";String yuanximingcheng="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  yuanxihao=RS_result.getString("yuanxihao");
  yuanximingcheng=RS_result.getString("yuanximingcheng");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr><td>院系号：</td><td><input name='yuanxihao' type='text' id='yuanxihao' value='<%= yuanxihao%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>院系名称：</td><td><input name='yuanximingcheng' type='text' id='yuanximingcheng' value='<%= yuanximingcheng%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>


