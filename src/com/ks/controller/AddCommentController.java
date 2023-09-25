package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.bean.Comment;
import com.ks.bean.User;
import com.ks.service.AffairsService;
import com.ks.service.CommentService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class AddCommentController extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int affairId= Integer.parseInt(req.getParameter("affairId"));

        AffairsService affairsService= new AffairsService();
        Affair affair=affairsService.getAffair(affairId);
        CommentService commentService=new CommentService();
        String content = new String(req.getParameter("content").getBytes("iso-8859-1"), "utf-8");

        User user= (User) req.getSession().getAttribute("user");
        Comment comment =new Comment();
        comment.setCommentId(0);// 在表中已经设置自动递增，插入0后自动排列到最下面
        comment.setContent(content);
        comment.setAffairId(affair.getAffairId());
        comment.setUserId(user.getuId());

        if(commentService.save(comment)){
            List<Comment>list=commentService.getCommentList(affairId);
            req.setAttribute("commentList",list);
            req.setAttribute("affair",affair);
            req.setAttribute("sortName",req.getParameter("sortName"));
            req.getRequestDispatcher("viewAffair.jsp").forward(req,resp);
        } else {
            req.setAttribute("msg","添加评论失败");
            req.getRequestDispatcher("viewAffair.jsp").forward(req,resp);
        }
    }
}
