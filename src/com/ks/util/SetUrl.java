package com.ks.util;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SetUrl  extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        String newValue = request.getParameter("url");
        HttpSession session = request.getSession();
        session.setAttribute("url", newValue);
    }
}
