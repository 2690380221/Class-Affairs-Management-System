package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.bean.Query;
import com.ks.service.AffairsService;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * query.jsp 提交查询表单查询
 */

public class QueryController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException {
        doPost(req, resp);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        // 从前端接收表单数据
        String title = new String(request.getParameter("title").getBytes("iso-8859-1"), "utf-8");

//        String title = request.getParameter("title");// 按标题查询
        int sort = Integer.parseInt(request.getParameter("sort"));// 按类别查询
        String time=request.getParameter("time");// 按发布时间查询

        title="%"+title+"%";
        System.out.println(title);
        System.out.println(time);
        System.out.println(sort);

        AffairsService affairsService=new AffairsService();
        Query query=new Query();
        query.setTitle(title);
        query.setTime(time+" 23:59:59");
        query.setSortId(sort);


        List<Affair> results = affairsService.searchByConditions(query);
        if(results.size()>0){
            request.getSession().setAttribute("affairList",results);
            request.setAttribute("sortName","查询结果");
            request.getRequestDispatcher("affairList.jsp").forward(request,response);
        }else {
            request.setAttribute("message","没有符合要求的事务");
            System.out.println("没有符合要求的事务");
            request.getRequestDispatcher("query.jsp").forward(request,response);
        }

    }


}
