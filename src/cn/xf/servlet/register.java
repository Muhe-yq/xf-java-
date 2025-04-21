package cn.xf.servlet;

import cn.xf.pojo.User;
import cn.xf.service.FileService;
import cn.xf.service.FileServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/reg")
public class register extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String a = req.getParameter("a");
        String b = req.getParameter("b");
        String c = req.getParameter("c");
        String d = req.getParameter("d");
        User user = new User();
        user.setName(a);
        user.setIdcard(b);
        user.setPwd(c);
        user.setSex(d);
        FileService fs = new FileServiceImpl();

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
        String id = sdf.format(date);
        user.setUid(id);

        fs.Register(user);

        req.setAttribute("id",id);
        req.setAttribute("name",a);
        req.getRequestDispatcher("regscu.jsp").forward(req,resp);
    }
}
