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
@WebServlet(name = "UpdateScoreServlet",urlPatterns = "/UpdateScoreServlet")
public class UpdateScoreServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");

        Kaoshitimu dao = new Kaoshitimu();

        String xuehao = request.getParameter("xuehao");
        int score = Integer.parseInt(request.getParameter("score"));

        int r = dao.updateScore(score,xuehao);
        if (r>0){
            System.out.println("成绩已更新为" + score);
        }else {
            System.out.println("成绩更新失败");
        }
    }
}
