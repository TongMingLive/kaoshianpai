
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
  <p>������Ϣ��ѯ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:&nbsp;ѧ�ţ�
   <input name="xuehao" type="text" id="xuehao" style='border:solid 1px #000000; color:#666666' />
   &nbsp;&nbsp;������
   <input name="xingming" type="text" id="xingming" style='border:solid 1px #000000; color:#666666' />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>ѧ��</td>
    <td bgcolor='#CCFFFF'>����</td>
    <td bgcolor='#CCFFFF'>ѧԺ</td>
    <td bgcolor='#CCFFFF'>רҵ</td>
    <td bgcolor='#CCFFFF'>�ɼ�</td>
  </tr>
  <%

  
  
  
    int curpage=1;//��ǰҳ
				int page_record=10;//ÿҳ��ʾ�ļ�¼��
				int zgs=0;
				int zys=0;
				//������ķ�����sql��ѯ��ɣ��ٶȿ죩
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from xueshengxinxi";
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
  sql="select * from xueshengxinxi where 1=1 ";
  
  
  
if(request.getParameter("xuehao")=="" ||request.getParameter("xuehao")==null ){}else{sql=sql+" and xuehao like '%"+new String(request.getParameter("xuehao").getBytes("8859_1"))+"%'";}
if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+new String(request.getParameter("xingming").getBytes("8859_1"))+"%'";}

  sql=sql+" order by id desc";
  
 
  RS_result=connDbBean.executeQuery(sql);
 String id="";

String xuehao;
String xingming;
String xueyuan;
String zhuanye;
int score;
 int i=0;
 
 
 
 
 
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
xuehao=RS_result.getString("xuehao");
xingming=RS_result.getString("xingming");
xueyuan=RS_result.getString("yuanximingcheng");
zhuanye=RS_result.getString("zhuanyemingcheng");
score = RS_result.getInt("score");
 

 
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=xuehao %></td><td><%=xingming %></td><td><%=xueyuan %></td><td><%=zhuanye %></td>
    <%if (score == -1){%>
      <td>��δ����</td>
    <%}else {%>
      <td><%=score%></td>
    <%}%>
  </tr>
  	<%
  }
   %>
</table><br>
�������ݹ�<%=i%>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a>
<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="kaoshixinxi_list.jsp?page=1">��ҳ</a>��<a href="kaoshixinxi_list.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="kaoshixinxi_list.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="kaoshixinxi_list.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
  </body>
</html>

