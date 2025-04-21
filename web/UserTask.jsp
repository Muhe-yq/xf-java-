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
    <title>Title</title>
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

        h1 {
             font-size: 42px;
             text-align: center;
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

        .action-buttons button {
            margin-right: 5px;
            padding: 5px 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .action-buttons button:hover {
            background-color: lightgray;
        }

        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    </style>
    <link rel="stylesheet" href="css/Navigation_css.css">

</head>
<body>
<div id="main">
    <br><br><br>
    <h1>我的任务</h1>
    <br><br><br>

    <table border="1">
        <tr>
            <th>序号</th>
            <th>截至日期</th>
            <th>任务描述</th>
            <th>是否已读</th>
            <th>是否已完成</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${TaskArr}" var="task" varStatus="loop">
            <tr>
                <td>${loop.index + 1}</td>
                <td>${task.getDeadline()}</td>
                <td>${task.getTask()}</td>
                <td>${(task.isRead())==true?"已读":"未读"}</td>
                <td>${(task.isCompleted())==true?"已确认":"未确认"}</td>
                <td class="action-buttons">
                    <button onclick="readTask('${task.getTaskId()}')">已读</button>
                    <button onclick="completeTask('${task.getTaskId()}')">确认</button>
                </td>
            </tr>
        </c:forEach>
        <script>
            function readTask(taskId) {
                const confirmed = confirm("是否确定标记为已完成？");
                if (confirmed) {
                    window.location.href = "fileServlet?action=readTask&admId=${user.getUid()}&taskId=" + taskId;
                    location.reload();
                }
            }

            function completeTask(taskId) {
                const confirmed = confirm("是否确定标记为已完成？");
                if (confirmed) {
                    window.location.href = "fileServlet?action=completeTask&admId=${user.getUid()}&taskId=" + taskId;
                    location.reload();
                }
            }
        </script>
    </table>
</div>
</body>
</html>

