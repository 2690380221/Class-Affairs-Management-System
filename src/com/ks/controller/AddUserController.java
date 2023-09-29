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
 * 管理员在 addUser.jsp 界面点击提交
 * 跳转到 maintainUser.jsp 查看添加操作后的用户列表
 */
public class AddUserController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

//        String name=new String(req.getParameter("username").getBytes("iso-8859-1"),"utf-8");
        String name = req.getParameter("username");
        String password = req.getParameter("password");
        int type = Integer.parseInt(req.getParameter("type"));

        User user=new User();
        user.setuId(0);
        user.setuName(name);
        user.setuPwd(password);
        user.setuType(type);
        UserService userService=new UserService();

        System.out.println(name);
        System.out.println(password);
        System.out.println(type);




        if(userService.addUser(user)){
            req.setAttribute("message","添加成功");
            int uId= ((User) req.getSession().getAttribute("user")).getuId();
            List<User> list= userService.userList(uId);
            req.setAttribute("userList",list);
            req.getRequestDispatcher("maintainUser.jsp").forward(req,resp);
        }else{
            req.setAttribute("message","添加失败");
            int uId= ((User) req.getSession().getAttribute("user")).getuId();
            List<User> list= userService.userList(uId);
            req.setAttribute("userList",list);
            req.getRequestDispatcher("maintainUser.jsp").forward(req,resp);
        }
    }
}
