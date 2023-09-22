<%@ page import="com.ks.bean.Affair" %>
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
  <title>Insert title here</title>
</head>

<body><br>
<%
  String sortName = (String) request.getAttribute("sortName");
  List<Affair> list = (ArrayList<Affair>) request
          .getAttribute("affairList");
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
    <td width="44%">
      <div align="center">
        事务标题
      </div>
    </td>
    <td width="20%">
      <div align="center">
        发布时间
      </div>
    </td>
    <td width="13%">
      <div align="center">
        编辑
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
        <img src="pic/modify.gif" width="18" height="18" />
        [
        <a href="AffairsModify?affairId=<%=affair.getAffairId()%>">编辑</a>]
      </div>
    </td>
    <td>
      <div align="center">
        <img src="pic/delete.gif" width="18" height="18" />
        [
        <a onclick="return window.confirm('对这条事务的评论也将全部被删除，确认删除吗？');"
           href="AffairsDelete?affairId=<%=affair.getAffairId()%>&sortId=<%=affair.getSortId()%>">删除</a>]
      </div>
    </td>
  </tr>
  <%
    }
  %>

</table></body>

</html>
