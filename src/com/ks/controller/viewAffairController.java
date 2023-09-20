package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.service.AffairsService;
import com.ks.service.SortService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class viewAffairController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int affairId= Integer.parseInt(request.getParameter("affairId"));

        AffairsService affairsService=new AffairsService();
        Affair affair=affairsService.getAffair(affairId);
        SortService sortService=new SortService();
        String sortName=sortService.getNameById(affair.getSortId());

        request.setAttribute("affair",affair);
        request.setAttribute("sortName",sortName);

        //  TODO  重定向到 viewAffair.jsp;
    }
}
