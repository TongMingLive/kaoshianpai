
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
    
    <title>学生信息</title>
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
		
		function change_area(f_obj,s_obj){
			var twocount; 
			var twocount=0; 
			var twomulu = new Array(); 
		
			<%
			String strsql2="select * from zhuanye order by id asc"; 
			ResultSet rs=connDbBean.executeQuery(strsql2);
			%> 
			<% 
				int count = 0; 
				while(rs.next()){ 
							%> 
							twomulu[<%=count%>] = new Array("<%=rs.getString("yuanximingcheng")%>","<%=rs.getString("zhuanyemingcheng")%>"); 
							<% 
							count++; 
				} 
				rs.close(); 
			%> 
		
		
			//生成二级目录
			s_obj.length=0;
			s_obj.options[s_obj.length]=new Option("请选择...","0");
			if (f_obj.value!=0  ){
				for(i=0;i<twomulu.length;i++){
				
				
					if (twomulu[i][0]==f_obj.value){
					s_obj.options[s_obj.length]=new Option(twomulu[i][1],twomulu[i][1]);
					}
				}
			}
		}
	</script>
 

  </head>
<script language="javascript">
function check()
{
	if(document.form1.xuehao.value==""){alert("请输入学号");document.form1.gonghao.focus();return false;}
		if(document.form1.banji.value==""){alert("请输入班级");document.form1.banji.focus();return false;}
	if(document.form1.xingming.value==""){alert("请输入姓名");document.form1.xingming.focus();return false;}
	if(document.form1.chushengnianyue.value==""){alert("请输入出生年月");document.form1.chushengnianyue.focus();return false;}
	if(document.form1.dianhua.value==""){alert("请输入电话");document.form1.dianhua.focus();return false;}
	if(document.form1.shenfenzheng.value==""){alert("请输入身份证");document.form1.shenfenzheng.focus();return false;}
	if(document.form1.mima.value==""){alert("请输入密码");document.form1.mima.focus();return false;}
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>
  <form name="form1" id="form1" method="post" action="xueshengxinxi_updt_post.jsp?id=<%=id %>">
  修改学生信息:
  <br><br>
  <%
  String sql="select * from xueshengxinxi where id="+id;
  String xuehao="";
  String xingming="";
  String yuanximingcheng="";
   String zhuanyemingcheng="";
  String xingbie="";String chushengnianyue="";
  String dianhua="";String youxiang="";
  String jiguan="";String zhaopian="";
  String shenfenzheng="";String mima="";
  
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  xuehao=RS_result.getString("xuehao");
  xingming=RS_result.getString("xingming");
  xingbie=RS_result.getString("xingbie");
  yuanximingcheng=RS_result.getString("yuanximingcheng");
   zhuanyemingcheng=RS_result.getString("zhuanyemingcheng");
  chushengnianyue=RS_result.getString("chushengnianyue");
  dianhua=RS_result.getString("dianhua");youxiang=RS_result.getString("youxiang");
  jiguan=RS_result.getString("jiguan");zhaopian=RS_result.getString("zhaopian");
  shenfenzheng=RS_result.getString("shenfenzheng");mima=RS_result.getString("mima");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  

     <tr><td>学号：</td><td><input name='xuehao' type='text' id='xuehao' value='<%= xuehao%>' /></td></tr><tr><td>姓名：</td><td><input name='xingming' type='text' id='xingming' value='<%= xingming%>' /></td></tr>
 
 <tr>
       <td>院系：</td>
       <td> <select name="yuanximingcheng" id="yuanximingcheng" onChange="change_area(yuanximingcheng,zhuanyemingcheng)">
       <%
        sql="select * from yuanxi order by id desc";
        RS_result=connDbBean.executeQuery(sql);
        while(RS_result.next()){
        %>
       <option value="<%= RS_result.getString("yuanximingcheng")%>"><%= RS_result.getString("yuanximingcheng")%></option>
        <%
        }
        %>
       
       </select></td>
     </tr>
     <tr>
       <td>专业：</td>
       <td>
	   <select name="zhuanyemingcheng" id="zhuanyemingcheng">
    	<option value="请选择...">请选择...</option>
       </select></td>
     </tr>
 
     <tr><td>性别：</td><td><select name='xingbie' id='xingbie'><option value="男">男</option><option value="女">女</option></select></td></tr><script language="javascript">document.form1.xingbie.value='<%=xingbie%>';</script><tr><td>出生年月：</td><td><input name='chushengnianyue' type='text' id='chushengnianyue' value='<%= chushengnianyue%>' onClick="getDate(form1.chushengnianyue,'2')" need="1" readonly='readonly' /></td></tr><tr><td>电话：</td><td><input name='dianhua' type='text' id='dianhua' value='<%= dianhua%>' /></td></tr><tr><td>邮箱：</td><td><input name='youxiang' type='text' id='youxiang' value='<%= youxiang%>' /></td></tr><tr><td>籍贯：</td><td><input name='jiguan' type='text' id='jiguan' value='<%= jiguan%>' /></td></tr><tr><td>照片：</td><td><input name='zhaopian' type='text' id='zhaopian' size='50' value='<%= zhaopian%>' />&nbsp;<input type='button' value='上传' onClick="up('zhaopian')"/></td></tr><tr><td>身份证：</td><td><input name='shenfenzheng' type='text' id='shenfenzheng' size='50' value='<%=shenfenzheng%>' /></td></tr><tr><td>密码：</td><td><input name='mima' type='text' id='mima' value='<%= mima%>' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


