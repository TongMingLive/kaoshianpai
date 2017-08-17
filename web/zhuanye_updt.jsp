
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
    
    <title>专业</title>
         <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>


  </head>

  <body >
  <%
  String id=request.getParameter("id");
   %>
  <form name="form1" id="form1" method="post" action="zhuanye_updt_post.jsp?id=<%=id %>">
  修改专业:
  <br><br>
  <%
  String sql="select * from  zhuanye  where id="+id;
  String yuanximingcheng="";
  String zhuanyemingcheng="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
	  yuanximingcheng=RS_result.getString("yuanximingcheng");
	  zhuanyemingcheng=RS_result.getString("zhuanyemingcheng");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr>
       <td>院系：</td>
       <td><label>
         <select name="yuanximingcheng" id="yuanximingcheng">
			   <% 
			
			   sql="select yuanximingcheng from yuanxi order by id desc";
			
			    RS_result=connDbBean.executeQuery(sql);
			   while(RS_result.next()){%>
			   
			   <option value="<%= RS_result.getString("yuanximingcheng")%>" >
			   <%=RS_result.getString("yuanximingcheng")%>
			   </option><%}%>
  		 </select><script language="javascript">document.form1.yuanximingcheng.value='<%=yuanximingcheng%>';</script>
         </label>
       </td>
     </tr>
     <tr>
       <td width="17%">专业：</td><td width="83%"><input name='zhuanyemingcheng' type='text' id='zhuanyemingcheng' value='<%= zhuanyemingcheng%>' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


