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
    <link href="layui/css/layui.css" rel="stylesheet">
    <script src="layui/layui.js"></script>
    <style>
        /* 设置页面高度为100vh，垂直居中显示 */
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* 创建中央边框样式 */
        .container {
            border: 2px solid #ccc;
            padding: 20px;
            border-radius: 5px;
        }
        .layui-form-item {
            margin-top: 30px;
        }
    </style>
</head>

<body>
<script type="text/javascript">
    var msg="${requestScope.message}";
    if(msg!=""){
        layer.msg(msg);
    }
</script>
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

<div class="container" style="height: 350px;width: 500px">

    <form class="layui-form" method="post" action="queryController"  style="margin-top: 50px">
        <div class="layui-form-item">
            <label class="layui-form-label">关键字查询</label>
            <div class="layui-input-block">
                <input type="text" name="title" lay-verify=""  required placeholder="请输入关键字" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">时间查询</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"  id="test1" name="time">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">事务类别号</label>
            <div class="layui-input-block">
                <select  name="sort" lay-verify="required" >
                    <option value=""></option>
                    <option value="0">全部事务</option>
                    <option value="1">学习竞赛</option>
                    <option value="2">文体活动</option>
                    <option value="3">社会事务</option>
                    <option value="4">各类补助</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 40px">
            <div class="layui-input-block" style="margin-left: 180px">
                <button class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

</div>



</body>
<%--<script>--%>
<%--    //Demo--%>
<%--    layui.use('form', function(){--%>
<%--        var form = layui.form;--%>

<%--        //提交--%>
<%--        form.on('submit(formDemo)', function(data){--%>
<%--            // layer.msg(JSON.stringify(data.field));--%>
<%--            return false;--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
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
