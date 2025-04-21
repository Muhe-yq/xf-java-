<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title></title>
    <!-- 引入字体图标 -->
    <link href="https://cdn.bootcdn.net/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/Navigation_css.css">
    <style>
        * {
            /* 初始化 取消内外边距 */
            margin: 0;
            padding: 0;
        }

        body {
            /* 溢出隐藏 */
            overflow: hidden;
        }

        .navbar {
            /* 相对定位 */
            position: relative;
            /* 100%窗口宽度 */
            width: 100vw;
            display: flex;
        }

        #checkbox {
            /* 隐藏复选框 */
            display: none;
        }

        .navbar label {
            position: absolute;
            top: 0;
            left: 70px;
            width: 100%;
            height: 43px;
            font-size: 30px;
            color: #5a738e;
            background-color: #ededed;
            padding-left: 20px;
            border: 1px solid #d9dee4;
            cursor: pointer;
            /* 加个动画过渡 */
            transition: all 0.5s;
        }

        .navbar ul {
            list-style: none;
            width: 70px;
            /* 100%窗口高度 */
            height: 100vh;
            background-color: #2a3f54;
            transition: all 0.5s;
            /* 再加个溢出隐藏 */
            overflow: hidden;
        }

        .navbar ul li {
            height: 70px;
            margin-bottom: 10px;
        }

        .navbar ul li:first-child {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 10px;
        }

        .navbar ul li:first-child img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }

        .navbar ul li:first-child span {
            color: #fff;
            /* 文字禁止换行 */
            white-space: nowrap;
            padding-left: 10px;
            /* 先把文字隐藏 */
            display: none;
        }

        .navbar ul li a {
            display: flex;
            justify-content: center;
            align-items: center;
            /* 垂直排列 */
            flex-direction: column;
            width: 100%;
            height: 100%;
            color: #d1d1d1;
            /* 去掉下划线 */
            text-decoration: none;
        }

        .navbar ul li a i {
            font-size: 25px;
            margin-bottom: 10px;
        }

        .navbar ul li a span {
            font-size: 12px;
            white-space: nowrap;
        }

        .navbar ul li a:hover {
            color: #fff;
            background-color: #35495d;
        }

        /* :checked选择器是判断复选框是否被选中 */
        /* +是相邻兄弟选择器，找到input的下一个兄弟label */
        .navbar input:checked + label {
            left: 200px;
        }

        /* ~也是兄弟选择器，但它可以找到隔了几代的兄弟 */
        .navbar input:checked ~ ul {
            width: 200px;
        }

        .navbar input:checked ~ ul li:first-child {
            /* 将居中改为开头对齐 */
            justify-content: flex-start;
        }

        .navbar input:checked ~ ul li:first-child span {
            /* 文字显示 */
            display: block;
        }

        .navbar input:checked ~ ul li a {
            flex-direction: row;
            justify-content: flex-start;
        }

        .navbar input:checked ~ ul li a i {
            font-size: 18px;
            margin: 0 15px 0 30px;
        }

        .navbar input:checked ~ ul li a span {
            font-size: 14px;
        }
    </style>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>

<body>
<div class="navbar">
    <input type="checkbox" id="checkbox">
    <label for="checkbox">
        <i class="fa fa-bars" aria-hidden="true"></i>
    </label>
    <ul>
        <li>
            <img src="images/1.png" alt="">
            <span>欢迎您! <script>
        const roleMap = {
            0: "用户",
            1: "管理员"
        };
        const role = ${user.getRole()};
        const roleName = roleMap[role];
        document.write(roleName);
    </script></span>
        </li>
        <li>
            <a href="javascript:void(0)" onclick="goHead()">
                <i class="fa fa-home" aria-hidden="true"></i>
                <span>首页</span>
            </a>
        </li>
        <li>
            <a href="javascript:void(0)" onclick="goDeviceManage()">
                <i class="fa fa-fire-extinguisher" aria-hidden="true"></i>
                <span>设备管理</span>
            </a>
        </li>
        <li>
            <a href="javascript:void(0)" onclick="kind()">
                <i class="fa fa-sitemap" aria-hidden="true"></i>
                <span>种类维护</span>
            </a>
        </li>
        <li>
            <a href="javascript:void(0)" onclick="goDeviceAdd()">
                <i class="fa fa-shopping-bag" aria-hidden="true"></i>
                <span>添加设备</span>
            </a>
        </li>
        <li>
            <a href="javascript:void(0)" onclick="goCheck()">
                <i class="fa fa-gears" aria-hidden="true"></i>
                <span>检查记录</span>
            </a>
        </li>
        <li>
            <a href="javascript:void(0)" onclick="goUserShow()">
                <i class="fa fa-user-circle" aria-hidden="true"></i>
                <span>用户管理</span>
            </a>
        </li>
        <li>
            <a href="javascript:void(0)" onclick="goCheckTask()">
                <i class="fa fa-tasks" aria-hidden="true"></i>
                <span>巡检任务</span>
            </a>
        </li>
        <li>
            <a href="javascript:void(0)" onclick="exitSystem()">
                <i class="fa fa-cog" aria-hidden="true"></i>
                <span>退出系统</span>
            </a>
        </li>
    </ul>
    <script>
        function goUserShow() {
            window.location.href = "fileServlet?action=goUserShow&admId=" +${user.getUid()};
        }

        function goDeviceManage() {
            window.location.href = "fileServlet?action=goDeviceManage&admId=" +${user.getUid()};
        }

        function goHead() {
            window.location.href = "fileServlet?action=goHead&admId=" +${user.getUid()};
        }

        function goDeviceAdd() {
            window.location.href = "fileServlet?action=goDeviceAdd&admId=" +${user.getUid()};
        }

        function goCheck() {
            window.location.href = "fileServlet?action=goCheck&admId=" +${user.getUid()};
        }

        function exitSystem() {
            const confirmed = confirm("是否确定退出？");
            if (confirmed) {
                window.location.href = "index.jsp";
            }
        }

        function kind() {

            window.location.href = "fileServlet?action=kind&admId=" +${user.getUid()};
        }

        function goCheckTask() {
            const role = ${user.getRole()};
            if(role==1){
                window.location.href = "fileServlet?action=goManageTask&admId=" +${user.getUid()};
            } else{
                window.location.href = "fileServlet?action=goUserTask&admId=" +${user.getUid()};
            }
        }
    </script>
    <jsp:include page="${mainRight==null? 'show.jsp':mainRight}"></jsp:include>
</div>
</body>
</html>