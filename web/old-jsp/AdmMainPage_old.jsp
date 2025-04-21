<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2022/6/20
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
    <style>
        #rightNavigation{
            width: 19%;
            height: 570px;
        }
        #a,#b,#c,#d,#e,#f,#g{
            width: 150px;
            height: 35px;
            border: blueviolet 1px solid;
            border-radius: 2px;
            margin-top: 20px;
            margin-left: 30px;
            padding-left: 30px;
            padding-top: 5px;
        }
        #BigFrame{
            width: 19%;
            height: 570px;
            position: absolute;
            float: left;
        }
    </style>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>

<div id = "BigFrame">
    <div id="rightNavigation">
        <br><br><br>
        <button id="a" onclick="goHead()">首页</button>
        <button id="b" onclick="goDeviceManage()">设备管理</button>
        <button id="g" onclick="kind()">种类维护</button>
        <button id="c"  onclick="goDeviceAdd()">添加设备</button>
        <button id="d" onclick="goCheck()">检查记录</button>
        <button id="e" onclick="goUserShow()">用户管理</button>
        <button id="f" onclick="exitSystem()">退出系统</button>
    </div>

    <script>
        function goUserShow(){
            window.location.href = "fileServlet?action=goUserShow&admId="+${user.getUid()};
        }
        function goDeviceManage(){
            window.location.href = "fileServlet?action=goDeviceManage&admId="+${user.getUid()};
        }
        function goHead(){
            window.location.href = "fileServlet?action=goHead&admId="+${user.getUid()};
        }
        function goDeviceAdd(){
            window.location.href = "fileServlet?action=goDeviceAdd&admId="+${user.getUid()};
        }
        function goCheck(){
            window.location.href = "fileServlet?action=goCheck&admId="+${user.getUid()};
        }
        function exitSystem(){
            window.location.href = "fileServlet?action=exitSystem&admId="+${user.getUid()};
        }
        function kind(){
            window.location.href = "fileServlet?action=kind&admId="+${user.getUid()};
        }

    </script>
</div>
<jsp:include page="${mainRight==null? 'show.jsp':mainRight}"></jsp:include>
</body>
</html>
