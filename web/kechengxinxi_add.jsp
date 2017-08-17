
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
    
    <title>课程信息</title>
<link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>
    <script language="javascript" src="js/Calendar.js"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	    <script type="text/javascript">
	    function up(tt)
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
            pop.setContent("contentUrl","upload.jsp?Result="+tt);
            pop.setContent("title","文件上传");
            pop.build();
            pop.show();
	    }
	</script>
  </head>
<script language="javascript">
function check()
{
	if(document.form1.kechengmingcheng.value==""){alert("请输入课程名称");document.form1.kechengmingcheng.focus();return false;}if(document.form1.xueshi.value==""){alert("请输入学时");document.form1.xueshi.focus();return false;}
}
function gow()
{
	document.location.href="kechengxinxi_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
}
</script>
  <body >
  <form name="form1" id="form1" method="post" action="kechengxinxi_add_post.jsp">
  添加课程信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    <tr><td>课程名称：</td><td><input name='kechengmingcheng' type='text' id='kechengmingcheng' value='' size='50' />&nbsp;*</td></tr><tr><td>学时：</td><td><input name='xueshi' type='text' id='xueshi' value='' />&nbsp;*</td></tr><tr><td>学分：</td><td><input name='xuefen' type='text' id='xuefen' value='' /></td></tr><tr><td>类型：</td><td><select name='leixing' id='leixing'>
     <option value="选修">选修</option>
     <option value="必修">必修</option>
   </select></td></tr><tr><td>备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu'></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>

