package com.ks.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class QueryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 从前端接收表单数据
        String name = request.getParameter("name");
        String region = request.getParameter("region");

        System.out.println(name);

    }


}
