
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>רҵ��Ϣ</title>
   <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>


  </head>

  <body >
  <p>����רҵ��Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="zhuanye_list.jsp">
   ����:Ժϵ:
  <input name="yuanximingcheng" type="text" id="yuanximingcheng" />
  רҵ
  :
   <input name="zhuanyemingcheng" type="text" id="zhuanyemingcheng" />
 
  <input type="submit" name="Submit" value="����" />  <a href="zhuanye_add.jsp">����</a>
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td bgcolor="A4B6D7">���</td>
    <td bgcolor='#A4B6D7'>Ժϵ</td>
    <td bgcolor='#A4B6D7'>רҵ</td>
    <td bgcolor="A4B6D7">���ʱ��</td>
    <td bgcolor="A4B6D7">����</td>
  </tr>

  
  
  
  <%
  
  SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
  int curpage=1;//��ǰҳ
				int page_record=20;//ÿҳ��ʾ�ļ�¼��
				int zgs=0;
				int zys=0;
				//������ķ�����sql��ѯ��ɣ��ٶȿ죩
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from zhuanye";
				ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
			  while(RS_resultfy.next())
			  {
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
				
  String sql="";
    sql="select * from zhuanye where 1=1";
  //sql="select * from [zhuanye] where 1=1";
  if(request.getParameter("yuanximingcheng")=="" ||request.getParameter("yuanximingcheng")==null )
  {}
  else
  {
  	sql=sql+" and yuanximingcheng like '%"+new String(request.getParameter("yuanximingcheng").getBytes("8859_1"))+"%'";
  }
   if(request.getParameter("zhuanyemingcheng")=="" ||request.getParameter("zhuanyemingcheng")==null )
  {}
  else
  {
  	sql=sql+" and zhuanyemingcheng like '%"+new String(request.getParameter("zhuanyemingcheng").getBytes("8859_1"))+"%'";
  }
  sql=sql+" order by id desc";
 ResultSet RS_result=connDbBean.executeQuery(sql);
 String id="";
 String yuanximingcheng="";
 String zhuanyemingcheng="";
 Date addtime=new Date();
 int i=0;
 
 
 
 
 
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
 yuanximingcheng=RS_result.getString("yuanximingcheng");
 zhuanyemingcheng=RS_result.getString("zhuanyemingcheng");
 addtime=RS_result.getDate("addtime");
 
 
%>
  <tr>
    <td><%=i %></td>
    <td><%=yuanximingcheng %></td>
    <td><%=zhuanyemingcheng %></td>
    <td><%=s.format(addtime) %></td>
    <td><a href="zhuanye_updt.jsp?id=<%=id%>">�޸�</a>  
    <a href="del.jsp?id=<%=id %>&tablename=zhuanye" onClick="return confirm('���Ҫɾ����')">ɾ��</a></td>
  </tr>
  	<%
  }
   %>
</table><br>
�������ݹ�<%=i %>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a>
<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="zhuanye_list.jsp?page=1">��ҳ</a>��<a href="zhuanye_list.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="zhuanye_list.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="zhuanye_list.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
  </body>
</html>

