
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
    
    <title>Ժϵ</title>
       <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>
    <script language="javascript" src="js/Calendar.js"></script>

  </head>
<%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>����Ժϵ�б���</p>
  <form name="form1" id="form1" method="post" action="">
   ����:&nbsp;&nbsp;Ժϵ�ţ�<input name="yuanxihao" type="text" id="yuanxihao" style='border:solid 1px #000000; color:#666666' />&nbsp;&nbsp;Ժϵ���ƣ�<input name="yuanximingcheng" type="text" id="yuanximingcheng" style='border:solid 1px #000000; color:#666666' />
     <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>Ժϵ��</td><td bgcolor='#CCFFFF'>Ժϵ����</td>
    <td width="138" align="center" bgcolor="CCFFFF">����ʱ��</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
  </tr>
  <%
  int curpage=1;//��ǰҳ
				int page_record=10;//ÿҳ��ʾ�ļ�¼��
				int zgs=0;
				int zys=0;
				//������ķ�����sql��ѯ��ɣ��ٶȿ죩
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from yuanxi";
				ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
  while(RS_resultfy.next()){
  zgs=Integer.parseInt(RS_resultfy.getString("ss"));
  zys=zgs/page_record+1;
  }
				if (hsgnpage!=null)
				{
				curpage=Integer.parseInt(request.getParameter("page"));//��ȡ���ݵ�ֵ����Ҫ��ʾ��ҳ
				}
				else
				{
				curpage=1;
				}
				if (curpage==0)
				{
					curpage=1;
				}
				if(curpage>zys)
				{
					curpage=zys;
				}
 
  sql="select * from yuanxi where 1=1 ";
if(request.getParameter("yuanxihao")=="" ||request.getParameter("yuanxihao")==null ){}else{sql=sql+" and yuanxihao like '%"+new String(request.getParameter("yuanxihao").getBytes("8859_1"))+"%'";}
if(request.getParameter("yuanximingcheng")=="" ||request.getParameter("yuanximingcheng")==null ){}else{sql=sql+" and yuanximingcheng like '%"+new String(request.getParameter("yuanximingcheng").getBytes("8859_1"))+"%'";}
  sql=sql+" order by id desc";
  
  
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String yuanxihao="";String yuanximingcheng="";
 String addtime="";
 int i=0;
 
 
 
 
 
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
yuanxihao=RS_result.getString("yuanxihao");yuanximingcheng=RS_result.getString("yuanximingcheng");
 addtime=RS_result.getString("addtime");
 
 
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=yuanxihao %></td><td><%=yuanximingcheng %></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="60" align="center"><a href="yuanxi_updt.jsp?id=<%=id%>">�޸�</a>  <a href="del.jsp?id=<%=id %>&tablename=yuanxi" onClick="return confirm('���Ҫɾ����')">ɾ��</a></td>
  </tr>
  	<%
  }
   %>
</table><br>
�������ݹ�<%=i %>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a>
<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="yuanxi_list.jsp?page=1">��ҳ</a>��<a href="yuanxi_list.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="yuanxi_list.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="yuanxi_list.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
  </body>
</html>
