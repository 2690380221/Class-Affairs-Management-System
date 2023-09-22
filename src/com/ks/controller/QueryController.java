package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.service.AffairsService;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class QueryController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException {
        doPost(req, resp);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        // 从前端接收表单数据
        String title = request.getParameter("title");// 按标题查询
        String sort = request.getParameter("sort");// 按类别查询
        String time=request.getParameter("time");// 按发布时间查询

        AffairsService affairsService=new AffairsService();
        List<Affair> results = affairsService.searchByConditions(title, sort, time);
        request.setAttribute("affairList",results);
        request.getRequestDispatcher("affairList.jsp").forward(request,response);
    }


}
