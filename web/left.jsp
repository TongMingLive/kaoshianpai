<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312" session="true" %>
	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head id="Head1"><title>导航</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
body {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; BACKGROUND-COLOR: #2a8dc8
}
body {
	FONT-SIZE: 11px; COLOR: #003366; FONT-FAMILY: Verdana
}
td {
	FONT-SIZE: 11px; COLOR: #003366; FONT-FAMILY: Verdana
}
div {
	FONT-SIZE: 11px; COLOR: #003366; FONT-FAMILY: Verdana
}
p {
	FONT-SIZE: 11px; COLOR: #003366; FONT-FAMILY: Verdana
}
.mainMenu {
	FONT-WEIGHT: bold; FONT-SIZE: 14px; CURSOR: hand; COLOR: #000000
}
A.style2:link {
	PADDING-LEFT: 4px; COLOR: #0055bb; TEXT-DECORATION: none
}
A.style2:visited {
	PADDING-LEFT: 4px; COLOR: #0055bb; TEXT-DECORATION: none
}
A.style2:hover {
	PADDING-LEFT: 4px; COLOR: #ff0000; TEXT-DECORATION: none
}
A.active {
	PADDING-LEFT: 4px; COLOR: #ff0000; TEXT-DECORATION: none
}
.span {
	COLOR: #ff0000
}
</style>

<!--增加菜单，需要增加数字i  -->
<script language="javascript">
		function MenuDisplay(obj)
		{
		    
			if(document.getElementById(obj).style.display=='none')
			{
				document.getElementById(obj).style.display='block';
				document.getElementById(obj+'Span').innerText='－';
			}
			else
			{
				document.getElementById(obj).style.display='none';
				document.getElementById(obj+'Span').innerText='＋';
			}
		}
    </script>

<meta content="MSHTML 6.00.2900.3492" name="GENERATOR"/>
</head>

<body>
<form id="form1" name="form1">
<table cellspacing="0" cellpadding="0" width="210" align="center" border="0">
  <tbody>
  <tr>
    <td width="15"><img src="index/YHMenu.files/new_005.jpg" border=0></td>
    <td align="middle" width="180" background="index/YHMenu.files/new_006.jpg"
      height="35"><b>考试安排系统 －功能菜单</b> </td>
    <td width=15><img src="index/YHMenu.files/new_007.jpg" border=0>
    </td></tr></tbody>
   </table>
   
<table cellspacing="0" cellpadding="0" width="210" align="center" border="0">
  <tbody>
  <tr>
    <td width=15 background="index/YHMenu.files/new_008.jpg"></td>
    <td valign="top" width="180" bgcolor="#ffffff">
      <table cellspacing="0" cellpadding="3" width="165" align="center" border="0">
        <tbody>

        <tr>
          <td class="mainMenu" onClick="MenuDisplay('table_1');"> <span class="span" id="table_1Span">＋</span> 系统用户管理</td>
        </tr>
        <tr>
          <td>
            <table id="table_1" style="DISPLAY: none" cellspacing="0" cellpadding="2"   width="155" align="center" border="0">
              <tbody>
        		 <tr>
                <td class="menuSmall"><a class="style2"  href="yhzhgl.jsp"  target="whlmain">－ 系统用户管理</a></td></tr>
               <tr>
                <td class="menuSmall"><a class="style2"  href="mod.jsp"  target="whlmain">－ 修改密码</a></td></tr>
              </tbody>
             </table>
          </td>
        </tr>
                  
                  
                  
      
          
          
     
                  
                 
        <tr>
          <td background="index/YHMenu.files/new_027.jpg" height="1"></td></tr>
        <tr>
          <td class="mainMenu" onClick="MenuDisplay('table_2');"><span  class="span" id="table_2Span">＋</span> 院系管理</td></tr>
        <tr>
          <td>
            <table id="table_2" style="DISPLAY: none" cellspacing="0" cellpadding="2"  width="155" align="center" border="0">
              <tbody>
              <tr>
                <td class="menuSmall"><a class="style2"  href="yuanxi_add.jsp" target="whlmain">－ 院系添加</a></td></tr>
              <tr>
                <td class="menuSmall"><a class="style2"  href="yuanxi_list.jsp" target="whlmain">－ 院系查询</a></td></tr>

             </tbody>
          </table>
         </td>
        </tr> 
        
        
        <tr>
          <td background="index/YHMenu.files/new_027.jpg" height="1"></td></tr>
        <tr>
          <td class="mainMenu" onClick="MenuDisplay('table_3');"><span  class="span" id="table_3Span">＋</span> 专业管理</td></tr>
        <tr>
          <td>
            <table id="table_3" style="DISPLAY: none" cellspacing="0" cellpadding="2"  width="155" align="center" border="0">
              <tbody>
              <tr>
                <td class="menuSmall"><a class="style2"  href="zhuanye_add.jsp" target="whlmain">－ 专业添加</a></td></tr>
              <tr>
                <td class="menuSmall"><a class="style2"  href="zhuanye_list.jsp" target="whlmain">－ 专业查询</a></td></tr>

             </tbody>
          </table>
         </td>
        </tr> 
           
    
                  
                  
                        <tr>
          <td background="index/YHMenu.files/new_027.jpg" height="1"></td></tr>
        <tr>
          <td class="mainMenu" onClick="MenuDisplay('table_4');"><span  class="span" id="table_4Span">＋</span> 学生信息管理</td></tr>
        <tr>
          <td>
            <table id="table_4" style="DISPLAY: none" cellspacing="0" cellpadding="2"  width="155" align="center" border="0">
              <tbody>
              <tr>
                <td class="menuSmall"><a class="style2"  href="xueshengxinxi_add.jsp" target="whlmain">－ 学生信息添加</a></td></tr>
              <tr>
                <td class="menuSmall"><a class="style2"  href="xueshengxinxi_list.jsp" target="whlmain">－ 学生信息查询</a></td></tr>

             </tbody>
          </table>
         </td>
        </tr> 
                        
           
           
             
                        <tr>
          <td background="index/YHMenu.files/new_027.jpg" height="1"></td></tr>
        <tr>
          <td class="mainMenu" onClick="MenuDisplay('table_5');"><span  class="span" id="table_5Span">＋</span> 教师信息管理</td></tr>
        <tr>
          <td>
            <table id="table_5" style="DISPLAY: none" cellspacing="0" cellpadding="2"  width="155" align="center" border="0">
              <tbody>
              <tr>
                <td class="menuSmall"><a class="style2"  href="jiaoshixinxi_add.jsp" target="whlmain">－ 教师信息添加</a></td></tr>
              <tr>
                <td class="menuSmall"><a class="style2"  href="jiaoshixinxi_list.jsp" target="whlmain">－ 教师信息查询</a></td></tr>

             </tbody>
          </table>
         </td>
        </tr> 
                      
                      
                    
                        <tr>
          <td background="index/YHMenu.files/new_027.jpg" height="1"></td></tr>
        <tr>
          <td class="mainMenu" onClick="MenuDisplay('table_6');"><span  class="span" id="table_6Span">＋</span> 课程信息管理</td></tr>
        <tr>
          <td>
            <table id="table_6" style="DISPLAY: none" cellspacing="0" cellpadding="2"  width="155" align="center" border="0">
              <tbody>
              <tr>
                <td class="menuSmall"><a class="style2"  href="kechengxinxi_add.jsp" target="whlmain">－ 课程信息添加</a></td></tr>
              <tr>
                <td class="menuSmall"><a class="style2"  href="kechengxinxi_list.jsp" target="whlmain">－ 课程信息查询</a></td></tr>

             </tbody>
          </table>
         </td>
        </tr>             
                            
 
 
  
                        <tr>
          <td background="index/YHMenu.files/new_027.jpg" height="1"></td></tr>
        <tr>
          <td class="mainMenu" onClick="MenuDisplay('table_7');"><span  class="span" id="table_7Span">＋</span> 教学楼管理</td></tr>
        <tr>
          <td>
            <table id="table_7" style="DISPLAY: none" cellspacing="0" cellpadding="2"  width="155" align="center" border="0">
              <tbody>
              <tr>
                <td class="menuSmall"><a class="style2"  href="jiaoxuelou_add.jsp" target="whlmain">－ 教学楼添加</a></td></tr>
              <tr>
                <td class="menuSmall"><a class="style2"  href="jiaoxuelou_list.jsp" target="whlmain">－ 教学楼查询</a></td></tr>

             </tbody>
          </table>
         </td>
        </tr>            
        
        
        
        
        
        
                       <tr>
          <td background="index/YHMenu.files/new_027.jpg" height="1"></td></tr>
        <tr>
          <td class="mainMenu" onClick="MenuDisplay('table_8');"><span  class="span" id="table_8Span">＋</span> 教室信息管理</td></tr>
        <tr>
          <td>
            <table id="table_8" style="DISPLAY: none" cellspacing="0" cellpadding="2"  width="155" align="center" border="0">
              <tbody>
              <tr>
                <td class="menuSmall"><a class="style2"  href="suoyoujiaoshi_add.jsp" target="whlmain">－ 教室信息添加</a></td></tr>
              <tr>
                <td class="menuSmall"><a class="style2"  href="suoyoujiaoshi_list.jsp" target="whlmain">－ 教室信息查询</a></td></tr>

             </tbody>
          </table>
         </td>
        </tr>     
        
        
        
        
        
                                  
                        <tr>
          <td background="index/YHMenu.files/new_027.jpg" height="1"></td></tr>
        <tr>
          <td class="mainMenu" onClick="MenuDisplay('table_10');"><span  class="span" id="table_10Span">＋</span> 数据库备份</td></tr>
        <tr>
          <td>
            <table id="table_10" style="DISPLAY: none" cellspacing="0" cellpadding="2"  width="155" align="center" border="0">
              <tbody>
              <tr>
                <td class="menuSmall"><a class="style2"  href="databack.jsp" target="whlmain">－ 数据库备份</a></td></tr>
         

             </tbody>
          </table>
         </td>
        </tr>             

                  
               </tbody>
            </table>
         </td>
                  
                  
    <td background="index/YHMenu.files/new_009.jpg" style="width: 15px"></td></tr>
    </tbody></table>
    
    
    
        <table cellspacing="0" cellpadding="0" width="210" align="center" border="0">
                  <tbody>
                          <tr>
                            <td width="15"><img src="index/YHMenu.files/new_010.jpg" border="0"></td>
                            <td align="middle" width="180" background="index/YHMenu.files/new_011.jpg" height="15"></td>
                            <td width="15"><img src="index/YHMenu.files/new_012.jpg" border="0"></td>
                        </tr>
                </tbody>
        </table>
</form>
</body>
</html>