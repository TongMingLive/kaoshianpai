
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

  </head>
<%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>�������н����б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:&nbsp;&nbsp;��ѧ¥�ţ�<input name="jiaoxuelouhao" type="text" id="jiaoxuelouhao" style='border:solid 1px #000000; color:#666666' />&nbsp;&nbsp;��ѧ¥���ƣ�<input name="jiaoxueloumingcheng" type="text" id="jiaoxueloumingcheng" style='border:solid 1px #000000; color:#666666' />&nbsp;&nbsp;���ң�<input name="jiaoshi" type="text" id="jiaoshi" style='border:solid 1px #000000; color:#666666' />  ���ͣ�
   <select name='leixing' id='leixing'>
     <option value="">����</option>
     <option value="��ͨ">��ͨ</option>
     <option value="��ý��">��ý��</option>
     <option value="����">����</option>
     <option value="����">����</option>
     <option value="�����">�����</option>
   </select>  
   ״̬��
   <select name='zhuangtai' id='zhuangtai'>
   <option value="">����</option>
     <option value="����">����</option>
     <option value="��ռ">��ռ</option>
   </select>
    <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>��ѧ¥��</td><td bgcolor='#CCFFFF'>��ѧ¥����</td><td bgcolor='#CCFFFF'>¥��</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>״̬</td><td bgcolor='#CCFFFF'>��ע</td><td bgcolor='#CCFFFF'>��С</td>
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
  </tr>
  <%
 
  
   int curpage=1;//��ǰҳ
				int page_record=10;//ÿҳ��ʾ�ļ�¼��
				int zgs=0;
				int zys=0;
				//������ķ�����sql��ѯ��ɣ��ٶȿ죩
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from suoyoujiaoshi";
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
  sql="select * from suoyoujiaoshi where 1=1 ";
  
  
  
  
  
if(request.getParameter("jiaoxuelouhao")=="" ||request.getParameter("jiaoxuelouhao")==null ){}else{sql=sql+" and jiaoxuelouhao like '%"+new String(request.getParameter("jiaoxuelouhao").getBytes("8859_1"))+"%'";}
if(request.getParameter("jiaoxueloumingcheng")=="" ||request.getParameter("jiaoxueloumingcheng")==null ){}else{sql=sql+" and jiaoxueloumingcheng like '%"+new String(request.getParameter("jiaoxueloumingcheng").getBytes("8859_1"))+"%'";}
if(request.getParameter("jiaoshi")=="" ||request.getParameter("jiaoshi")==null ){}else{sql=sql+" and jiaoshi like '%"+new String(request.getParameter("jiaoshi").getBytes("8859_1"))+"%'";}
if(request.getParameter("leixing")=="����" ||request.getParameter("leixing")==null ){}else{sql=sql+" and leixing like '%"+new String(request.getParameter("leixing").getBytes("8859_1"))+"%'";}
if(request.getParameter("zhuangtai")=="����" ||request.getParameter("zhuangtai")==null ){}else{sql=sql+" and zhuangtai like '%"+new String(request.getParameter("zhuangtai").getBytes("8859_1"))+"%'";}

  
 
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String jiaoxuelouhao="";String jiaoxueloumingcheng="";String louceng="";String jiaoshi="";String leixing="";String zhuangtai="";String beizhu="";String daxiao="";
 String addtime="";
 int i=0;
 
 
 
 
 
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
jiaoxuelouhao=RS_result.getString("jiaoxuelouhao");jiaoxueloumingcheng=RS_result.getString("jiaoxueloumingcheng");louceng=RS_result.getString("louceng");jiaoshi=RS_result.getString("jiaoshi");leixing=RS_result.getString("leixing");zhuangtai=RS_result.getString("zhuangtai");beizhu=RS_result.getString("beizhu");daxiao=RS_result.getString("daxiao");
 addtime=RS_result.getString("addtime");
 
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=jiaoxuelouhao %></td><td><%=jiaoxueloumingcheng %></td><td><%=louceng %></td><td><%=jiaoshi %></td><td><%=leixing %></td><td><%=zhuangtai %></td><td><%=beizhu %></td><td><%=daxiao %></td>
    <td width="138" align="center"><%=addtime %></td>
  </tr>
  	<%
  }
   %>
</table>
<br>
�������ݹ�<%=i %>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a>
<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="suoyoujiaoshi_list2.jsp?page=1">��ҳ</a>��<a href="suoyoujiaoshi_list2.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="suoyoujiaoshi_list2.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="suoyoujiaoshi_list2.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
  </body>
</html>

