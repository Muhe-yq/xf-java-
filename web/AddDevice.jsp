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
    <title>增加新设备</title>
    <style>
        body{
            background-color: #f7f7f7;
            font-family: Arial, sans-serif;
        }
        #main {
            width: 600px;
            margin: 100px auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 24px;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            height: 30px;
            padding: 5px;
            border: 2px solid blueviolet;
            border-radius: 4px;
            font-size: 14px;
        }

        button {
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

        button:hover {
            background-color: darkviolet;
        }
    </style>
    <script src="//aeu.alicdn.com/waf/interfaceacting220819.js"></script>
    <script src="//aeu.alicdn.com/waf/antidomxss_v640.js"></script>
    <link rel="stylesheet" href="css/Navigation_css.css">
</head>
<body>
<div id="main">
    <h1>添加设备</h1>
    <div id="addDeviceInner">
        <div class="form-group">
            设备种类：
            <input type="text" id="dev_kind">
        </div>
        <div class="form-group">
            有效日期：
            <input type="text" id="dev_date">
        </div>
        <button onclick="sureAdd()">确认添加</button>
    </div>
    <script>
        function sureAdd() {
            let dev_kind = document.getElementById("dev_kind").value;
            let dev_date = document.getElementById("dev_date").value;
            if(dev_kind==null||dev_kind.trim()==""){
                alert("类型不能为空");
                return;
            }
            if(dev_date==null||dev_date.trim()==""){
                alert("有效日期不能为空");
                return;
            }
            window.location.href = "fileServlet?action=sureAdd&admId=${user.getUid()}&b="+dev_kind+"&c="+dev_date;
        }
    </script>
</div>
</body>
</html>
