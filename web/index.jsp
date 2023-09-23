<%--
  Created by IntelliJ IDEA.
  User: 26903
  Date: 2023/9/22
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome to our hall!</title>
</head>
<%
    String url = (String) session.getAttribute("url");
    if(url==null)url="main.jsp";
%>
<frameset rows="60,*" cols="*" framespacing="2" frameborder="yes" border="2" bordercolor="#000066">
    <frame src="top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
    <frameset rows="200" cols="250,*" framespacing="2" frameborder="yes" border="2" bordercolor="#000066">
        <frame src="left.jsp" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
        <frame src = <%=url%> name="mainFrame" id="mainFrame" title="mainFrame" />
    </frameset>
</frameset>
<body>

</body>
</html>
