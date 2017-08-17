<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0036)http://localhost:10868/hr/login.aspx -->
<!-- saved from url=(0041)http://www.youhao.com/manage/YHLogin.aspx -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<style type="text/css">
body {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
}
td {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
}
</style>

<meta content="MSHTML 6.00.6000.16809" name="GENERATOR"/>
</head>
<body>



<div>
<input id="__EVENTTARGET" type="hidden" name="__EVENTTARGET"/> 
<input id="__EVENTARGUMENT" type="hidden" name="__EVENTARGUMENT"/> 
<input id="__VIEWSTATE" type="hidden" value="/wEPDwUKLTMxMzU2OTkzM2QYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgEFA2J0bmF2stSMyj1cbWFEH2tzan/b7XAS" name="__VIEWSTATE"/> </div>
<script type="text/javascript">
<!--
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
// -->
</script>

<script src="login_files/WebResource.axd" type="text/javascript"></script>

<script src="login_files/WebResource(1).axd" type="text/javascript"></script>

<script src="login_files/ScriptResource.axd" type="text/javascript"></script>

<script src="login_files/ScriptResource(1).axd" type="text/javascript"></script>

<script type="text/javascript">
<!--
function WebForm_OnSubmit() {
if (typeof(ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) return false;
return true;
}
// -->
</script>


<div id="UpdatePanel1">
<div id="div1" 
style="LEFT: 0px; POSITION: absolute; TOP: 0px; BACKGROUND-COLOR: #0066ff"></div>
<div id="div2" 
style="LEFT: 0px; POSITION: absolute; TOP: 0px; BACKGROUND-COLOR: #0066ff"></div>
<script language="JavaScript" type ="text/javascript"> 
var speed=20;
var temp=new Array(); 
var clipright=document.body.clientWidth/2,clipleft=0 
for (i=1;i<=2;i++){ 
	temp[i]=eval("document.all.div"+i+".style");
	temp[i].width=document.body.clientWidth/2;
	temp[i].height=document.body.clientHeight;
	temp[i].left=(i-1)*parseInt(temp[i].width);
} 
function openit(){ 
	clipright-=speed;
	temp[1].clip="rect(0 "+clipright+" auto 0)";
	clipleft+=speed;
	temp[2].clip="rect(0 auto auto "+clipleft+")";
	if (clipright<=0)
		clearInterval(tim);
} 
tim=setInterval("openit()",100);
 </script>

<div>&nbsp;&nbsp; </div>
<div>


 <form name="form1" method="post" action="adminyanzheng.jsp">
<table cellspacing="0" cellpadding="0" width="900" align="center" border="0">
  <tbody>
        <tr>
          <td colspan="2" height="35">  <div style="font-family:宋体; color:#FFFFFF; filter:Glow(Color=#,Strength=2); WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 19pt; margin-top:5pt">
                  <div align="center" class="STYLE5">考试安排系统</div>
              </div></td></tr>
  <tr>
    <td style="HEIGHT: 105px"><img src="login_files/login_1.gif"  border="0" alt=""/></td></tr>
  <tr>
    <td background="login_files/login_2.jpg" height="300">
      <table height="300" cellpadding="0" width="900" border="0">
        <tbody>
        <tr>
          <td colspan="2" height="35">        </td></tr>
        <tr>
          <td width="360"></td>
          <td>
            <table cellspacing="0" cellpadding="2" border="0">
              <tbody>
              <tr>
                <td style="HEIGHT: 28px" width="80">登 录 名：</td>
                <td style="HEIGHT: 28px" width="150">	<input name="username" type="text" class="txt" size="25" />	</td>
                <td style="HEIGHT: 28px" width="370"><span   id="RequiredFieldValidator3"  style="FONT-WEIGHT: bold; VISIBILITY: hidden; COLOR: white">请输入登录名</span></td>
                </tr>
              <tr>
                <td style="HEIGHT: 28px">登录密码：</td>
                <td style="HEIGHT: 28px">    <input name="pwd" type="password" class="txt" size="25" />		</td>
                <td style="HEIGHT: 28px"><span id="RequiredFieldValidator4"  style="FONT-WEIGHT: bold; VISIBILITY: hidden; COLOR: white">请输入密码</span></td></tr>
              <tr>
                <td style="HEIGHT: 28px">权限：</td>
                <td style="HEIGHT: 28px"> 	 <select name="cx" id="cx">
	                  <option value="管理员">管理员</option>
	                   <option value="教师">教师</option> 
					      <option value="学生">学生</option> 
	                </select>		</td>
                <td style="HEIGHT: 28px">&nbsp;</td></tr>
              <tr>
                <td style="HEIGHT: 18px"></td>
                <td style="HEIGHT: 18px"></td>
                <td style="HEIGHT: 18px"></td></tr>
              <tr>
                <td style="height: 42px"></td>
                <td style="height: 42px">
              
   
                  
                  <img src="login_files/login_button.gif"  border="0" style="cursor:hand"  onClick="form1.submit();"/>
                  
              </td>
              </tr></tbody></table></td></tr></tbody></table></td></tr>
  <tr>
    <td><img src="login_files/login_3.jpg" border="0" alt=""/>
    </td>
    </tr>
    </tbody>
    </table>
    </form>
    
    </div>
   </div>
   
<script type="text/javascript">
<!--
var Page_Validators =  new Array(document.getElementById("RequiredFieldValidator3"), document.getElementById("RequiredFieldValidator4"));
// -->
</script>

<script type="text/javascript">
<!--
var RequiredFieldValidator3 = document.all ? document.all["RequiredFieldValidator3"] : document.getElementById("RequiredFieldValidator3");
RequiredFieldValidator3.controltovalidate = "txtName";
RequiredFieldValidator3.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
RequiredFieldValidator3.initialvalue = "";
var RequiredFieldValidator4 = document.all ? document.all["RequiredFieldValidator4"] : document.getElementById("RequiredFieldValidator4");
RequiredFieldValidator4.controltovalidate = "txtPwd";
RequiredFieldValidator4.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
RequiredFieldValidator4.initialvalue = "";
// -->
</script>

<div><input id="__EVENTVALIDATION" type="hidden" value="/wEWBQKHmOW2AwLEhISFCwKd+7qdDgLChPy+DQKSoqqWDwNN1E3vW0gpbdtBgVWKbj2bcHhs" name="__EVENTVALIDATION"/> </div>



</body>
</html>


