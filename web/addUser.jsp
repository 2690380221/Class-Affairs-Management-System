<%--
  Created by IntelliJ IDEA.
  User: 26903
  Date: 2023/9/26
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加班级成员</title>
    <link href="layui/css/layui.css" rel="stylesheet">
    <script src="layui/layui.js"></script>
</head>
<body>
<style>
    .demo-login-container{width: 320px; margin: 21px auto 0;}
</style>
<div align="center">
    <form class="layui-form" style="align: center ;margin-top: 15%; border-width: 1px" action="addUserController">
    <p style="font-size: 20px">添加班级成员</p>
        <div class="demo-login-container">
            <div class="layui-form-item">
                <div class="layui-input-wrap">
                    <div class="layui-input-prefix">
                        <i class="layui-icon layui-icon-username"></i>
                    </div>
                    <input type="text" name="username" value="" lay-verify="required" placeholder="用户名" lay-reqtext="请填写用户名" autocomplete="off" class="layui-input" lay-affix="clear">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-wrap">
                    <div class="layui-input-prefix">
                        <i class="layui-icon layui-icon-password"></i>
                    </div>
                    <input type="password" name="password" value="" lay-verify="required" placeholder="密   码" lay-reqtext="请填写密码" autocomplete="off" class="layui-input" lay-affix="eye">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">管理员</label>
                <div class="layui-input-block">
                    <input type="radio" name="type" value=1 title="否" checked>
                    <input type="radio" name="type" value=0 title="是">
                </div>
            </div>

            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="demo-login">添加</button>
            </div>
        </div>
    </form>
</div>


<script type="text/javascript">
    var msg="${requestScope.message}";
    if(msg!=""){
        layer.msg(msg);
    }
</script>



</body>
</html>
