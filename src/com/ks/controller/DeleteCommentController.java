package com.ks.controller;

import com.ks.service.CommentService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 在 viewAffair.jsp 点击删除后交至此
 * 转发给viewAffairController以跳转 viewAffair.jsp
 */
public class DeleteCommentController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int commentId= Integer.parseInt(req.getParameter("commentId"));
        CommentService commentService=new CommentService();
        if(commentService.deleteByCommentId(commentId)){
            req.setAttribute("msg","删除成功");
        }else {
            req.setAttribute("msg","删除失败");
        }
        int affairId= Integer.parseInt(req.getParameter("affairId"));
        req.setAttribute("affairId",affairId);
        req.getRequestDispatcher("viewAffairController").forward(req,resp);
    }
}
