
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
    
    <title>���רҵ��Ϣ</title>
         <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>


  </head>
  
  
  

 
 
  <body >
  <form name="form1" id="form1" method="post" action="zhuanye_add_post.jsp">

      
  ���רҵ:
  <br>
  <br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    
     <tr>
       <td width="17%">Ժϵ:</td>
       <td width="83%"><label>
           <select name="yuanximingcheng" id="yuanximingcheng">
			   <% 
			   String sql;
			   sql="select yuanximingcheng from yuanxi order by id desc";
			
			   ResultSet RS_result=connDbBean.executeQuery(sql);
			   while(RS_result.next()){%>
			   
			   <option value="<%= RS_result.getString("yuanximingcheng")%>" >
			   <%=RS_result.getString("yuanximingcheng")%>
			   </option><%}%>
  		 </select>
           
           
       </label>
       </td>
     </tr>
     <tr>
       <td>רҵ��</td>
       <td><input name='zhuanyemingcheng' type='text' id='zhuanyemingcheng' value='' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return check();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>

