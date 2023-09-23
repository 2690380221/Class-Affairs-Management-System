package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.bean.Sort;
import com.ks.bean.User;
import com.ks.service.AffairsService;
import com.ks.service.LoginService;
import com.ks.service.SortService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        SortService ssv=new SortService();
        List<Sort>list=ssv.getSorts();
        request.setAttribute("sortList",list);
        request.getSession().setAttribute("sortList",list);

        User user = loginService.login(uname, upwd);
        System.out.println("uid:" + user.getuId());
        if (user.getuId() >= 1) {//登录成功
            request.getSession().setAttribute("user", user);
            //重定向到main.jsp
            response.getWriter().write("{\"success\": \"" + true + "\"}");

        } else if (user.getuId() == 0) {//密码错误
            response.getWriter().write("{\"msg\": \"" + "密码错误" + "\"}");
        } else {//查无此人
            response.getWriter().write("{\"msg\": \"" + "用户不存在" + "\"}");
        }

    }
}
