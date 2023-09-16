package com.ks.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/QueryController") // 与web.xml中的servlet-mapping一致
public class QueryController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 从前端接收表单数据
        String name = request.getParameter("name");
        String region = request.getParameter("region");
        // 可以继续获取其他表单字段的值

        // 在这里处理表单数据，执行您的业务逻辑

        // 响应结果（示例）
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Received data: name=" + name + ", region=" + region);
    }
}
