<%@ page import="com.ks.bean.Sort" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 26903
  Date: 2023/9/19
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加事务</title>
</head>
<body>
<%Sort sort=new Sort();
      List<Sort> list =(ArrayList<Sort >)request.getAttribute("sortList");
    %>
    <br><div align="center'">班级事务发布
        <form method ="post" action ="AddAffairsController" style ="">
        <font size="2">事务标题：</font>&nbsp;
        <input type ="text" size ="60" name="title">&nbsp;
        <font size="2">栏目：</font>&nbsp;
        <select name =sort">
        <%
            int num=list.size();
            for (int i=0;i<num;i++){
            sort =(Sort)list.get(i);
        %>
        <option value =<%String.valueOf(sort.getSortId())%>>
            <%=sort.getSortName()%></option>
        <%         }%>
        </select>
        <p>
            <textarea cols ="80"rows ="15"name =content"></textarea>
            <br><input type="submit'"value="事务发布"name="fabu">
        </p>
        </form>
    </div>
</body>
</html>
