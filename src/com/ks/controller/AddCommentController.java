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
        String content=req.getParameter("content");
        //TODO 从session 中获得用户对象
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
            //TODO 跳转到 viewAffair.jsp
        } else {
            req.setAttribute("msg","添加评论失败");
            //TODO 跳转到 viewAffair.jsp
        }
    }
}
