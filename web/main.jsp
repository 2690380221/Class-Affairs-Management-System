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
<head>
    <title>主页</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- cdn引入ElementUI组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>

<body>
<div id="app">
    <el-row>
        <!-- 左侧功能选择栏 -->
        <el-col :span="6">
            <el-menu @select="handleSelect" default-active="1">
                <el-menu-item index="1">功能一</el-menu-item>
                <el-menu-item index="2">功能二</el-menu-item>
                <el-menu-item index="3">功能三</el-menu-item>
            </el-menu>
        </el-col>
        <!-- 右侧内容区域 -->
        <el-col :span="18">
            <router-view></router-view>
        </el-col>
    </el-row>

</div>
</body>

<script type="text/javascript">
    const app = new Vue({
        el: '#app',
        data: {
            // 存储当前选中的功能
            currentFunction: ''
        },
        methods: {
            // 处理功能选择事件
            handleSelect(index) {
                // 根据选中的功能切换路由
                switch (index) {
                    case '1':
                        this.currentFunction = '功能一';
                        this.$router.push('/function1');
                        break;
                    case '2':
                        this.currentFunction = '功能二';
                        this.$router.push('/function2');
                        break;
                    case '3':
                        this.currentFunction = '功能三';
                        this.$router.push('/function3');
                        break;
                }
            }
        }
    });

    // 创建Vue Router实例
    const router = new VueRouter({
        routes: [
            { path: '/function1', component: { template: '<div>这是功能一的页面</div>' } },
            { path: '/function2', component: { template: '<div>这是功能二的页面</div>' } },
            { path: '/function3', component: { template: '<div>这是功能三的页面</div>' } },
        ]
    });

    // 将Vue Router与Vue实例关联
    app.$router = router;

    // 启动Vue应用
    new Vue({
        router,
        render: h => h(app)
    }).$mount('#app');
</script>

</html>
