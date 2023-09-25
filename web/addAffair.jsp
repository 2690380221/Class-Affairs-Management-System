<%@ page import="com.ks.bean.Sort" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  登录后的主界面，包括左边的导航栏和右边的业务处理块
  Created by IntelliJ IDEA.
  User: 26903
  Date: 2023/9/16
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>事务发布</title>
    <link href="layui/css/layui.css" rel="stylesheet">
    <script src="layui/layui.js"></script>
</head>

<body>
<%
    Sort sort = new Sort();
    List<Sort> list = (ArrayList<Sort>) request.getSession()
            .getAttribute("sortList");

%>


<br>

<div align="center">
    班级事务发布
    <p>
    <form  class="layui-form" method="post" action="addAffairsController" style="">

    <div class="layui-form-item" style="width: 30%">
        <label class="layui-form-label">事务标题：</label>
        <div class="layui-input-block">
            <input type="text" name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item" style="width: 30%">
        <label class="layui-form-label">事 务 类 型:</label>
        <div class="layui-input-block" >
            <select name="sort" lay-verify="required">
                <option value="">请选择一个事务类型</option>
                <%
                    int num = list.size();
                    for (int i = 0; i < num; i++) {
                        sort = (Sort) list.get(i);
                %>
                <option value="<%= sort.getSortId() %>">
                    <%= sort.getSortName() %>
                </option>
                <%
                    }
                %>
            </select>
        </div>
    </div>


    <div class="layui-form-item" style="width: 60%">

        <hr class="ws-space-16">
        <textarea name="content" placeholder="主体内容" class="layui-textarea" style="width: 60%;box-shadow: 1px 1px 1px 1px  #999;height: 40%"></textarea>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
<script>
    layui.use('layedit', function(){
        var layedit = layui.layedit;
        layedit.build('demo'); //建立编辑器
    });
    <%--var msg = '<%=request.getAttribute("message")%>';--%>
    <%--if(msg!="null"){--%>
    <%--    // alert(msg);--%>
    <%--    layer.msg(msg);--%>
    <%--    msg=null;--%>
    <%--}--%>

</script>

</html>

