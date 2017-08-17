
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
    
    <title>教师信息</title>
   <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>
    <script language="javascript" src="js/Calendar.js"></script>

  </head>
<%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>已有教师信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:编号：
     <input name="jiaoshibianhao" type="text" id="jiaoshibianhao" style='border:solid 1px #000000; color:#666666' size="15" />
   姓名：
   <input name="jiaoshixingming" type="text" id="jiaoshixingming" style='border:solid 1px #000000; color:#666666' size="15" /> 
   性别：<select name="xingbie" id="xingbie"><option value="">所有</option><option value="男">男</option><option value="女">女</option></select>  所属院系：<select name='suoshuyuanxi' id='suoshuyuanxi'><option value="">所有</option><% sql="select yuanximingcheng from yuanxi order by id desc";RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("yuanximingcheng")%>" ><%=RS_result.getString("yuanximingcheng")%></option><%}%></select>&nbsp;职称：<input name="zhicheng" type="text" id="zhicheng" style='border:solid 1px #000000; color:#666666' size="20" />
   身份证：
   <input name="shenfenzhenghao" type="text" id="shenfenzhenghao" style='border:solid 1px #000000; color:#666666' size="20" />
     <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>教师编号</td>
    <td bgcolor='#CCFFFF'>教师姓名</td>
    <td bgcolor='#CCFFFF' width='40' align='center'>性别</td>
    <td bgcolor='#CCFFFF'>所属院系</td>
    <td bgcolor='#CCFFFF'>职称</td>
    <td bgcolor='#CCFFFF'>身份证号</td>
    <td bgcolor='#CCFFFF'>密码</td>
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <%
  int curpage=1;//当前页
				int page_record=10;//每页显示的记录数
				int zgs=0;
				int zys=0;
				//用下面的方法（sql查询完成，速度快）
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from jiaoshixinxi";
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

  sql="select * from jiaoshixinxi where 1=1 ";


  
  
if(request.getParameter("jiaoshibianhao")=="" ||request.getParameter("jiaoshibianhao")==null ){}else{sql=sql+" and jiaoshibianhao like '%"+new String(request.getParameter("jiaoshibianhao").getBytes("8859_1"))+"%'";}
if(request.getParameter("jiaoshixingming")=="" ||request.getParameter("jiaoshixingming")==null ){}else{sql=sql+" and jiaoshixingming like '%"+new String(request.getParameter("jiaoshixingming").getBytes("8859_1"))+"%'";}
if(request.getParameter("xingbie")=="所有" ||request.getParameter("xingbie")==null ){}else{sql=sql+" and xingbie like '%"+new String(request.getParameter("xingbie").getBytes("8859_1"))+"%'";}
if(request.getParameter("suoshuyuanxi")=="所有" ||request.getParameter("suoshuyuanxi")==null ){}else{sql=sql+" and suoshuyuanxi like '%"+new String(request.getParameter("suoshuyuanxi").getBytes("8859_1"))+"%'";}
if(request.getParameter("zhicheng")=="" ||request.getParameter("zhicheng")==null ){}else{sql=sql+" and zhicheng like '%"+new String(request.getParameter("zhicheng").getBytes("8859_1"))+"%'";}
if(request.getParameter("shenfenzhenghao")=="" ||request.getParameter("shenfenzhenghao")==null ){}else{sql=sql+" and shenfenzhenghao like '%"+new String(request.getParameter("shenfenzhenghao").getBytes("8859_1"))+"%'";}
  sql=sql+" order by id desc ";
  
 
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String jiaoshibianhao="";String jiaoshixingming="";String xingbie="";String suoshuyuanxi="";String zhicheng="";String shenfenzhenghao="";String mima="";
 String addtime="";
 int i=0;
 
 
 
 
 
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
jiaoshibianhao=RS_result.getString("jiaoshibianhao");jiaoshixingming=RS_result.getString("jiaoshixingming");xingbie=RS_result.getString("xingbie");suoshuyuanxi=RS_result.getString("suoshuyuanxi");zhicheng=RS_result.getString("zhicheng");shenfenzhenghao=RS_result.getString("shenfenzhenghao");mima=RS_result.getString("mima");
 addtime=RS_result.getString("addtime");
 
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=jiaoshibianhao %></td><td><%=jiaoshixingming %></td><td align='center'><%=xingbie %></td><td><%=suoshuyuanxi %></td><td><%=zhicheng %></td><td><%=shenfenzhenghao %></td><td><%=mima %></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="60" align="center"><a href="jiaoshixinxi_updt.jsp?id=<%=id%>">修改</a>  <a href="del.jsp?id=<%=id %>&tablename=jiaoshixinxi" onClick="return confirm('真的要删除？')">删除</a></td>
  </tr>
  	<%
  }
   %>
</table><br>
以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a>
<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="jiaoshixinxi_list.jsp?page=1">首页</a>　<a href="jiaoshixinxi_list.jsp?page=<%= curpage-1%>">上一页</a>　<A href="jiaoshixinxi_list.jsp?page=<%= curpage+1%>">下一页</A>　<a href="jiaoshixinxi_list.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>
  </body>
</html>

