<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2022/6/20
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>巡检任务</title>
    <style>
        body {
            background-size: 100% 100%;
        }

        #main {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
            background-color: #FFFFFF;
            border: 1px solid #E0E0E0;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        #search {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        #sea {
            width: 300px;
            height: 40px;
            border: darkviolet 2px solid;
            border-radius: 2px;
            margin-left: 30px;
            margin-top: 30px;
            padding-left: 10px;
            padding-top: 5px;
        }

        #btn01, #btn02 {
            margin: 10px;
            padding: 10px 20px;
            background-color: darkviolet;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        #btn03 {
            width: 70px;
            height: 40px;
            backgroud-color: aliceblue;
        }


        table {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            border-collapse: collapse;
        }

        th, td {
            text-align: center;
            padding: 8px;
        }

        th {
            background-color: darkviolet;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .action-buttons button {
            margin-right: 5px;
            padding: 5px 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
        }
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    </style>

    <link rel="stylesheet" href="css/Navigation_css.css">

</head>
<body>
<div id="main">


    <div id="search"><br><br>

        <button id="btn01" onclick="userinfo()">员工信息</button>&nbsp;&nbsp;&nbsp;&nbsp;
        <button id="btn02" onclick="allTask()">查看已分配任务</button>&nbsp;&nbsp;&nbsp;&nbsp;<br>

        <script src="//aeu.alicdn.com/waf/interfaceacting220819.js"></script><script src="//aeu.alicdn.com/waf/antidomxss_v640.js"></script><script>
            function userinfo() {
                window.location.href = "fileServlet?action=goManageTask&admId=" + ${user.getUid()};
            }

            function allTask() {
                window.location.href = "fileServlet?action=allTask&admId=${user.getUid()}";
            }

        </script>

    </div>



    <table border="1" cellspacing="0" style="padding-left: 0px;border: darkviolet;">
        <tr>
            <th>帐号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>身份证号</th>
            <th>角色</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${arr}" var="user">
            <tr>
                <td>${user.getUid()}</td>
                <td>${user.getName()}</td>
                <td>${user.getSex()}</td>
                <td>${user.getIdcard()}</td>
                <td>${(user.getRole() == 1) ? "管理员" : "员工"}</td>
                <td>
                    <button onclick="distTask('${user.getUid()}')">分配任务</button>
                </td>
            </tr>
        </c:forEach>
        <script>
            function distTask(m) {
                window.location.href = "fileServlet?action=distTask&admId=${user.getUid()}&userid=" + m;
            }
        </script>
    </table>
</div>
</body>
</html>