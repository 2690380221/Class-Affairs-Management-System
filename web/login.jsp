<%--
  Created by IntelliJ IDEA.
  User: 26903
  Date: 2023/9/15
  Time: 13:48
  To change this template use File | Settings | File  Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/vue-resource/1.5.3/vue-resource.min.js"></script>
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
                    <span id="msg"> ${msg} </span> <br>
                </el-form>


            </el-card>
        </el-main>
    </el-container>
</div>


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
                this.$http.get('http://localhost:8080/un/loginController', {
                    params: {
                        username: this.loginForm.username,
                        password: this.loginForm.password
                    }
                })
                    .then(response => {
                        if (response.data && response.data.redirect) {
                            // 根据后端返回的重定向URL来跳转
                            window.location.href = response.data.redirect;
                        } else {
                            // 处理其他响应或错误
                            window.location.reload();
                        }
                    })
                    .catch(error => {
                        // 处理请求错误
                        console.error('请求错误:', error);
                    });
            }
        }
    })
</script>

</body>

</html>
