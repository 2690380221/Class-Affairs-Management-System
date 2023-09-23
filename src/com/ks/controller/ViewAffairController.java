package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.service.AffairsService;
import com.ks.service.CommentService;
import com.ks.service.SortService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ViewAffairController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int affairId= Integer.parseInt(request.getParameter("affairId"));

        AffairsService affairsService=new AffairsService();
        Affair affair=affairsService.getAffair(affairId);
        
        SortService sortService=new SortService();
        String sortName=sortService.getNameById(affair.getSortId());
        CommentService commentService=new CommentService();

        request.setAttribute("commentList",commentService.getCommentList(affairId));
        request.setAttribute("affair",affair);
        request.setAttribute("sortName",sortName);


    }
}
