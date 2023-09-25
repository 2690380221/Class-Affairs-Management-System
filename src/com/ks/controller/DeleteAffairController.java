package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.service.AffairsService;
import com.ks.service.CommentService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 在maintain.jsp中点击删除按钮进行删除事务操作
 * TODO 添加批量删除功能
 */
public class DeleteAffairController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int affairId= Integer.parseInt(req.getParameter("affairId"));

        AffairsService affairsService=new AffairsService();
        CommentService commentService=new CommentService();

        boolean d1=affairsService.delete(affairId);
        boolean d2=commentService.deleteByAffairId(affairId);
        System.out.println(d1);
        System.out.println(d2);
        if(d1&&d2){
            affairsService.reSorting(affairId);//将id重排

            //为跳转maintain.jap准备
            List<Affair>list=affairsService.affairsList();
            req.setAttribute("affairList",list);

            req.setAttribute("msg","删除成功");
            req.getRequestDispatcher("maintainAffairs.jsp").forward(req,resp);
            System.out.println("删除成功");
        }else {
            req.setAttribute("msg","删除失败");
            System.out.println("删除失败");
        }
    }
}
