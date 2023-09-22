package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.service.AffairsService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class MaintainAffairsController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AffairsService affairsService=new AffairsService();

        List<Affair>list=affairsService.affairsList();
        request.setAttribute("affairList",list);

        request.getRequestDispatcher("maintainAffairs.jsp").forward(request,response);
    }
}
