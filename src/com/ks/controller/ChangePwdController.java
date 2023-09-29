package com.ks.controller;

import com.ks.bean.Affair;
import com.ks.bean.User;
import com.ks.service.AffairsService;
import com.ks.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 点击页面左上角的修改密码后跳转到的 changeMyPwd.jsp 里点击修改后交付
 * 跳转到 changeMyPwd.jsp
 */
public class ChangePwdController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        User user = (User) req.getSession().getAttribute("user");
        String pwd_o = req.getParameter("password_old");
        String pwd_n = req.getParameter("password_new");
        int uId = user.getuId();
        UserService userService = new UserService();
        String pwd_now = userService.getPwdById(uId);
        if (!pwd_now.equals(pwd_o)) {
            req.setAttribute("msg", "旧密码输入错误");
            req.getRequestDispatcher("changeMyPwd.jsp").forward(req, resp);
        } else {
            user.setuPwd(pwd_n);
            if ( userService.updateUser(user)){
                req.setAttribute("msg", "修改成功");
                HttpSession session = req.getSession();
                session.invalidate();

                //修改session中保存的信息
                user.setuPwd(pwd_n);
                req.getSession().setAttribute("user", user);
                AffairsService affairsService=new AffairsService();
                List<Affair> affairList=affairsService.affairsList();
                req.getSession().setAttribute("affairList",affairList);
            }
            else{
                req.setAttribute("msg", "修改失败");
            }
            req.getRequestDispatcher("changeMyPwd.jsp").forward(req, resp);
        }

    }
}
