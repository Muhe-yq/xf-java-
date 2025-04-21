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
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        #sea {
            width: 300px;
            height: 40px;
            border: 2px solid darkviolet;
            border-radius: 2px;
            padding: 5px 10px;
            font-size: 16px;
        }

        #btn01 {
            width: 70px;
            height: 40px;
            background-color: aliceblue;
            border: none;
            cursor: pointer;
        }

        table {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            border-collapse: collapse;
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
            padding: 5px 10px;
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
        <input type="text" id="sea" placeholder="请输入设备编号或名称">
        <button id="btn01" onclick="search()">查询</button>
    </div>

    <table>
        <tr>
            <th>设备编号</th>
            <th>设备种类</th>
            <th>有效日期</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${arr}" var="device">
            <tr>
                <td>${device.getDev_id()}</td>
                <td>${device.getDev_kind()}</td>
                <td>${device.getDev_date()}</td>
                <td class="action-buttons">
                    <button onclick="deleteDevice('${device.getDev_id()}')">删除</button>
                    <button onclick="toUpDevice('${device.getDev_id()}')">修改信息</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<script src="//aeu.alicdn.com/waf/interfaceacting220819.js"></script><script src="//aeu.alicdn.com/waf/antidomxss_v640.js"></script><script>
    function search() {
        let goalFile = document.getElementById("sea").value;
        let admId = ${user.getUid()};
        window.location.href = "fileServlet?action=devicesearch&admId=" + admId + "&goalFile=" + goalFile;
    }

    function toUpDevice(m) {
            window.location.href = "fileServlet?action=toUpDevice&admId=${user.getUid()}&deviceId=" + m;
    }

    function deleteDevice(n) {
        const confirmed = confirm("是否确定删除该设备？");
        if (confirmed) {
            window.location.href = "fileServlet?action=deleteDevice&admId=${user.getUid()}&deviceId=" + n;
        }
    }
</script>
</body>
</html>