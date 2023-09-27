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
 * 管理员修改成员信息
 */
public class UpdateUserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int uId_change= Integer.parseInt(request.getParameter("uId"));
        String name = new String(request.getParameter("username").getBytes("iso-8859-1"), "utf-8");
        String pwd=request.getParameter("password");
        int uType= Integer.parseInt(request.getParameter("type"));
        User user=new User(uId_change,name,pwd,uType);
        UserService userService =new UserService();

        if(userService.updateUser(user)){
            int uId= ((User) request.getSession().getAttribute("user")).getuId();
            List<User> list= userService.userList(uId);
            request.setAttribute("userList",list);
            request.setAttribute("message","修改成功");
        }else {
            request.setAttribute("message","修改失败");
        }
        request.getRequestDispatcher("maintainUser.jsp").forward(request,response);
    }
}
