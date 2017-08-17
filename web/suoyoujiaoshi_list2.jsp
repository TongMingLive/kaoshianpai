
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
    
    <title>所有教室</title>
       <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>
    <script language="javascript" src="js/Calendar.js"></script>

  </head>
<%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>已有所有教室列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:&nbsp;&nbsp;教学楼号：<input name="jiaoxuelouhao" type="text" id="jiaoxuelouhao" style='border:solid 1px #000000; color:#666666' />&nbsp;&nbsp;教学楼名称：<input name="jiaoxueloumingcheng" type="text" id="jiaoxueloumingcheng" style='border:solid 1px #000000; color:#666666' />&nbsp;&nbsp;教室：<input name="jiaoshi" type="text" id="jiaoshi" style='border:solid 1px #000000; color:#666666' />  类型：
   <select name='leixing' id='leixing'>
     <option value="">所有</option>
     <option value="普通">普通</option>
     <option value="多媒体">多媒体</option>
     <option value="阶梯">阶梯</option>
     <option value="语音">语音</option>
     <option value="计算机">计算机</option>
   </select>  
   状态：
   <select name='zhuangtai' id='zhuangtai'>
   <option value="">所有</option>
     <option value="空闲">空闲</option>
     <option value="已占">已占</option>
   </select>
    <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>教学楼号</td><td bgcolor='#CCFFFF'>教学楼名称</td><td bgcolor='#CCFFFF'>楼层</td><td bgcolor='#CCFFFF'>教室</td><td bgcolor='#CCFFFF'>类型</td><td bgcolor='#CCFFFF'>状态</td><td bgcolor='#CCFFFF'>备注</td><td bgcolor='#CCFFFF'>大小</td>
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
  </tr>
  <%
 
  
   int curpage=1;//当前页
				int page_record=10;//每页显示的记录数
				int zgs=0;
				int zys=0;
				//用下面的方法（sql查询完成，速度快）
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from suoyoujiaoshi";
				ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
  while(RS_resultfy.next()){
  zgs=Integer.parseInt(RS_resultfy.getString("ss"));
  zys=zgs/page_record+1;
  }
				if (hsgnpage!=null)
				{
				curpage=Integer.parseInt(request.getParameter("page"));//获取传递的值，需要显示的页
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
if(request.getParameter("leixing")=="所有" ||request.getParameter("leixing")==null ){}else{sql=sql+" and leixing like '%"+new String(request.getParameter("leixing").getBytes("8859_1"))+"%'";}
if(request.getParameter("zhuangtai")=="所有" ||request.getParameter("zhuangtai")==null ){}else{sql=sql+" and zhuangtai like '%"+new String(request.getParameter("zhuangtai").getBytes("8859_1"))+"%'";}

  
 
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
以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a>
<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="suoyoujiaoshi_list2.jsp?page=1">首页</a>　<a href="suoyoujiaoshi_list2.jsp?page=<%= curpage-1%>">上一页</a>　<A href="suoyoujiaoshi_list2.jsp?page=<%= curpage+1%>">下一页</A>　<a href="suoyoujiaoshi_list2.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>
  </body>
</html>

