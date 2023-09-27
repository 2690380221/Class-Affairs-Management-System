<%@ page import="com.ks.bean.User" %>
<%@ page import="com.ks.service.UserService" %><%--
  Created by IntelliJ IDEA.
  User: 26903
  Date: 2023/9/27
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link href="layui/css/layui.css" rel="stylesheet">
    <script src="layui/layui.js"></script>
</head>
<body>

<%
    User user= (User) request.getSession().getAttribute("user");
%>

<style>
    .demo-login-container{width: 320px; margin: 21px auto 0;}
</style>
<div align="center">
    <form class="layui-form" style="align: center ;margin-top: 15%; border-width: 1px"  method="get" action="changePwdController">
        <p style="font-size: 20px">修改成员信息</p>
        <div class="demo-login-container">

            <div class="layui-form-item">
                <div class="layui-input-wrap">
                    <div class="layui-input-prefix">
                        <i class="layui-icon layui-icon-username"></i>
                    </div>
                    <input type="text" name="username" value=<%=user.getuName()%> lay-verify="required" autocomplete="off" class="layui-input" lay-affix="clear" >
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-wrap">
                    <div class="layui-input-prefix">
                        <i class="layui-icon layui-icon-password"></i>
                    </div>
                    <input type="text" name="password_old"  lay-verify="required"  autocomplete="off" class="layui-input" placeholder="请输入旧密码" lay-affix="eye">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-wrap">
                    <div class="layui-input-prefix">
                        <i class="layui-icon layui-icon-password"></i>
                    </div>
                    <input type="text" name="password_new"  lay-verify="required"  autocomplete="off" placeholder="请输入新密码" class="layui-input" lay-affix="eye">
                </div>
            </div>


            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="demo-login">提交修改</button>
            </div>
        </div>
    </form>
</div>


<script type="text/javascript">
    var msg="${requestScope.msg}";
    if(msg!=""){
        layer.msg(msg);
    }
</script>
</body>
</html>
