
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
    
    <title>���н���</title><script language="javascript" src="js/Calendar.js"></script>
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
  <form name="form1" id="form1" method="post" action="suoyoujiaoshi_updt_post.jsp?id=<%=id %>">
  �޸����н���:
  <br><br>
  <%
  String sql="select * from suoyoujiaoshi where id="+id;
  String jiaoxuelouhao="";String jiaoxueloumingcheng="";String louceng="";String jiaoshi="";String leixing="";String zhuangtai="";String beizhu="";String daxiao="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  jiaoxuelouhao=RS_result.getString("jiaoxuelouhao");jiaoxueloumingcheng=RS_result.getString("jiaoxueloumingcheng");louceng=RS_result.getString("louceng");jiaoshi=RS_result.getString("jiaoshi");leixing=RS_result.getString("leixing");zhuangtai=RS_result.getString("zhuangtai");beizhu=RS_result.getString("beizhu");daxiao=RS_result.getString("daxiao");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr><td>��ѧ¥�ţ�</td><td><input name='jiaoxuelouhao' type='text' id='jiaoxuelouhao' value='<%= jiaoxuelouhao%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>��ѧ¥���ƣ�</td><td><input name='jiaoxueloumingcheng' type='text' id='jiaoxueloumingcheng' value='<%= jiaoxueloumingcheng%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>¥�㣺</td><td><select name='louceng' id='louceng'>
       <option value="01">01</option>
       <option value="02">02</option>
       <option value="03">03</option>
       <option value="04">04</option>
       <option value="05">05</option>
     </select></td></tr><script language="javascript">document.form1.louceng.value='<%=louceng%>';</script><tr><td>���ң�</td><td><input name='jiaoshi' type='text' id='jiaoshi' value='<%= jiaoshi%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>���ͣ�</td><td><select name='leixing' id='leixing'>
       <option value="��ͨ">��ͨ</option>
       <option value="��ý��">��ý��</option>
       <option value="����">����</option>
       <option value="����">����</option>
       <option value="�����">�����</option>
     </select></td></tr><script language="javascript">document.form1.leixing.value='<%=leixing%>';</script><tr><td>״̬��</td><td><select name='zhuangtai' id='zhuangtai'>
       <option value="����">����</option>
       <option value="��ռ">��ռ</option>
     </select></td></tr><script language="javascript">document.form1.zhuangtai.value='<%=zhuangtai%>';</script><tr><td>��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'><%=beizhu%></textarea></td></tr><tr><td>��С��</td><td><input name='daxiao' type='text' id='daxiao' value='<%= daxiao%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return check();" style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>


