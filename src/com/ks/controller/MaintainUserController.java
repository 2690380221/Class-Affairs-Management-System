package com.ks.controller;
import com.ks.bean.User;
import com.ks.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 点击侧边 成员维护时 获取用户列表
 */
public class MaintainUserController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserService userService =new UserService();
        int uId= ((User) request.getSession().getAttribute("user")).getuId();
        List<User> list= userService.userList(uId);
        request.setAttribute("userList",list);

        request.getRequestDispatcher("maintainUser.jsp").forward(request,response);
    }
}
