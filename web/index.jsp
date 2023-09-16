<%--
  Created by IntelliJ IDEA.
  User: 26903
  Date: 2023/9/15
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>页面</title>
    <!-- cdn引入ElementUI样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

</head>


<body>
<div id="app">
    <el-container style="height: 100vh;">
        <el-main style="display: flex; justify-content: center; align-items: center;">
            <el-card style="width: 400px; border: 1px solid #ccc; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);">
                <el-form ref="loginForm" :model="loginForm" label-width="80px">
                    <el-form-item label="用户名">
                        <el-input v-model="loginForm.username"></el-input>
                    </el-form-item>
                    <el-form-item label="密码">
                        <el-input type="password" v-model="loginForm.password"></el-input>
                    </el-form-item>
                    <el-form-item label="验证码">
                        <!-- 添加验证码输入字段 -->
                        <el-input v-model="loginForm.captcha"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-col :span="24" style="text-align: center;">
                            <!-- 使用el-col布局来水平居中按钮 -->
                            <el-button type="primary" @click="login">登录</el-button>
                        </el-col>
                    </el-form-item>
                </el-form>
            </el-card>
        </el-main>
    </el-container>
</div>

<!--cdn引入ElementUI组件必须先引入Vue-->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!-- cdn引入ElementUI组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script type="text/javascript">
    const vm = new Vue({ // 配置对象 options
        // 配置选项(option)
        el: '#app',  // element: 指定用vue来管理页面中的哪个标签区域
        data: {
            loginForm: {
                username: '',
                password: ''
            }
        },
        methods: {
            login() {
                // 在这里编写登录逻辑，可以使用this.loginForm.username和this.loginForm.password获取用户名和密码
                // 发送请求，验证用户名和密码，跳转到登录后的页面或显示错误信息
                // 示例：假设登录成功后跳转到/welcome页面
                window.location.href = '/welcome'; // 请替换为您的实际登录成功后的页面
            }
        }
    })
</script>

</body>

</html>
