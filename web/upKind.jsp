<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2022/6/22
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/Navigation_css.css" type="text/css">
    <style>
        body {
            background-size: cover;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 600px;
            margin: 100px auto;
            padding: 40px;
            background-color: #f3f3f3;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 40px;
            text-align: center;
            margin-bottom: 40px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-size: 18px;
            font-weight: bold;
        }

        .form-group input[type="text"] {
            width: 100%;
            height: 30px;
            border: 2px solid blueviolet;
            border-radius: 2px;
            font-size: 17px;
            padding: 5px;
        }

        .btn-container {
            text-align: center;
        }

        button {
            width: 200px;
            height: 40px;
            font-size: 18px;
            background-color: blueviolet;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        button:hover {
            background-color: #8a2be2;
        }

    </style>
</head>
<body>
<div class="container">
    <h1>设备种类信息修改</h1>
    <div class="form-group">
        种类编号:
        <input id="kindId" type="text" value="${kind.getKindId()}" readonly>
    </div>
    <div class="form-group">
        种类名称:
        <input id="name" type="text" value="${kind.getKindName()}">
    </div>
    <div class="btn-container">
        <button onclick="upKind()">确认修改</button>
    </div>
    <script>
        function upKind() {
            let kindName = document.getElementById("name").value;
            if (kindName === null || kindName.trim() === "") {
                alert("设备种类名不能为空");
                return;
            }
            window.location.href = "fileServlet?action=upKind&admId=${user.getUid()}&kindId=${kind.getKindId()}&kindName=${kind.getKindName()}&name=" + kindName;
        }
    </script>
</div>
</body>
</html>

