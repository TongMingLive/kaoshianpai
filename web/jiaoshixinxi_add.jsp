
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
      <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>
    <script language="javascript" src="js/Calendar.js"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	    <script type="text/javascript">
	    function up(tt)
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
            pop.setContent("contentUrl","upload.jsp?Result="+tt);
            pop.setContent("title","�ļ��ϴ�");
            pop.build();
            pop.show();
	    }
	</script>
  </head>
<script language="javascript">
function check()
{
	if(document.form1.jiaoshibianhao.value==""){alert("�������ʦ���");
	document.form1.jiaoshibianhao.focus();return false;}
	if(document.form1.jiaoshixingming.value=="")
	{alert("�������ʦ����");document.form1.jiaoshixingming.focus();return false;}
	if(document.form1.shenfenzhenghao.value==""){alert("���������֤��");document.form1.shenfenzhenghao.focus();return false;}
	if(document.form1.mima.value==""){alert("����������");document.form1.mima.focus();return false;}
}
function gow()
{
	document.location.href="jiaoshixinxi_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
}
</script>
  <body >
  <%
  String sql;
  ResultSet RS_result;
 //islbdq String id=request.getParameter("id");
 //islbdq sql="select * from melieibaoduqubiaoiguo where id="+id;
 //islbdq gogogogogo
 //islbdq RS_result=connDbBean.executeQuery(sql);
 //islbdq while(RS_result.next()){
 //islbdq lelelelelele
 //islbdq }
   %>
  <form name="form1" id="form1" method="post" action="jiaoshixinxi_add_post.jsp">
  ��ӽ�ʦ��Ϣ:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr><td>��ʦ��ţ�</td>
     <td><input name='jiaoshibianhao' type='text' id='jiaoshibianhao' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr>
     <tr><td>��ʦ������</td><td><input name='jiaoshixingming' type='text' id='jiaoshixingming' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>�Ա�</td><td><select name='xingbie' id='xingbie'><option value="��">��</option><option value="Ů">Ů</option></select></td></tr><tr><td>����Ժϵ��</td><td><select name='suoshuyuanxi' id='suoshuyuanxi'><%sql="select yuanximingcheng from yuanxi order by id desc";RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("yuanximingcheng")%>" ><%=RS_result.getString("yuanximingcheng")%></option><%}%></select></td></tr><tr><td>ְ�ƣ�</td><td><input name='zhicheng' type='text' id='zhicheng' value='' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>���֤�ţ�</td><td><input name='shenfenzhenghao' type='text' id='shenfenzhenghao' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>���룺</td><td><input name='mima' type='text' id='mima' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return check();" style='border:solid 1px #000000; color:#666666'/>
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>

