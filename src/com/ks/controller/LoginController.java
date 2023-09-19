package com.ks.controller;

import com.ks.bean.User;
import com.ks.service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginController extends HttpServlet {

    private LoginService loginService = new LoginService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 从前端接收表单数据
        String uname = request.getParameter("username");
        String upwd = request.getParameter("password");
        System.out.println(uname);
        System.out.println(upwd);

        User user = loginService.login(uname, upwd);
        System.out.println("uid:" + user.getuId());
        if (user.getuId() >= 1) {//登录成功
            request.getSession().setAttribute("user", user);
            //重定向到main.jsp
            String redirectUrl = "/un/main.jsp"; // 设置重定向URL
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"redirect\": \"" + redirectUrl + "\"}");


        } else if (user.getuId() == 0) {//密码错误
            request.getSession().setAttribute("msg", "密码错误");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {//查无此人
            request.getSession().setAttribute("msg", "用户不存在");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }
}
