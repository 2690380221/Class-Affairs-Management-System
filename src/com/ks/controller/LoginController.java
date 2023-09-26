package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.bean.Sort;
import com.ks.bean.User;
import com.ks.service.AffairsService;
import com.ks.service.UserService;
import com.ks.service.SortService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class LoginController extends HttpServlet {

    private UserService userService;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        userService =new UserService();
        // 从前端接收表单数据
        String uname = request.getParameter("username");
        String upwd = request.getParameter("password");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        SortService ssv=new SortService();
        List<Sort>list=ssv.getSorts();
        request.setAttribute("sortList",list);
        request.getSession().setAttribute("sortList",list);

        System.out.println("name:"+uname);
        System.out.println("pwd:"+upwd);
        User user = userService.login(uname, upwd);
        System.out.println("uid:" + user.getuId());
        if (user.getuId() >= 1) {//登录成功
            request.getSession().setAttribute("user", user);
            AffairsService affairsService=new AffairsService();
            List<Affair>affairList=affairsService.affairsList();
            request.getSession().setAttribute("affairList",affairList);
            //重定向到 index.jsp
            if(user.getuType()==1){
                request.setAttribute("left", "left_stu.jsp");
            }else {
                request.setAttribute("left", "left_admin.jsp");
            }
            request.getRequestDispatcher("index.jsp").forward(request,response);
        } else if (user.getuId() == 0) {//密码错误
            request.setAttribute("msg","密码错误");
        } else {//查无此人
            request.setAttribute("msg","不是班级成员");
        }
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }
}
