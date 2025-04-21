package cn.xf.servlet;

import cn.xf.pojo.User;
import cn.xf.pojo.Device;
import cn.xf.service.FileService;
import cn.xf.service.FileServiceImpl;
import cn.xf.service.LoginService;
import cn.xf.service.LoginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        String id=req.getParameter("uid");
        String pwd = req.getParameter("pwd");
        User u=new User();
        u.setUid(id);
        u.setPwd(pwd);
        u.toString();
        LoginService ls=new LoginServiceImpl();
        User user=ls.logService(u);
        if(user==null){
            req.setAttribute("error","账号或密码错误");
            req.getRequestDispatcher("index.jsp").forward(req,res);
            //login.jsp
        }else{
            req.setAttribute("user",user);
            req.setAttribute("mainRight","show.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req,res);

        }
    }
}

