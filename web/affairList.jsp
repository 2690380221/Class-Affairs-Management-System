<%@ page import="com.ks.bean.Affair" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  登录后的主界面，包括左边的导航栏和右边的业务处理块
  Created by IntelliJ IDEA.
  User: 26903
  Date: 2023/9/16
  Time: 12:05
  To change this mplate use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/layui.css" rel="stylesheet">
    <script src="layui.js"></script>
    <title>Insert title here</title>
</head>

<body>
<br>
<%
    String sortName = (String) request.getAttribute("sortName");
    if(sortName==null)sortName="事务列表";
    List<Affair> list = (ArrayList<Affair>)request.getSession().getAttribute("affairList");
%>
<h1 align="center"><%=sortName%></h1>

<table border="1px" cellspacing="0" cellpadding="10" align="center"
       width="90%">
    <tr bgcolor="#77A2E9">
        <td width="10%">
            <div align="center">
                事务编号
            </div>
        </td>
        <td width="55%">
            <div align="center">
                事务标题
            </div>
        </td>
        <td width="20%">
            <div align="center">
                发布时间
            </div>
        </td>
        <td width="15%">
            <div align="center">
                内容
            </div>
        </td>
    </tr>
    <%
        for (int i = 0; i < list.size(); i++) {
            Affair affair = (Affair) list.get(i);
            int num = i;
            num++;
    %>
    <tr>
        <td>
            <div align="center">
                <%=num%></div>
        </td>
        <td><%=affair.getTitle()%>
        </td>
        <td>
            <div align="center">
                <%=affair.getBfTime()%></div>
        </td>
        <td>
            <div align="center">
                <i class="layui-icon layui-icon-note" style="font-size: 20px; color: #1E9FFF;"></i>
                [
                <a href="viewAffairController?affairId=<%=affair.getAffairId()%>" onclick="setSessionData(this)">详细</a>]
            </div>
        </td>
    </tr>
    <%
        }
    %>

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
