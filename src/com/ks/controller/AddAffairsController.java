package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.service.AffairsService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddAffairsController extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        Affair aff=new Affair();
        AffairsService aas=new AffairsService();
        int num=aas.recordCount();
        String title=new String(req.getParameter("title").getBytes("iso-8859-1"),"utf-8");

        String content=new String(req.getParameter("content").getBytes("iso-8859-1"),"utf-8");
        int sortId= Integer.parseInt(req.getParameter("sort"));

        System.out.println(num+1);
        System.out.println(title);
        System.out.println(content);
        System.out.println(sortId);

        aff.setAffairId(++num);
        aff.setTitle(title);
        aff.setContent(content);
        aff.setSortId(sortId);

        if(aas.save(aff)){
            System.out.println("添加成功");
            req.setAttribute("message", "添加成功");
//            req.setCharacterEncoding("UTF-8");

            req.getRequestDispatcher("addAffair.jsp").forward(req, resp);
        }else {
            System.out.println("添加失败");
            req.setAttribute("message", "添加失败");
        }

    }
}
