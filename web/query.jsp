<%--
  Created by IntelliJ IDEA.
  User: 26903
  Date: 2023/9/16
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/vue-resource/1.5.3/vue-resource.min.js"></script>
<html>
<head>
    <title>查询</title>

</head>
<body>

<div id="app">
    <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="关键字">
            <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="类型">
            <el-select v-model="form.kind" placeholder="请选择活动区域">
                <el-option label="区域一" value="shanghai"></el-option>
                <el-option label="区域二" value="beijing"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="时间">
            <el-col :span="11">
                <el-date-picker type="date" placeholder="选择日期" v-model="form.date1"
                                style="width: 100%;"></el-date-picker>
            </el-col>
            <el-col class="line" :span="2">-</el-col>
            <el-col :span="11">
                <el-time-picker placeholder="选择时间" v-model="form.date2" style="width: 100%;"></el-time-picker>
            </el-col>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="onSubmit">查询</el-button>
            <el-button>取消</el-button>
        </el-form-item>
    </el-form>
</div>

<script type="text/javascript">
    const app = new Vue({
        el: '#app',
        data:{
                form: {
                    name: '',
                    kind: '',
                    date1: '',
                    date2: ''
                }
        },
        methods: {
            onSubmit() {
                this.$http.get('http://localhost:8080/un/queryController', {
                    params: {
                        name: this.form.name,
                        kind: this.form.kind
                    }
                })
                    .then(response => {
                        // 处理响应，您可以根据需要进行处理
                        console.log('响应数据:', response.data);
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
