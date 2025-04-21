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
    <title>全部任务</title>
    <style>
        body {
            background-size: 100% 100%;
            font-family: Arial, sans-serif;
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

        #btn01:hover, #btn02:hover {
            background-color: lightgray;
        }

        table {
            margin: auto;
            border-collapse: collapse;
            width: 100%;
        }

        th {
            background-color: darkviolet;
            color: white;
            height: 40px;
            font-size: 18px;
            text-align: left;
            padding: 8px;
        }

        td {
            height: 40px;
            font-size: 16px;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: lightgray;
        }
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    </style>

    <link rel="stylesheet" href="css/Navigation_css.css">

</head>
<body>
<div id="main">

    <div id="search"><br><br>
        <button id="btn01" onclick="userinfo()">员工信息</button>&nbsp;&nbsp;&nbsp;&nbsp;
        <button id="btn02" onclick="allTask()">查看已分配任务</button>&nbsp;&nbsp;&nbsp;&nbsp;<br><br><br><br>

        <script>
            function userinfo() {
                window.location.href = "fileServlet?action=goManageTask&admId=" +${user.getUid()};
            }

            function allTask() {
                window.location.href = "fileServlet?action=allTask&admId=${user.getUid()}";
            }

        </script>

    </div>

    <br><br>


    <table border="1">
        <tr>
            <th>任务ID</th>
            <th>用户ID</th>
            <th>用户姓名</th>
            <th>截至时间</th>
            <th>任务描述</th>
            <th>是否已读</th>
            <th>是否已完成</th>
        </tr>

        <c:forEach items="${taskArr}" var="task">
            <tr>
                <td>${task.getTaskId()}</td>
                <td>${task.getTaskUserId()}</td>
                <td>${task.getTaskUserName()}</td>
                <td>${task.getDeadline()}</td>
                <td>${task.getTask()}</td>
                <td>${task.isRead() ? "已读" : "未读"}</td>
                <td>${task.isCompleted() ? "已确认" : "未确认"}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
