package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.service.AffairsService;
import com.ks.service.SortService;

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
        List<Affair> list;
        String sortName;
        if(sortId!=0){
            sortName=new SortService().getNameById(sortId);
            list=affairsService.sortedAffairs(sortId);
        }else {
            list = affairsService.affairsList();
            sortName="全部事务";
        }
        request.setAttribute("sortName", sortName);
        request.getSession().setAttribute("affairList",list);
        request.getRequestDispatcher("affairList.jsp").forward(request,response);
    }
}
