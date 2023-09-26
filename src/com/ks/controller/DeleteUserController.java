package com.ks.controller;

import com.ks.bean.User;
import com.ks.service.CommentService;
import com.ks.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 在 maintainUser.jsp 点击删除按钮后交给此servlet
 */
public class DeleteUserController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int uId = Integer.parseInt(req.getParameter("uId"));
        UserService userService = new UserService();
        CommentService commentService = new CommentService();
        boolean b1 = userService.deleteUser(uId);
        boolean b2 = commentService.deleteByUserId(uId);
        if (b1 && b2) {
            userService.reSorting(uId);
            req.setAttribute("message", "删除成功");
        } else {
            req.setAttribute("message", "删除失败");
        }
        int uId_login = ((User) req.getSession().getAttribute("user")).getuId();
        List<User> list = userService.userList(uId_login);
        req.setAttribute("userList", list);
        req.getRequestDispatcher("maintainUser.jsp").forward(req, resp);
    }

}
