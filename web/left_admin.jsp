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
    <link href="layui/css/layui.css" rel="stylesheet">
    <script src="layui/layui.js"></script>


</head>
<body>


<ul style="height:100%;text-align: center" class="layui-nav layui-nav-tree" lay-filter="test" >
    <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
    <li  class="layui-nav-item"><a href="maintainAffairsController" target="mainFrame" onclick="setSessionData(this)">事务维护</a></li>
    <li  class="layui-nav-item"><a href="maintainUserController" target="mainFrame" onclick="setSessionData(this)">成员维护</a></li>
    <li  class="layui-nav-item"><a href="sortController" target="mainFrame" onclick="setSessionData(this)">事务发布</a></li>
    <li  class="layui-nav-item"><a href="query.jsp" target="mainFrame" onclick="setSessionData(this)">事务查询</a></li>
    <li  class="layui-nav-item layui-nav-itemed"><a href="javascript:;">事务浏览</a>
        <dl class="layui-nav-child">
            <dd  class="STYLE1"><a href="sortedAffairsController?sortId=0" target="mainFrame" onclick="setSessionData(this)">全 部 事 务</a></dd>
            <dd  class="STYLE1"><a href="sortedAffairsController?sortId=1" target="mainFrame" onclick="setSessionData(this)">学 习 竞 赛</a></dd>
            <dd  class="STYLE1"><a href="sortedAffairsController?sortId=2" target="mainFrame" onclick="setSessionData(this)">文 体 活 动</a></dd>
            <dd  class="STYLE1"><a href="sortedAffairsController?sortId=3" target="mainFrame" onclick="setSessionData(this)">社 会 事 务</a></dd>
            <dd  class="STYLE1"><a href="sortedAffairsController?sortId=4" target="mainFrame" onclick="setSessionData(this)">各 类 补 助</a></dd>
        </dl>
    </li>
</ul>





</body>
<script type="text/javascript">
    function setSessionData(element) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "setUrl?url="+element.getAttribute("href"), true);
        xhr.send();
    }
</script>
</html>
