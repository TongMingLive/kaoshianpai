
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
    
    <title>������Ϣ��ѯ</title>
       <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>
    <script language="javascript" src="js/Calendar.js"></script>

  </head>
<%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>�ҵĿ�����Ϣ��ѯ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:&nbsp;��Ŀ��
   <input name="kemu" type="text" id="kemu" style='border:solid 1px #000000; color:#666666' />
   &nbsp;&nbsp;���ң�
   <input name="jiaoshi" type="text" id="jiaoshi" style='border:solid 1px #000000; color:#666666' /> 
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>ѧ��</td>
    <td bgcolor='#CCFFFF'>����</td>
    <td bgcolor='#CCFFFF'>ѧԺ</td>
    <td bgcolor='#CCFFFF'>רҵ</td>
    <td bgcolor='#CCFFFF'>��ѧ¥</td>
    <td bgcolor='#CCFFFF'>����</td>
    <td bgcolor='#CCFFFF'>¥��</td>
    <td bgcolor='#CCFFFF'>��Ŀ</td>
    <td width="138" align="center" bgcolor="CCFFFF">����ʱ��</td>
  </tr>
  <%

  
  
  
    int curpage=1;//��ǰҳ
				int page_record=10;//ÿҳ��ʾ�ļ�¼��
				int zgs=0;
				int zys=0;
				//������ķ�����sql��ѯ��ɣ��ٶȿ죩
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from kaoshixinxi  where xuehao='"+request.getSession().getAttribute("username")+"'";
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
   sql="";
  sql="select * from kaoshixinxi where xuehao='"+request.getSession().getAttribute("username")+"' ";
  
  
  
  
  
if(request.getParameter("kemu")=="" ||request.getParameter("kemu")==null ){}else{sql=sql+" and kemu like '%"+new String(request.getParameter("kemu").getBytes("8859_1"))+"%'";}

if(request.getParameter("jiaoshi")=="" ||request.getParameter("jiaoshi")==null ){}else{sql=sql+" and jiaoshi like '%"+new String(request.getParameter("jiaoshi").getBytes("8859_1"))+"%'";}

  sql=sql+" order by id desc";
  
 
  RS_result=connDbBean.executeQuery(sql);
 String id="";

String xuehao;
String xingming;
String xueyuan;
String zhuanye;
String jiaoxuelou;
String jiaoshi;
String louceng;
String kemu;
String shijian;
 int i=0;
 
 
 
 
 
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
xuehao=RS_result.getString("xuehao");
xingming=RS_result.getString("xingming");
xueyuan=RS_result.getString("xueyuan");
zhuanye=RS_result.getString("zhuanye");
jiaoxuelou=RS_result.getString("jiaoxuelou");
jiaoshi=RS_result.getString("jiaoshi");
louceng=RS_result.getString("louceng");
kemu=RS_result.getString("kemu");
 shijian=RS_result.getString("shijian");
 

 
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=xuehao %></td><td><%=xingming %></td><td><%=xueyuan %></td><td><%=zhuanye %></td><td><%=jiaoxuelou %></td><td><%=jiaoshi %></td><td><%=louceng %></td><td><%=kemu %></td>
    <td width="138" align="center"><%=shijian %></td>
  </tr>
  	<%
  }
   %>
</table>
<br>
�������ݹ�<%=i %>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a>
<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="kaoshixinxi_list2.jsp?page=1">��ҳ</a>��<a href="kaoshixinxi_list2.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="kaoshixinxi_list2.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="kaoshixinxi_list2.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
  </body>
</html>

