
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
    
    <title>��ʦ��Ϣ</title>
    <script language="javascript" src="js/Calendar.js"></script>
   <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>

  </head>
<script language="javascript">
function check()
{
	if(document.form1.jiaoshibianhao.value==""){alert("�������ʦ���");document.form1.jiaoshibianhao.focus();return false;}if(document.form1.jiaoshixingming.value==""){alert("�������ʦ����");document.form1.jiaoshixingming.focus();return false;}if(document.form1.shenfenzhenghao.value==""){alert("���������֤��");document.form1.shenfenzhenghao.focus();return false;}if(document.form1.mima.value==""){alert("����������");document.form1.mima.focus();return false;}
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>
  <form name="form1" id="form1" method="post" action="jiaoshixinxi_updt_post.jsp?id=<%=id %>">
  �޸Ľ�ʦ��Ϣ:
  <br><br>
  <%
  String sql="select * from jiaoshixinxi where id="+id;
  String jiaoshibianhao="";String jiaoshixingming="";String xingbie="";String suoshuyuanxi="";String zhicheng="";String shenfenzhenghao="";String mima="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  jiaoshibianhao=RS_result.getString("jiaoshibianhao");jiaoshixingming=RS_result.getString("jiaoshixingming");xingbie=RS_result.getString("xingbie");suoshuyuanxi=RS_result.getString("suoshuyuanxi");zhicheng=RS_result.getString("zhicheng");shenfenzhenghao=RS_result.getString("shenfenzhenghao");mima=RS_result.getString("mima");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr><td>��ʦ��ţ�</td><td><input name='jiaoshibianhao' type='text' id='jiaoshibianhao' value='<%= jiaoshibianhao%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>��ʦ������</td><td><input name='jiaoshixingming' type='text' id='jiaoshixingming' value='<%= jiaoshixingming%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>�Ա�</td><td><select name='xingbie' id='xingbie'><option value="��">��</option><option value="Ů">Ů</option></select></td></tr><script language="javascript">document.form1.xingbie.value='<%=xingbie%>';</script><tr><td>����Ժϵ��</td><td><select name='suoshuyuanxi' id='suoshuyuanxi'><%sql="select yuanximingcheng from yuanxi order by id desc";RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("yuanximingcheng")%>" ><%=RS_result.getString("yuanximingcheng")%></option><%}%></select></td></tr><script language="javascript">document.form1.suoshuyuanxi.value='<%=suoshuyuanxi%>';</script><tr><td>ְ�ƣ�</td><td><input name='zhicheng' type='text' id='zhicheng' value='<%= zhicheng%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>���֤�ţ�</td><td><input name='shenfenzhenghao' type='text' id='shenfenzhenghao' value='<%= shenfenzhenghao%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>���룺</td><td><input name='mima' type='text' id='mima' value='<%= mima%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onclick="return check();" style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>


