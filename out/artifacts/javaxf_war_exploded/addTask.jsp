<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2022/6/22
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加新任务</title>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }
        #main {
            width: 600px;
            margin: 0 auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        #container {
            width: 70%;
            margin-left: 40px;
            margin-top: 40px;
            padding-left: 60px;
            padding-top: 60px;
            padding-bottom: 60px;
        }
        input{
            width: 100%;
            height: 30px;
            padding: 5px;
            border: 2px solid blueviolet;
            border-radius: 4px;
            font-size: 14px;
        }
        .btn {
            margin-top: 30px;
            width: 100%;
            height: 40px;
            font-size: 16px;
            background-color: blueviolet;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #8a2be2;
        }
    </style>
    <link rel="stylesheet" href="css/Navigation_css.css">
    <script src="//aeu.alicdn.com/waf/interfaceacting220819.js"></script><script src="//aeu.alicdn.com/waf/antidomxss_v640.js"></script>
</head>
<body>
<div id="main">
    <br><br>
    <div style="font-size: 40px; text-align: center;">分配任务</div>
    <div id="container">
        <br><br>
        截至日期：
        <input type="text" id="deadline">

        <br><br>
        任务描述：
        <input type="text" id="task">

        <br><br><br><br>
        <button class="btn" onclick="sureAddTask()">确认</button>
    </div>
    <script>
        function sureAddTask() {
            let deadline = document.getElementById("deadline").value;
            let task = document.getElementById("task").value;

            if(deadline==null || deadline.trim()==""){
                alert("截至日期不能为空");
                return;
            }

            if(task==null || task.trim()==""){
                alert("任务描述不能为空");
                return;
            }

            window.location.href = "fileServlet?action=sureAddTask&admId=${user.getUid()}&TaskUserId=${TaskUser.getUid()}&TaskUserName=${TaskUser.getName()}&deadline="+deadline+"&task="+task;
            alert("分配任务成功，将返回首页");
        }
    </script>
</div>
</body>
</html>