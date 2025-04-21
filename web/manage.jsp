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
    <title>检查记录</title>
    <style>
        body {
            background-size: 100% 100%;
            background-color: #f2f2f2;
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
            margin-top: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #search-row1 {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 10px;
        }

        #search-row1 button {
            width: 150px;
            height: 40px;
            background-color: aliceblue;
            border: none;
            border-radius: 20px;
            font-size: 16px;
            cursor: pointer;
        }

        #search-row1 button:first-child {
            margin-right: 10px;
        }

        #search-row1 button:hover {
            background-color: #ddd;
        }

        #search button {
            margin: 10px;
            padding: 10px 20px;
            background-color: darkviolet;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        #search button:hover {
            background-color: purple;
        }

        tr {
            width: 1190px;
            height: 30px;
            font-size: 16px;
        }

        td {
            width: 170px;
            height: 30px;
        }

        #container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 50vh;
        }

        #device {
            background-color: lavender;
            width: 400px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        #device h2 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        #device p {
            line-height: 1.5em;
            margin-bottom: 10px;
        }

        #btn03 {
            display: block;
            width: 100%;
            margin-top: 30px;
            padding: 10px;
            background-color: darkviolet;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        #btn03:hover {
            background-color: purple;
        }


        table {
            margin: auto;
        }

        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </style>

    <link rel="stylesheet" href="css/Navigation_css.css" type="text/css">

</head>
<body>
<div id="main">
    <div id="search">
        <br>
        <div id="search-row1">
            <button onclick="myData()">我的信息</button>&nbsp;&nbsp;&nbsp;&nbsp;
            <button onclick="gooManageShow()">管理用户</button>&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <script src="//aeu.alicdn.com/waf/interfaceacting220819.js"></script>
        <script src="//aeu.alicdn.com/waf/antidomxss_v640.js"></script>
        <script>
            function myData() {
                window.location.href = "fileServlet?action=myData&admId=${user.getUid()}";
            }

            function gooManageShow() {
                let uRole =${user.getRole()};
                if (uRole == "0") {
                    alert("你尚未获得该权限！")
                    return;
                } else {
                    window.location.href = "fileServlet?action=goManageShow&admId=${user.getUid()}";
                }
            }
        </script>
    </div>

    <div id="container">
        <div id="device">
            <h2>个人信息</h2>
            <p><strong>帐号:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.getUid()}</p>
            <p><strong>姓名:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.getName()}</p>
            <p><strong>性别:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.getSex()}</p>
            <p><strong>身份证号:</strong>&nbsp;&nbsp;${user.getIdcard()}</p>
            <p><strong>角色:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${((user.getRole())==1)?"管理员":"员工"}</p>
            <button id="btn03" onclick="goChangePwd()">修改密码</button>
            <script>
                function goChangePwd() {
                    window.location.href = "fileServlet?action=goChangePwd&admId=${user.getUid()}";
                }
            </script>
        </div>
    </div>
</div>
</body>
</html>

