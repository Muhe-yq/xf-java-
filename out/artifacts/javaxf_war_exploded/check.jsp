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

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        button {
            margin: 10px;
            padding: 10px 20px;
            background-color: darkviolet;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            width: 160px;
            height: 40px;
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
    <script src="http://s.anqu.com/zt/xylz/js/jquery-1.8.3.min.js"></script>
    <script src="http://s.anqu.com/v1/js/jquery.qrcode.min.js"></script>
    <script type="text/JavaScript" src="${pageContext.request.contextPath}/js/WebVideo.js" charset="gbk"></script>

</head>
<body>

<div id="main">
    <div class="container">
        <div id="search">
            <button onclick="checkMine()">查看我的记录</button>
            <button onclick="allCheck()">查看全部记录</button>
            <button onclick="goImgEncoder()">生成设备二维码</button>
        </div>

        <table>
            <thead>
            <tr>
                <th>巡检编号</th>
                <th>巡检人员</th>
                <th>巡检日期</th>
                <th>巡检结果</th>
                <th>现场描述</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${arr}" var="check">
                <tr>
                    <td>${check.getXj_id()}</td>
                    <td>${check.getXj_staff()}</td>
                    <td>${check.getXj_date()}</td>
                    <td>${check.getXj_result()}</td>
                    <td>${check.getXj_des()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>
    function checkMine() {
        window.location.href = "fileServlet?action=checkMine&admId=${user.getUid()}";
    }

    function allCheck() {
        window.location.href = "fileServlet?action=allCheck&admId=${user.getUid()}";
    }

    function goImgEncoder() {
        window.location.href = "fileServlet?action=goImgEncoder&admId=${user.getUid()}";
    }
</script>
</body>

</html>
