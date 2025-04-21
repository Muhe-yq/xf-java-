<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2022/7/1
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
    <style>
        body{
            background-size: 100% 100%;
        }
        #aa,#bb{
            text-align:center;
            margin-top: 50px;
            font-size: 40px;
            /*margin-left: 1100px;*/
        }
    </style>

</head>
<body>

<h1 id="aa">欢迎&nbsp;<span style="color: red">${name}</span>&nbsp;注册成功&nbsp;&nbsp;&nbsp;你的Id:${id}</h1><br>
<h2 id = "bb">记住id->请关闭去登录</h2>
</body>
</html>
