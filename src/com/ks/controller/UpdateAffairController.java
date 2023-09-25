package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.service.AffairsService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 在modifyAffair.jsp中点击提交按钮交给这个servlet处理事务的更新
 */
public class UpdateAffairController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int affairId= (int)(request.getSession().getAttribute("affairId"));


        Affair aff=new Affair();
        AffairsService aas=new AffairsService();

//        String title=request.getParameter("title");
        String title = new String(request.getParameter("title").getBytes("iso-8859-1"), "utf-8");
        String content = new String(request.getParameter("content").getBytes("iso-8859-1"), "utf-8");
        int sortId= Integer.parseInt(request.getParameter("sort"));
        aff.setAffairId(affairId);
        aff.setSortId(sortId);
        aff.setTitle(title);
        aff.setContent(content);

        System.out.println(title);
        System.out.println(sortId);
        System.out.println(content);

        if(aas.update(aff)){
            System.out.println("修改成功");
            request.setAttribute("msg","修改成功");
            List<Affair> list=new AffairsService().affairsList();
            request.setAttribute("affairList",list);
            request.getRequestDispatcher("maintainAffairs.jsp").forward(request,response);
        }else {
            request.setAttribute("msg","修改失败");
            request.getRequestDispatcher("maintainAffairs.jsp").forward(request,response);
        }
    }
}
