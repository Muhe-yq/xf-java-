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
    <title>修改密码</title>
    <style>
        body {
            background-color: #f5f5f5;
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
            text-align: center;
            font-size: 28px;
            margin-bottom: 30px;
        }

        label {
            display: block;
            font-size: 16px;
            margin-bottom: 10px;
        }

        input[type="password"] {
            width: 100%;
            height: 30px;
            padding: 5px;
            border: 2px solid blueviolet;
            border-radius: 4px;
            font-size: 14px;
        }

        .btn-container {
            text-align: center;
            margin-top: 30px;
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
    <link rel="stylesheet" href="css/Navigation_css.css" type="text/css">
</head>
<body>
<div id="main">

    <h1>修改密码</h1>
    <form>
        帐号：&nbsp;&nbsp;${user.getUid()}

        <br><br>
        输入密码：
        <input type="password" id="password">

        <br><br>
        确认密码：
        <input type="password" id="confirm-password">

        <div class="btn-container">
            <button class="btn" onclick="sureChange()">确认修改</button>
        </div>
    </form>

</div>
<script src="//aeu.alicdn.com/waf/interfaceacting220819.js"></script>
<script src="//aeu.alicdn.com/waf/antidomxss_v640.js"></script>
<script>
    function sureChange() {
        let password = document.getElementById("password").value;
        let confirmPassword = document.getElementById("confirm-password").value;

        if (password == confirmPassword && password.trim() != "" && confirmPassword.trim() != "") {
            // 进行密码修改的操作
            window.location.href = "fileServlet?action=sureChange&admId=${user.getUid()}&pwd=" + password;
        } else {
            alert("两次密码不一致或为空");
            return;
        }
    }
</script>
</body>
</html>