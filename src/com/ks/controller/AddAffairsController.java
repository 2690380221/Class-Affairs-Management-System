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
        String title=req.getParameter("tltle");
        String content=req.getParameter("content");
        int sortId= Integer.parseInt(req.getParameter("sort"));
        aff.setAffairId(++num);
        aff.setTitle(title);
        aff.setContent(content);
        aff.setSortId(sortId);

        //TODO 可能要设置 bfTime
        if(aas.save(aff)){
            req.setAttribute("msg","添加成功");
        }else {
            req.setAttribute("msg","添加失败");
        }
        //TODO 设置重定向到的页面
    }
}
