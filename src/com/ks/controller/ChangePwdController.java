package com.ks.controller;

import com.ks.bean.User;
import com.ks.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ChangePwdController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        User user = (User) req.getSession().getAttribute("User");
        String pwd_o = req.getParameter("password_old");
        String pwd_n = req.getParameter("password_new");
        int uId = user.getuId();
        UserService userService = new UserService();
        String pwd_now = userService.getPwdById(uId);
        if (!pwd_now.equals(pwd_o)) {
            req.setAttribute("msg", "旧密码输入错误");
            req.getRequestDispatcher("changePwd.jsp").forward(req, resp);
        } else {
            user.setuPwd(pwd_n);
            if ( userService.updateUser(user)){
                req.setAttribute("msg", "修改成功");
            }
            else{
                req.setAttribute("msg", "修改失败");
            }
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }

    }
}
