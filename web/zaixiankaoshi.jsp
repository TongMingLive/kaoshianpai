
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="dao.Kaoshitimu" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Xuanze" %>
<%@ page import="bean.Tiankong" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.Collections" %>

<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>在线考试</title><script language="javascript" src="js/Calendar.js"></script>
      <link href="images/StyleSheet.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        var time_now_server,time_now_client,time_end,time_server_client,timerID;

        time_end=new Date("2010/10/4 01:00:00");//结束的时间
        time_end=time_end.getTime();

        time_now_server=new Date("2010/10/04 00:00:00");//开始的时间
        time_now_server=time_now_server.getTime();

        time_now_client=new Date();
        time_now_client=time_now_client.getTime();

        time_server_client=time_now_server-time_now_client;

        setTimeout("show_time()",1000);

        function show_time()
        {
            var timer = document.getElementById("timer");
            if(!timer){
                return ;
            }
            timer.innerHTML =time_server_client;

            var time_now,time_distance,str_time;
            var int_day,int_hour,int_minute,int_second;
            var time_now=new Date();
            time_now=time_now.getTime()+time_server_client;
            time_distance=time_end-time_now;
            if(time_distance>0)
            {
                int_day=Math.floor(time_distance/86400000)
                time_distance-=int_day*86400000;
                int_hour=Math.floor(time_distance/3600000)
                time_distance-=int_hour*3600000;
                int_minute=Math.floor(time_distance/60000)
                time_distance-=int_minute*60000;
                int_second=Math.floor(time_distance/1000)

                if(int_hour<10)
                    int_hour="0"+int_hour;
                if(int_minute<10)
                    int_minute="0"+int_minute;
                if(int_second<10)
                    int_second="0"+int_second;
                str_time=int_hour+"小时"+int_minute+"分钟"+int_second+"秒";
                timer.innerHTML=str_time;
                setTimeout("show_time()",1000);
            }
            else
            {
                timer.innerHTML =timer.innerHTML;
                clearTimeout(timerID)
            }
        }
    </script>
  </head>
  <body style="margin: 50px">
  <%

    String sql="select * from xueshengxinxi where xuehao='"+request.getSession().getAttribute("username")+"'";
    String zhuanyemingcheng="";
    int score = 0;

    ResultSet RS_result=connDbBean.executeQuery(sql);
    while(RS_result.next()){
      zhuanyemingcheng = RS_result.getString("zhuanyemingcheng");
      score = RS_result.getInt("score");
    }

    Kaoshitimu dao = new Kaoshitimu();
    List<Xuanze> xuanzes = dao.selectXuanzeByzy(zhuanyemingcheng);
    List<Tiankong> tiankongs = dao.selectTiankongByzy(zhuanyemingcheng);

    int xuanzesSize = xuanzes.size();
    Random xrandom = new Random();
    for (int i = 0;i<xuanzesSize;i++){
      int randomPos = xrandom.nextInt(xuanzesSize);
      Collections.swap(xuanzes,i,randomPos);
    }

    int tiankongsSize = tiankongs.size();
    Random trandom = new Random();
    for (int i = 0;i<tiankongsSize;i++){
      int randomPos = trandom.nextInt(tiankongsSize);
      Collections.swap(tiankongs,i,randomPos);
    }

    if (score != -1){
  %>
    <h3><a href="selectkaoshichengji.jsp"> 您已进行过考试，点击查看考试成绩</a></h3>
  <%}else {
        //dao.updateScore(0,request.getSession().getAttribute("username").toString());
    %>
    <h3>在线考试，请勿中途退出（中途退出将记0分，答题后请仔细阅卷并点击提交按钮，否则按零分处理！）</h3>
    <h3>剩余时间：</h3>
    <div id="timer">**小时**分钟**秒</div>
    <br>
    <form action="GetScoreServlet">
      <input type="hidden" value="<%=request.getSession().getAttribute("username")%>" name="username">
      <h3>选择题</h3>
      <% for (int i=0;i<5;i++){
        Xuanze xuanze = xuanzes.get(i);%>
        <h2><%=i+1%>.<%=xuanze.getTimuTitle()%>?</h2>
        <input type="hidden" name="xuanzeId<%=i+1%>" value="<%=xuanze.getTimuId()%>">
        <select name="xuanze<%=i+1%>">
          <option value="0">--请选择--</option>
          <option value="1"><%=xuanze.getXuanze1()%></option>
          <option value="2"><%=xuanze.getXuanze2()%></option>
          <option value="3"><%=xuanze.getXuanze3()%></option>
          <option value="4"><%=xuanze.getXuanze4()%></option>
        </select><br>
      <%}%>
      <h3>填空题</h3>
      <% for (int i=0;i<5;i++){
        Tiankong tiankong = tiankongs.get(i);%>
      <h2><%=i+1%>.<%=tiankong.getTimuTitle()%>?</h2>
      <input type="hidden" name="tiankongId<%=i+1%>" value="<%=tiankong.getTimuId()%>">
      <input type="text" name="tiankong<%=i+1%>">
      <%}%>
      <br><br>
      <button type="submit">提交</button>
    </form>

  <%}%>
<script>
  history.forward();
  window.onbeforeunload = function () {
      return "关闭本页面后，试卷将判0分，是否确定退出？";
  }
</script>
  </body>
</html>


