
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
    
    <title>专业信息</title>
   <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>


  </head>

  <body >
  <p>已有专业信息列表：</p>
  <form name="form1" id="form1" method="post" action="zhuanye_list.jsp">
   搜索:院系:
  <input name="yuanximingcheng" type="text" id="yuanximingcheng" />
  专业
  :
   <input name="zhuanyemingcheng" type="text" id="zhuanyemingcheng" />
 
  <input type="submit" name="Submit" value="查找" />  <a href="zhuanye_add.jsp">新增</a>
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td bgcolor="A4B6D7">序号</td>
    <td bgcolor='#A4B6D7'>院系</td>
    <td bgcolor='#A4B6D7'>专业</td>
    <td bgcolor="A4B6D7">添加时间</td>
    <td bgcolor="A4B6D7">操作</td>
  </tr>

  
  
  
  <%
  
  SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
  int curpage=1;//当前页
				int page_record=20;//每页显示的记录数
				int zgs=0;
				int zys=0;
				//用下面的方法（sql查询完成，速度快）
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
    <td><a href="zhuanye_updt.jsp?id=<%=id%>">修改</a>  
    <a href="del.jsp?id=<%=id %>&tablename=zhuanye" onClick="return confirm('真的要删除？')">删除</a></td>
  </tr>
  	<%
  }
   %>
</table><br>
以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a>
<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="zhuanye_list.jsp?page=1">首页</a>　<a href="zhuanye_list.jsp?page=<%= curpage-1%>">上一页</a>　<A href="zhuanye_list.jsp?page=<%= curpage+1%>">下一页</A>　<a href="zhuanye_list.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>
  </body>
</html>

