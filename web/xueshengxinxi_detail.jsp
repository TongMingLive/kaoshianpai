
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
    
    <title>ѧ����Ϣ��ϸ</title><script language="javascript" src="js/Calendar.js"></script>
	
    <LINK href="CSS.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">
function check()
{
	fewgidsoidfjdkgds
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>

  ѧ����Ϣ��ϸ:
  <br>
  <br>
  <%
  String sql="select * from xueshengxinxi where id="+id;
  String xuehao="";
  String yuanximingcheng="";
    String zhuanyemingcheng="";
  String xingming="";
  String xingbie="";String chushengnianyue="";
  String dianhua="";String youxiang="";
  String jiguan="";String zhaopian="";
  String shenfenzheng="";String mima="";
  
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  xuehao=RS_result.getString("xuehao");
    yuanximingcheng=RS_result.getString("yuanximingcheng");
	 zhuanyemingcheng=RS_result.getString("zhuanyemingcheng");
  xingming=RS_result.getString("xingming");
  xingbie=RS_result.getString("xingbie");
  chushengnianyue=RS_result.getString("chushengnianyue");
  dianhua=RS_result.getString("dianhua");
  youxiang=RS_result.getString("youxiang");
  jiguan=RS_result.getString("jiguan");
  zhaopian=RS_result.getString("zhaopian");
  shenfenzheng=RS_result.getString("shenfenzheng");
  mima=RS_result.getString("mima");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
       <td width='11%'>ѧ�ţ�</td>
         <td width='39%'><%=xuehao%></td><td width='11%'>������</td><td width='39%'><%=xingming%></td></tr>
       <tr>
         <td>Ժϵ��</td>
         <td><%=yuanximingcheng%></td>
         <td>רҵ��</td>
         <td><%=zhuanyemingcheng%></td>
       </tr>
       <tr><td width='11%'>�Ա�</td><td width='39%'><%=xingbie%></td><td width='11%'>�������£�</td><td width='39%'><%=chushengnianyue%></td></tr><tr><td width='11%'>�绰��</td><td width='39%'><%=dianhua%></td><td width='11%'>���䣺</td><td width='39%'><%=youxiang%></td></tr><tr><td width='11%'>���᣺</td><td width='39%'><%=jiguan%></td><td width='11%'>��Ƭ��</td><td width='39%'><%=zhaopian%></td></tr>
		 <tr><td width='11%'>���֤:</td><td width='39%'><%=shenfenzheng%></td><td width='11%'>���룺</td><td width='39%'><%=mima%></td>
         <tr>
      <td colspan="4" align="center"><input type="button" name="Submit" value="����" onClick="javascript:history.back()" /></td>
    </tr>
  </table>

  </body>
</html>


