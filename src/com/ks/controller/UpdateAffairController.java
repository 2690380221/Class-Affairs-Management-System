package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.service.AffairsService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 在modifyAffair.jsp中点击提交按钮交给这个servlet处理事务的更新
 */
public class UpdateAffairController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int affairId= Integer.parseInt(request.getParameter("affairId"));


        Affair aff=new Affair();
        AffairsService aas=new AffairsService();

        String title=request.getParameter("tltle");
        String content=request.getParameter("content");
        int sortId= Integer.parseInt(request.getParameter("sort"));
        aff.setSortId(sortId);
        aff.setTitle(title);
        aff.setContent(content);
        //TODO 可能要设置 bfTime
        if(aas.update(affairId,aff)){
            request.setAttribute("msg","修改成功");
        }else {
            request.setAttribute("msg","修改失败");
        }
        //TODO 设置重定向到的页面
    }
}
