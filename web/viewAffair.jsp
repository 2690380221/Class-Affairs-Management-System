<%@ page import="com.ks.bean.Affair" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ks.bean.Comment" %>
<%@ page import="com.ks.service.LoginService" %><%--
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
    <style>
        .container {
            border: 2px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            margin-left: 10%;
            margin-right: 10%;
        }
    </style>
</head>
<body>
<%
    Affair affair = (Affair) request.getAttribute("affair");
    String sortName = (String) request.getAttribute("sortName");
    List<Comment> commentList = (ArrayList<Comment>) request
            .getAttribute("commentList");
    LoginService loginService=new LoginService();

%>

<table border="0px" cellspacing="0" cellpadding="10" align="center"
       width="70%" border="0">

    <tr bgcolor="#77A2E9">
        <td nowrap="nowrap">

            <center>
                <h3>
                    事务标题：<%=affair.getTitle()%>
                </h3>
            </center>
        </td>
    </tr>

    <tr>
        <td>
            <br>
            <center>
                所属类别：<%=sortName%>&nbsp;&nbsp;&nbsp;发布日期：<%=affair.getBfTime()%>
            </center>
        </td>
    </tr>

    <tr>
        <td>
            <hr width="100%">
            <br>
            <%=affair.getContent()%>
        </td>
    </tr>

</table>

<br><br><br><br>

<div style="" class="container" >
    <hr style="align: center;">
    <font size="4" color="#ff0000">读者评论</font>
    <%
        if (commentList.size() > 0) {
            for (int i = 0; i < commentList.size(); i++) {
                Comment comment = (Comment) commentList.get(i);
    %>

    <hr align="left" width="80%">
    <font size="2" color="0000ff"><%= loginService.getNameById(comment.getUserId()) %> 评论
    </font>
    <p></p>
    <font size="3"><%=comment.getContent() %>
    </font>
    <%
            }
        }
    %>
    <hr align="left" width="80%">
    <form method="post" action="addCommentController?affairId=<%=affair.getAffairId()%>&sortName=<%=sortName %>">
        <div class="layui-form-item layui-form-text" style="margin-top: 20px">
            <label class="layui-form-label"  style="margin-left: 20%">发表评论:</label>
            <div class="layui-input-block" >
                <textarea cols="60" rows="10" name="content" required placeholder="发表你的看法"></textarea>
            </div>
        </div>

        <div class="layui-form-item" style="margin-top: 10px;margin-left: 45%">
            <button class="layui-btn" lay-submit lay-filter="demo2">发表</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>


    </form>

</div>


<script type="text/javascript">
    var msg="${requestScope.msg}";
    if(msg!=""){
        layer.msg(msg);
    }
</script>
</body>
</html>