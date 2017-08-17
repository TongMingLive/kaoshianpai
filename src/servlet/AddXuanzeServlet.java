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
@WebServlet(name = "AddXuanzeServlet",urlPatterns = "/AddXuanzeServlet")
public class AddXuanzeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");

        String zhuanyemingcheng = request.getParameter("zhuanyemingcheng");
        String timuTitle = request.getParameter("timuTitle");
        String xuanze1 = request.getParameter("xuanze1");
        String xuanze2 = request.getParameter("xuanze2");
        String xuanze3 = request.getParameter("xuanze3");
        String xuanze4 = request.getParameter("xuanze4");
        int daan = Integer.parseInt(request.getParameter("daan"));

        Kaoshitimu dao = new Kaoshitimu();
        int r = dao.addXuanze(zhuanyemingcheng,timuTitle,xuanze1,xuanze2,xuanze3,xuanze4,daan);
        if (r>0){
            out.print("<script>alert('发布成功！');location.href='kaoshitimuguanli_list.jsp?';</script>");
        }else {
            out.print("<script>alert('发布失败！');location.href='kaoshitimuguanli_list.jsp?';</script>");
        }

        out.flush();
        out.close();
    }
}
