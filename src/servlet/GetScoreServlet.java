package servlet;

import dao.Kaoshitimu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by tong- on 2017/5/4.
 */
@WebServlet(name = "GetScoreServlet",urlPatterns = "/GetScoreServlet")
public class GetScoreServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");

        Kaoshitimu dao = new Kaoshitimu();
        int score = 0;

        String username = request.getParameter("username");

        int xuanzeId1 = Integer.parseInt(request.getParameter("xuanzeId1"));
        int xuanzeId2 = Integer.parseInt(request.getParameter("xuanzeId2"));
        int xuanzeId3 = Integer.parseInt(request.getParameter("xuanzeId3"));
        int xuanzeId4 = Integer.parseInt(request.getParameter("xuanzeId4"));
        int xuanzeId5 = Integer.parseInt(request.getParameter("xuanzeId5"));

        int xuanze1 = Integer.parseInt(request.getParameter("xuanze1"));
        int xuanze2 = Integer.parseInt(request.getParameter("xuanze2"));
        int xuanze3 = Integer.parseInt(request.getParameter("xuanze3"));
        int xuanze4 = Integer.parseInt(request.getParameter("xuanze4"));
        int xuanze5 = Integer.parseInt(request.getParameter("xuanze5"));

        int xuanzeDaan1 = dao.selectXuanzeDaanById(xuanzeId1);
        int xuanzeDaan2 = dao.selectXuanzeDaanById(xuanzeId2);
        int xuanzeDaan3 = dao.selectXuanzeDaanById(xuanzeId3);
        int xuanzeDaan4 = dao.selectXuanzeDaanById(xuanzeId4);
        int xuanzeDaan5 = dao.selectXuanzeDaanById(xuanzeId5);

        int tiankongId1 = Integer.parseInt(request.getParameter("tiankongId1"));
        int tiankongId2 = Integer.parseInt(request.getParameter("tiankongId2"));
        int tiankongId3 = Integer.parseInt(request.getParameter("tiankongId3"));
        int tiankongId4 = Integer.parseInt(request.getParameter("tiankongId4"));
        int tiankongId5 = Integer.parseInt(request.getParameter("tiankongId5"));

        String tiankong1 = request.getParameter("tiankong1");
        String tiankong2 = request.getParameter("tiankong2");
        String tiankong3 = request.getParameter("tiankong3");
        String tiankong4 = request.getParameter("tiankong4");
        String tiankong5 = request.getParameter("tiankong5");

        String tiankongDaan1 = dao.selectTiankongDaanById(tiankongId1);
        String tiankongDaan2 = dao.selectTiankongDaanById(tiankongId2);
        String tiankongDaan3 = dao.selectTiankongDaanById(tiankongId3);
        String tiankongDaan4 = dao.selectTiankongDaanById(tiankongId4);
        String tiankongDaan5 = dao.selectTiankongDaanById(tiankongId5);

        if (xuanze1 == xuanzeDaan1){
            score += 10;
        }
        if (xuanze2 == xuanzeDaan2){
            score += 10;
        }
        if (xuanze3 == xuanzeDaan3){
            score += 10;
        }
        if (xuanze4 == xuanzeDaan4){
            score += 10;
        }
        if (xuanze5 == xuanzeDaan5){
            score += 10;
        }

        if (tiankongDaan1.equals(tiankong1)){
            score += 10;
        }
        if (tiankongDaan2.equals(tiankong2)){
            score += 10;
        }
        if (tiankongDaan3.equals(tiankong3)){
            score += 10;
        }
        if (tiankongDaan4.equals(tiankong4)){
            score += 10;
        }
        if (tiankongDaan5.equals(tiankong5)){
            score += 10;
        }

        int r = dao.updateScore(score,username);
        if (r>0){
            out.print("<script>alert('考试提交成功！');location.href='selectkaoshichengji.jsp';</script>");
        }else {
            out.print("<script>alert('考试提交失败，请重试！');history.go(-1);</script>");
        }
    }
}
