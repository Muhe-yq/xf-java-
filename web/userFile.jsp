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
            background-color: #F5F5F5;
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
            margin: 10px;
            padding: 10px 20px;
            background-color: darkviolet;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            width: 150px;
            height: 40px;
        }

        #search-row1 button:first-child {
            margin-right: 10px;
        }

        #search-row1 button:hover {
            background-color: #ddd;
        }

        #search-row2 {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #search-row2 button {
            margin-top: 27px;
            height: 50px;
            padding: 10px;
            background-color: darkviolet;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        #search-row2 input[type="text"] {
            width: 200px;
            padding: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        #search button:hover {
            background-color: purple;
        }

        #sea {
            width: 300px;
            height: 40px;
            border: 2px solid darkviolet;
            border-radius: 20px;
            margin-top: 30px;
            padding: 5px 10px;
            font-size: 16px;
            outline: none;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            text-align: center;
            padding: 8px;
        }

        th {
            background-color: darkviolet;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .action-buttons button {
            margin-right: 5px;
            padding: 2px 3px;
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
        }

        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    </style>

    <link rel="stylesheet" href="css/Navigation_css.css">

</head>
<body>
<div id="main">

    <div id="search">
        <br>
        <div id="search-row1">
            <button onclick="myData()">我的信息</button>
            <button onclick="gooManageShow()">管理用户</button>
        </div>
        <div id="search-row2">
            <input type="text" id="sea" placeholder="输入关键词进行查询">
            <button onclick="search()">查询</button>
        </div>

        <script src="//aeu.alicdn.com/waf/interfaceacting220819.js"></script>
        <script src="//aeu.alicdn.com/waf/antidomxss_v640.js"></script>
        <script>
            function search() {
                let goalFile = document.getElementById("sea").value;
                window.location.href = "fileServlet?action=search&admId=" + ${user.getUid()} +"&goalFile=" + goalFile;
            }

            function myData() {
                window.location.href = "fileServlet?action=myData&admId=${user.getUid()}";
            }

            function gooManageShow() {
                if (user.getRole() == 0) {
                    alert("你尚未获得该权限！")
                    return;
                }
                window.location.href = "fileServlet?action=gooManageShow&admId=${user.getUid()}";
            }

        </script>

    </div>

    <br>
    <table border="1" cellspacing="0">
        <tr>
            <th>帐号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>身份证号</th>
            <th>角色</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${arr}" var="user">
            <tr>
                <td>${user.getUid()}</td>
                <td>${user.getName()}</td>
                <td>${user.getSex()}</td>
                <td>${user.getIdcard()}</td>
                <td>${((user.getRole())==1)?"管理员":"员工"}</td>
                <td class="action-buttons">
                    <button onclick="deleteUser('${user.getUid()}')">删除</button>
                    <button onclick="upToAdm('${user.getUid()}')">设为管理员</button>
                    <button onclick="upToUser('${user.getUid()}')">设为员工</button>
                </td>
            </tr>
        </c:forEach>
        <script>
            function deleteUser(m) {
                const role = ${user.getRole()};
                if (role == m) {
                    alert("不可对当前用户进行操作");
                    return;
                }
                const confirmed = confirm("是否确定删除该用户？");
                if (confirmed) {
                    window.location.href = "fileServlet?action=deleteUser&admId=${user.getUid()}&userid=" + m;
                }
            }

            function upToAdm(n) {
                const role = ${user.getRole()};
                if (role == n) {
                    alert("不可对当前用户进行操作");
                    return;
                }
                const confirmed = confirm("是否确定将该用户设置为管理员");
                if (confirmed) {
                    window.location.href = "fileServlet?action=upToAdm&admId=${user.getUid()}&userid=" + n;
                }
            }

            function upToUser(y) {
                const role = ${user.getRole()};
                if (role == y) {
                    alert("不可对当前用户进行操作");
                    return;
                }
                const confirmed = confirm("是否确定将该用户设置为普通用户");
                if (confirmed) {
                    window.location.href = "fileServlet?action=upToUser&admId=${user.getUid()}&userid=" + y;
                }
            }
        </script>
    </table>
</div>
</body>
</html>