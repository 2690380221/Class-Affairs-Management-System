package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.service.AffairsService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class SortedAffairsController  extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AffairsService affairsService=new AffairsService();
        int sortId= Integer.parseInt(request.getParameter("sortId"));
        List<Affair> list=affairsService.sortedAffairs(sortId);

        request.setAttribute("affairList",list);
        //  TODO  重定向到 sortedAffairs.jsp;
    }
}
