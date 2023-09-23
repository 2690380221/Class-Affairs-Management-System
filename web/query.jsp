<%--
  登录后的主界面，包括左边的导航栏和右边的业务处理块
  Created by IntelliJ IDEA.
  User: 26903
  Date: 2023/9/16
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><meta charset="utf-8">
    <title>Inset title here</title>
    <link href="//unpkg.com/layui@2.7.6/dist/css/layui.css" rel="stylesheet">
    <script src="//unpkg.com/layui@2.7.6/dist/layui.js"></script>
</head>

<body>
<br>
<%--<div text-align="center">--%>
<%--    <h3>--%>
<%--        班级事务查询--%>
<%--    </h3>--%>
<%--    <br>--%>
<%--    <form method="post" action="queryController" style="">--%>
<%--        <p></p>--%>
<%--        请输入查询关键字：--%>
<%--        <input type="text" size="40" name="keyTitle">--%>
<%--        <p></p>--%>
<%--        <input type="submit" value="查询">--%>

<%--    </form>--%>
<%--</div>--%>

<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">关键字查询</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="请输入关键字" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
        <label class="layui-form-label">时间查询</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" id="test1" >
        </div>
    </div>
    <br>
    <div class="layui-form-item">
        <label class="layui-form-label">事务类别号</label>
        <div class="layui-input-block">
            <select name="city" lay-verify="required">
                <option value=""></option>
                <option value="0">全部事务</option>
                <option value="1">学习竞赛</option>
                <option value="2">文体活动</option>
                <option value="3">社会事务</option>
                <option value="4">各类补助</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>



</body>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
<script src="/static/build/layui.js"></script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#test1' //指定元素
        });
    });
</script>
</html>
