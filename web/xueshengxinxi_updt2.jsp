
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
    
    <title>学生信息</title><script language="javascript" src="js/Calendar.js"></script>
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
      <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>

  </head>
<script language="javascript">
function check()
{
	if(document.form1.xuehao.value==""){alert("请输入学号");document.form1.xuehao.focus();return false;}if(document.form1.xingming.value==""){alert("请输入姓名");document.form1.xingming.focus();return false;}if(document.form1.chushengnianyue.value==""){alert("请输入出生年月");document.form1.chushengnianyue.focus();return false;}if(document.form1.dianhua.value==""){alert("请输入电话");document.form1.dianhua.focus();return false;}if(document.form1.shenfenzheng.value==""){alert("请输入身份证");document.form1.shenfenzheng.focus();return false;}if(document.form1.mima.value==""){alert("请输入密码");document.form1.mima.focus();return false;}
}
</script>
  <body >

  <form name="form1" id="form1" method="post" action="xueshengxinxi_updt_post2.jsp">
  修改学生信息:
  <br>
  <br>
  <%
  String sql="select * from xueshengxinxi where xuehao='"+request.getSession().getAttribute("username")+"'";
  String xuehao="";
  String xingming="";
  String xingbie="";
  String chushengnianyue="";
  String dianhua="";
  String youxiang="";
  String jiguan="";
  String zhaopian="";
  String shenfenzheng="";
  String mima="";
    String yuanximingcheng="";
     String zhuanyemingcheng="";
    
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  xuehao=RS_result.getString("xuehao");
  xingming=RS_result.getString("xingming");
  xingbie=RS_result.getString("xingbie");
  chushengnianyue=RS_result.getString("chushengnianyue");
  dianhua=RS_result.getString("dianhua");
  youxiang=RS_result.getString("youxiang");
   yuanximingcheng=RS_result.getString("yuanximingcheng");
   zhuanyemingcheng=RS_result.getString("zhuanyemingcheng");
  jiguan=RS_result.getString("jiguan");
  zhaopian=RS_result.getString("zhaopian");
  shenfenzheng=RS_result.getString("shenfenzheng");
  mima=RS_result.getString("mima");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr>
       <td>学号：</td>
       <td><input name='xuehao' type='text' id='xuehao' value='<%= xuehao%>' readonly="readonly"/></td></tr>
	   <tr><td>姓名：</td><td><input name='xingming' type='text' id='xingming' value='<%= xingming%>' /></td></tr>
	   
       <tr>
       <td>院系：</td>
       <td><input name='yuanximingcheng' type='text' id='yuanximingcheng' value='<%= yuanximingcheng%>' readonly="readonly"/></td></tr>
	   <tr>
	     <td>专业：</td>
	     <td><input name='zhuanyemingcheng' type='text' id='zhuanyemingcheng' value='<%= zhuanyemingcheng%>' readonly="readonly" /></td></tr>
     
	   <tr><td>性别：</td><td>
	   <select name='xingbie' id='xingbie'>
	   <option value="男">男</option>
	   <option value="女">女</option>
	   </select></td></tr>
	   <script language="javascript">document.form1.xingbie.value='<%=xingbie%>';</script>
	   <tr><td>出生年月：</td><td><input name='chushengnianyue' type='text' id='chushengnianyue' value='<%= chushengnianyue%>' onClick="getDate(form1.chushengnianyue,'2')" need="1" readonly='readonly' /></td></tr><tr><td>电话：</td><td><input name='dianhua' type='text' id='dianhua' value='<%= dianhua%>' /></td></tr><tr><td>邮箱：</td><td><input name='youxiang' type='text' id='youxiang' value='<%= youxiang%>' /></td></tr><tr><td>籍贯：</td><td><input name='jiguan' type='text' id='jiguan' value='<%= jiguan%>' /></td></tr><tr><td>照片：</td><td><input name='zhaopian' type='text' id='zhaopian' size='50' value='<%= zhaopian%>' />&nbsp;<input type='button' value='上传' onClick="up('zhaopian')"/></td></tr><tr><td>身份证：</td><td><input name='shenfenzheng' type='text' id='shenfenzheng' size='50' value='<%=shenfenzheng%>' /></td></tr><tr><td>密码：</td><td><input name='mima' type='text' id='mima' value='<%= mima%>' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


