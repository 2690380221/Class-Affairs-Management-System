<%@ page import="com.ks.bean.Affair" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ks.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: 26903
  Date: 2023/9/25
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert title here</title>
    <link href="layui/css/layui.css" rel="stylesheet">
    <script src="layui/layui.js"></script>
</head>

<body><br>
<%
    String sortName = (String) request.getAttribute("sortName");
    List<User> list = (List<User>) request
            .getAttribute("userList");
%>
<h1 align="center">管理员维护</h1>

<table border="1px" cellspacing="0" cellpadding="10" align="center"  action="deleteAffairController" width="90%">
    <tr bgcolor="#77A2E9">
        <td width="10%">
            <div align="center">
                用户编号
            </div>
        </td>

        <td width="20%">
            <div align="center">
                用户名
            </div>
        </td>

        <td width="20%">
            <div align="center">
                密码
            </div>
        </td>

        <td width="13%">
            <div align="center">
                修改密码
            </div>
        </td>
        <td width="13%">
            <div align="center">
                删除
            </div>
        </td>
    </tr>
    <%
        for (int i = 0; i < list.size(); i++) {
            User user = (User) list.get(i);
            int num = i;
            num++;
    %>
    <tr>
        <td>
            <div align="center">
                <%=num%></div>
        </td>

        </td>
        <td>
            <div align="center">
                <%=user.getuName()%></div>
        </td>
        <td>
            <div align="center">
                <%=user.getuPwd()%></div>
        </td>
        <td>
            <div align="center">
                <i class="layui-icon layui-icon-edit" style="font-size: 20px; color: #1E9FFF;"></i>
                [
                <a href="changePwd.jsp?uId=<%=user.getuId()%>" >修改密码</a>]
            </div>
        </td>
        <%
        if(user.getuType()!=0){
        %>
        <td>
            <div align="center">
                <i class="layui-icon layui-icon-delete" style="font-size: 20px; color: #1E9FFF;"></i>
                [
                <a onclick="return window.confirm('该成员及其所有评论将全部被删除，确认删除吗？');"
                   href="deleteUserController?uId=<%=user.getuId()%>" >删除</a>]
            </div>
        </td>

    <%
        }else {
    %>
        <td>
            <div align="center" >
               不可删除管理员
            </div>
        </td>
    <%
        }
        }
    %>
    </tr>
</table>
<div class="layui-btn-container" align="right" style="padding-top: 30px;">
    <button type="button" class="layui-btn layui-btn-normal layui-btn-radius" style="margin-right: 10%" onclick="addUser()">添加成员</button>
</div>
<script type="text/javascript">
    var msg="${requestScope.message}";
    if(msg!=""){
        layer.msg(msg);
    }
</script>
<script type="text/javascript">
    function setSessionData(element) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "setUrl?url="+element.getAttribute("href"), true);
        xhr.send();
    }
    function addUser(){
        window.location.href='addUser.jsp'
    }
</script>
</body>

</html>
