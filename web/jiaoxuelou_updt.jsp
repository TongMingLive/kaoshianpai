
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
    
    <title>��ѧ¥</title>
    <script language="javascript" src="js/Calendar.js"></script>
      <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>

  </head>
<script language="javascript">
function check()
{
	if(document.form1.jiaoxuelouhao.value==""){alert("�������ѧ¥��");document.form1.jiaoxuelouhao.focus();return false;}if(document.form1.jiaoxueloumingcheng.value==""){alert("�������ѧ¥����");document.form1.jiaoxueloumingcheng.focus();return false;}
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>
  <form name="form1" id="form1" method="post" action="jiaoxuelou_updt_post.jsp?id=<%=id %>">
  �޸Ľ�ѧ¥:
  <br><br>
  <%
  String sql="select * from jiaoxuelou where id="+id;
  String jiaoxuelouhao="";String jiaoxueloumingcheng="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  jiaoxuelouhao=RS_result.getString("jiaoxuelouhao");jiaoxueloumingcheng=RS_result.getString("jiaoxueloumingcheng");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr><td>��ѧ¥�ţ�</td><td><input name='jiaoxuelouhao' type='text' id='jiaoxuelouhao' value='<%= jiaoxuelouhao%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>��ѧ¥���ƣ�</td><td><input name='jiaoxueloumingcheng' type='text' id='jiaoxueloumingcheng' value='<%= jiaoxueloumingcheng%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onclick="return check();" style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>


