<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2022/7/1
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>设备种类维护</title>
    <style>
        body {
            background-size: 100% 100%;
            display: flex;
            height: 100vh;
            margin: 0;
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

        #container {
            width: 600px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 5px;
        }

        table {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            border-collapse: collapse;
        }

        th, td {
            text-align: left;
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
    <div id="container">
        <table>
            <tr>
                <th>种类编号</th>
                <th>设备种类</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${arr}" var="kind">
                <tr>
                    <td>${kind.getKindId()}</td>
                    <td>${kind.getKindName()}</td>
                    <td class="action-buttons"><button onclick="toUpKind('${kind.getKindId()}')">修改信息</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<script src="//aeu.alicdn.com/waf/interfaceacting220819.js"></script><script src="//aeu.alicdn.com/waf/antidomxss_v640.js"></script><script>
    function toUpKind(m) {
        window.location.href = "fileServlet?action=toUpKind&admId=${user.getUid()}&kindId=" + m;
    }
</script>
</body>
</html>
