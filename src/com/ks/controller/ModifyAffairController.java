package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.bean.Sort;
import com.ks.service.AffairsService;
import com.ks.service.SortService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ModifyAffairController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AffairsService affairsService=new AffairsService();
        int affairId= Integer.parseInt(request.getParameter("affairId"));
        Affair affair=affairsService.getAffair(affairId);

        SortService sortService=new SortService();
        List<Sort>list=sortService.getSorts();

        request.setAttribute("affair",affair);
        request.setAttribute("sortList",list);
        //TODO 重定向到 modifyAffair.jsp 展示信息
    }
}
