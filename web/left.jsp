<%--
  Created by IntelliJ IDEA.
  User: 26903
  Date: 2023/9/22
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Make a choice please</title>
    <link href="//unpkg.com/layui@2.7.6/dist/css/layui.css" rel="stylesheet">
    <script src="//unpkg.com/layui@2.7.6/dist/layui.js"></script>
    <style type="text/css">
        <!--
        .STYLE1 {font-family: "宋体"}
        -->

    </style>

</head>
<body>
<table width="169" height="300" border="1">
    <tr>
        <td height="30"><div align="center" ><a href="sortController" target="mainFrame" onclick="setSessionData(this)"
        >班级事务发布</a></div></td>
    </tr>
    <tr>
        <td height="30"><div align="center"><a href="maintainAffairsController" target="mainFrame" onclick="setSessionData(this)">班级事务维护</a></div></td>
    </tr>
    <tr>
        <td height="100">班级事务浏览
            <p text-align="center" class="STYLE1"><a href="sortedAffairsController?sortId=0" target="mainFrame" onclick="setSessionData(this)">全 部 事 务</a></p>
            <p text-align="center" class="STYLE1"><a href="sortedAffairsController?sortId=1" target="mainFrame" onclick="setSessionData(this)">学 习 竞 赛</a></p>
            <p text-align="center" class="STYLE1"><a href="sortedAffairsController?sortId=2" target="mainFrame" onclick="setSessionData(this)">文 体 活 动</a></p>
            <p text-align="center" class="STYLE1"><a href="sortedAffairsController?sortId=3" target="mainFrame" onclick="setSessionData(this)">社 会 事 务</a></p>
            <p text-align="center" class="STYLE1"><a href="sortedAffairsController?sortId=4" target="mainFrame" onclick="setSessionData(this)">各 类 补 助</a></p></td>
    </tr>
    <tr>
        <td height="30"><div align="center"><a href="query.jsp" target="mainFrame" onclick="setSessionData(this)">班级事务查询</a></div></td>
    </tr>
</table>
</body>
<script type="text/javascript">
    function setSessionData(element) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "setUrl?url="+element.getAttribute("href"), true);
        xhr.send();
    }
</script>
</html>
