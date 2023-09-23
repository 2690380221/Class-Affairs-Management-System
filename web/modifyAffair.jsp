<%@ page import="com.ks.bean.Sort" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ks.bean.Affair" %>
<%@ page import="com.ks.service.AffairsService" %>
<%@ page import="com.ks.service.SortService" %><%--
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
    <link href="css/layui.css" rel="stylesheet">
    <script src="layui.js"></script>
</head>

<body>
<%
    Sort sort = new Sort();
    List<Sort> list = (ArrayList<Sort>) request.getSession()
            .getAttribute("sortList");
    int affairId= Integer.parseInt(request.getParameter("affairId"));
    Affair affair=new AffairsService().getAffair(affairId);
    request.getSession().setAttribute("affairId",affairId);
%>
<br>

<div align="center">
    班级事务发布
    <p>
    <form  class="layui-form" method="get" action="modifyAffairController" style="">
<%--        <div name="affairId" value=<%=affairId%>></div>--%>
        <div class="layui-form-item" style="width: 30%">
            <label class="layui-form-label">事务标题：</label>
            <div class="layui-input-block">
                <input type="text" name="title" required lay-verify="" value=<%=affair.getTitle()%> autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item" style="width: 30%">
            <label class="layui-form-label">事 务 类 型:</label>
            <div class="layui-input-block" >
                <select name="sort" lay-verify="required">
                    <option value=<%=affair.getSortId()%>><%=new SortService().getNameById(affair.getSortId())%></option>
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

            <div class="layui-input-block">
                <textarea id="demo" style="display: none;" name="content"><%=affair.getContent()%></textarea>        </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">提交修改</button>

            </div>
        </div>


    </form>
</div>


</body>
<script>
    layui.use('layedit', function(){
        var layedit = layui.layedit;
        layedit.build('demo'); //建立编辑器
    });
    var msg = '<%=request.getAttribute("message")%>';
    if(msg!="null"){
        // alert(msg);
        layer.msg(msg);
        msg=null;
    }

</script>

</html>

