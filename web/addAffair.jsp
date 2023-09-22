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
</head>

<body>
<%
    Sort sort = new Sort();
    List<Sort> list = (ArrayList<Sort>) request
            .getAttribute("sortList");
%>

<br>
<div align="center">
    班级事务发布
    <p>
    <form method="post" action="AffairsAdd" style="">
        <font size="2">事务标题：</font>&nbsp;
        <input type="text" size="60" name="title">
        &nbsp;
        <font size="2">&#26639;&#30446;&#65306;</font>&nbsp;
        <select name="sort">
            <%
                int num = list.size();
                for (int i = 0; i < num; i++) {
                    sort = (Sort) list.get(i);
            %>

            <option value=<%=String.valueOf(sort.getSortId())%>>
                <%=sort.getSortName()%></option>

            <%
                }
            %>

        </select>
        <p>
            <textarea cols="80" rows="15" name="content"></textarea>
            <br>
            &nbsp; &nbsp; &nbsp;
            <br>
            <input type="submit" value="事务发布" name="add">
        </p>
    </form>
</div>
</body>
</html>

