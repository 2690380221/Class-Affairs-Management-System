package com.ks.controller;

import com.ks.bean.Sort;
import com.ks.service.SortService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 获得sort表中的数据，传递给addAffairs.jsp 进行类别选择
 * 在adAffairs.jsp之前，由main.jsp调用
 */
public class SortController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        SortService ssv=new SortService();
        List<Sort>list=ssv.getSorts();
        req.setAttribute("sortList",list);

        req.getRequestDispatcher("addAffairs.jsp").forward(req,resp);
        }
}
