
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
    
    <title>安排考试信息</title>
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


function change_area2(f22_obj,s22_obj){
			var twocount22; 
			var twocount22=0; 
			var twomulu22 = new Array(); 
		
			<%
			String strsql22="select * from xueshengxinxi order by id asc"; 
			ResultSet rs22=connDbBean.executeQuery(strsql22);
			%> 
			<% 
				int count22 = 0; 
				while(rs22.next()){ 
							%> 
							twomulu22[<%=count22%>] = new Array("<%=rs22.getString("xuehao")%>","<%=rs22.getString("xingming")%>"); 
							<% 
							count22++; 
				} 
				rs22.close(); 
			%> 
		
	
	
			if (f22_obj.value!=0  )
			{
			
				for(i=0;i<twomulu22.length;i++)
				{	
				
					if (twomulu22[i][0]==f22_obj.value)
					{
						s22_obj.value=twomulu22[i][1];
					}
				}
			}
		}
		
		
		
		
		
		
		
		
		
		function change_area3(f_obj,s_obj,p_obj){
			var twocount33; 
			var twocount33=0; 
			var twomulu33 = new Array(); 
		
			<%
			String strsql33="select * from suoyoujiaoshi order by id asc"; 
			ResultSet rs33=connDbBean.executeQuery(strsql33);
			%> 
			<% 
				int count33 = 0; 
				while(rs33.next()){ 
							%> 
							twomulu33[<%=count33%>] = new Array("<%=rs33.getString("jiaoshi")%>","<%=rs33.getString("jiaoxuelouhao")%>","<%=rs33.getString("louceng")%>");
							<% 
							count33++; 
				} 
				rs33.close(); 
			%> 
		
		
			if (f_obj.value!=0  ){
				for(i=0;i<twomulu33.length;i++)
				{
				
				
				
					if (twomulu33[i][0]==f_obj.value){
					s_obj.value=twomulu33[i][1];
					p_obj.value=twomulu33[i][2];
					}
				}
			}
		}
		
		
		
</script>
  <body >
  安排考试信息
  <form name="form1" id="form1" method="post" action="kaoshixinxi_add_post.jsp">:
  <br>
  <br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr>
       <td width="20%">院系：</td>
       <td width="80%"> <select name="yuanximingcheng" id="yuanximingcheng" onChange="change_area(yuanximingcheng,zhuanyemingcheng)">
       <option value="请选择...">请选择...</option>
       <%
       String sql="select * from yuanxi order by id desc";
       ResultSet RS_result=connDbBean.executeQuery(sql);
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
     <tr>
       <td>学号：</td>
       <td><select name="xuehao" id="xuehao" onChange="change_area2(xuehao,xingming)">
         <option value="请选择...">请选择...</option>
         <%
       String sqlxh="select * from xueshengxinxi order by id desc";
       ResultSet RS_resultxh=connDbBean.executeQuery(sqlxh);
        while(RS_resultxh.next()){
        %>
         <option value="<%= RS_resultxh.getString("xuehao")%>"><%= RS_resultxh.getString("xuehao")%></option>
         <%
        }
        %>
       </select></td>
     </tr>
     <tr>
       <td>姓名：</td>
       <td><input name='xingming' type='text' id='xingming' style='border:solid 1px #000000; color:#666666'/></td>
     </tr>
     <tr>
       <td>教室：</td><td>
	   <select name='jiaoshi' id='jiaoshi' onchange='change_area3(jiaoshi,jiaoxuelouhao,louceng);'>
     <option value=''>请选择</option>
     <%
     	String sqljs="select jiaoshi from suoyoujiaoshi order by id desc";
     	ResultSet RS_resultjs=connDbBean.executeQuery(sqljs);while(RS_resultjs.next()){%>
     <option value="<%= RS_resultjs.getString("jiaoshi")%>" ><%=RS_resultjs.getString("jiaoshi")%></option><%}%>
     </select>&nbsp;*</td>
     </tr>
 
     <tr>
       <td>所在教学楼：</td>
     <td><input name='jiaoxuelouhao' type='text' id='jiaoxuelouhao' style='border:solid 1px #000000; color:#666666'/>&nbsp;*</td></tr>
     
     <tr><td>楼层：</td><td><input name='louceng' type='text' id='louceng' value='' style='border:solid 1px #000000; color:#666666' /></td></tr><tr>
       <td>科目：</td><td>
	   
<select name='kemu' id='kemu' >
     <option value=''>请选择</option>
     <%
     	String sqlkm="select kechengmingcheng from kechengxinxi order by id desc";
     	ResultSet RS_resultkm=connDbBean.executeQuery(sqlkm);while(RS_resultkm.next()){%>
     <option value="<%= RS_resultkm.getString("kechengmingcheng")%>" ><%=RS_resultkm.getString("kechengmingcheng")%></option><%}%>
     </select>&nbsp;*
   
   </td></tr><tr>
     <td>考试时间安排：</td><td><input name='shijian' type='text' id='shijian' value='' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" style='border:solid 1px #000000; color:#666666'/>
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>

