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
@WebServlet(name = "DeleteXuanzeByIdServlet",urlPatterns = "/DeleteXuanzeByIdServlet")
public class DeleteXuanzeByIdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");

        int timuId = Integer.parseInt(request.getParameter("timuId"));

        Kaoshitimu dao = new Kaoshitimu();
        int r = dao.deleteXuanzeById(timuId);
        if (r>0){
            out.print("<script>alert('删除成功！');location.href='kaoshitimuguanli_list.jsp?';</script>");
        }else {
            out.print("<script>alert('删除失败！');location.href='kaoshitimuguanli_list.jsp?';</script>");
        }

        out.flush();
        out.close();
    }
}
