
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
    
    <title>���н���</title>
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
	if(document.form1.jiaoxuelouhao.value==""){alert("�������ѧ¥��");document.form1.jiaoxuelouhao.focus();return false;}if(document.form1.jiaoxueloumingcheng.value==""){alert("�������ѧ¥����");document.form1.jiaoxueloumingcheng.focus();return false;}
}
function gow()
{

	document.location.href="suoyoujiaoshi_add.jsp?jiaoxuelouhao="+document.form1.jiaoxuelouhao.value;
}
function ggg()
{
	document.form1.jiaoshi.value=document.form1.jiaoxuelouhao.value+document.form1.louceng.value;
}


function change_area(f_obj,s_obj){
			var twocount; 
			var twocount=0; 
			var twomulu = new Array(); 
		
			<%
			String strsql2="select * from jiaoxuelou order by id asc"; 
			ResultSet rs=connDbBean.executeQuery(strsql2);
			%> 
			<% 
				int count = 0; 
				while(rs.next()){ 
							%> 
							twomulu[<%=count%>] = new Array("<%=rs.getString("jiaoxuelouhao")%>","<%=rs.getString("jiaoxueloumingcheng")%>"); 
							<% 
							count++; 
				} 
				rs.close(); 
			%> 
		
		
			if (f_obj.value!=0  ){
				for(i=0;i<twomulu.length;i++){
				
				
					if (twomulu[i][0]==f_obj.value){
					s_obj.value=twomulu[i][1];
					}
				}
			}
		}
</script>
  <body >

  <form name="form1" id="form1" method="post" action="suoyoujiaoshi_add_post.jsp">
  ������н���:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr><td>��ѧ¥�ţ�</td><td><select name='jiaoxuelouhao' id='jiaoxuelouhao' onchange='change_area(jiaoxuelouhao,jiaoxueloumingcheng);'>
     <option value=''>��ѡ��</option>
     <%
     	String sql="select jiaoxuelouhao,jiaoxueloumingcheng from jiaoxuelou order by id desc";
     	ResultSet RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%>
     <option value="<%= RS_result.getString("jiaoxuelouhao")%>" ><%=RS_result.getString("jiaoxuelouhao")%></option><%}%>
     </select>&nbsp;*</td>
     </tr>
     <%if(request.getParameter("jiaoxuelouhao")!=null){%>
     <script language="javascript">document.form1.jiaoxuelouhao.value='<%=request.getParameter("jiaoxuelouhao")%>';</script><%}%>
     <tr><td>��ѧ¥���ƣ�</td>
     <td><input name='jiaoxueloumingcheng' type='text' id='jiaoxueloumingcheng' style='border:solid 1px #000000; color:#666666'/>&nbsp;*</td></tr>
     
     <tr><td>¥�㣺</td><td><select name='louceng' id='louceng' onChange="ggg();">
     <option value="01">01</option>
     <option value="02">02</option>
     <option value="03">03</option>
     <option value="04">04</option>
     <option value="05">05</option>
   </select></td></tr><tr><td>���ң�</td><td><input name='jiaoshi' type='text' id='jiaoshi' value='' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>���ͣ�</td><td><select name='leixing' id='leixing'>
     <option value="��ͨ">��ͨ</option>
     <option value="��ý��">��ý��</option>
     <option value="����">����</option>
     <option value="����">����</option>
     <option value="�����">�����</option>
   </select></td></tr><tr><td>״̬��</td><td><select name='zhuangtai' id='zhuangtai'>
     <option value="����">����</option>
     <option value="��ռ">��ռ</option>
   </select></td></tr><tr><td>��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'></textarea></td></tr><tr><td>��С��</td><td><input name='daxiao' type='text' id='daxiao' value='' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return check();" style='border:solid 1px #000000; color:#666666'/>
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>

