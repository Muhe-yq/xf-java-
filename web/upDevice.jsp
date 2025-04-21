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
    <title>设备信息修改</title>
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
            margin-top: 20px;
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
            width: 270px;
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
    <h1>设备信息修改</h1>
    <div class="form-group">
        设备编号:
        <input id="deviceId" type="text" value="${device.getDev_id()}" readonly>
    </div>
    <div class="form-group">
        设备种类:
        <input id="name" type="text" value="${device.getDev_kind()}">
    </div>
    <div class="form-group">
        有效日期:
        <input id="date" type="text" value="${device.getDev_date()}">
    </div>
    <div class="btn-container">
        <button onclick="upDevice()">确认修改</button>
    </div>
    <script src="//aeu.alicdn.com/waf/interfaceacting220819.js"></script>
    <script src="//aeu.alicdn.com/waf/antidomxss_v640.js"></script>
    <script>
        function upDevice() {
            let devName = document.getElementById("name").value;
            let devDate = document.getElementById("date").value;
            if (devName === null || devName.trim() === "") {
                alert("设备名称不能为空");
                return;
            }
            if (devDate === null || devDate.trim() === "") {
                alert("设备有效日期不能为空");
                return;
            }
            window.location.href = "fileServlet?action=upDevice&admId=${user.getUid()}&deviceId=${device.getDev_id()}&name=" + devName + "&date=" + devDate;
        }
    </script>
</div>
</body>
</html>
