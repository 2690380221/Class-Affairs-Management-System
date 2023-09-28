<%@ page import="com.ks.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: 26903
  Date: 2023/9/22
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="layui/css/layui.css" rel="stylesheet">
    <script src="layui/layui.js"></script>
    <title>Welcome to our hall!</title>
    <style>
        /* 设置页面高度为100vh，垂直居中显示 */
        body, html {
            height: 100%;
        }

        /* 使用 flex 布局实现垂直居中 */
        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100%;
        }
    </style>
</head>
<style type="text/css">
    <!--
    .STYLE2 {
        font-family: "宋体";
        font-size: 42px;
        font-weight: bold;
    }
    -->
</style>
<%
User user= (User) request.getSession().getAttribute("user");
%>

<body>
<ul class="layui-nav">
    <div style="margin-left: 80%">
        <li class="layui-nav-item" lay-unselect>
            <a href="login.jsp" target="_blank">
                <i class="layui-icon layui-icon-username" ></i>
                <span>退出登录</span>
            </a>
        </li>

        <li class="layui-nav-item">
            <a href="changeMyPwd.jsp" target="mainFrame">修改密码</a>
        </li>



    </div>

</ul>
</body>
</html>
