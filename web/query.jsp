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
<head><title>Insert title here</title></head>

<body>
<br>
<div align="center">
    <h3>
        班级事务查询
    </h3>
    <br>
    <form method="post" action="queryController" style="">
        <p></p>
        请输入查询关键字：
        <input type="text" size="40" name="keyTitle">
        <p></p>
        <input type="submit" value="查询">

    </form>
</div>
</body>

</html>
