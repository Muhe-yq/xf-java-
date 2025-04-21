<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2023/6/8
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>生成设备二维码</title>
    <meta http-equiv="Content-Type" content="text/html charset=UTF-8">
    <style>
        body {
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
    <link rel="stylesheet" href="css/Navigation_css.css" type="text/css">
</head>
<body>
<div id="main">
    <h1>生成设备二维码</h1>
    <div class="form-group">
        设备编号：
        <input type="text" id="dev_id">
    </div>
    <div class="form-group">
        设备名称：
        <input type="text" id="dev_name">
    </div>
    <button onclick="sureEncode()">生成</button>
</div>


<script>
    function sureEncode() {
        let dev_id = document.getElementById("dev_id").value;
        let dev_name = document.getElementById("dev_name").value;
        if (dev_id == null || dev_id.trim() == "") {
            alert("设备ID不能为空");
            return;
        }
        if (dev_name == null || dev_name.trim() == "") {
            alert("设备名称不能为空");
            return;
        }
        window.location.href = "fileServlet?action=sureEncode&admId=${user.getUid()}&b=" + dev_id + "&c=" + dev_name;

        function sleep(n) {
            var start = new Date().getTime();
            //  console.log('休眠前：' + start);
            while (true) {
                if (new Date().getTime() - start > n) {
                    break;
                }
            }
        }

        sleep(5);
        //window.open("code.jsp", null,"width=400,height=400,left=500,top=500",true);
    }
</script>
</div>
</body>
</html>