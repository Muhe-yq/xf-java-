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
        body{
            background: url("images/Login.jpg");
            background-size: 100% 100%;
        }
        #search{
            width: 1000px;
            height: 100px;
        }
        #btn01,#btn02,#btn03{
            width: 150px;
            height: 40px;
            margin-top: 30px;
            backgroud-color: aliceblue;
        }
        #file{
            width: 180px;
            height: 60px;
            float: right;
            margin-right: 30px;
            margin-top: 20px;
            padding-top: 5px;
        }
        tr{
            width: 1190px;
            height: 30px;
            font-size: 16px;
        }
        td{
            width: 170px;
            height: 30px;

        }

        table {margin: auto;} body{text-align: center;}。

        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    </style>

    <link rel="stylesheet" href="css/adm.css" type="text/css">

</head>
<body>
<div id="frame">

    <div id="search">
        <button id="btn01" onclick="checkMine()">查看我的记录</button>&nbsp;&nbsp;&nbsp;&nbsp;
        <button id="btn02" onclick="allCheck()">查看全部记录</button>&nbsp;&nbsp;&nbsp;&nbsp;
        <button id="btn03" onclick="goNewCheck()">记录新的检查结果</button>
        <script>
            function checkMine(){
                window.location.href = "fileServlet?action=checkMine&admId=${user.getUid()}";
            }
            function goNewCheck(){
                window.location.href = "fileServlet?action=goNewCheck&admId=${user.getUid()}";
            }
            function allCheck(){
                window.location.href = "fileServlet?action=allCheck&admId=${user.getUid()}";
            }
        </script>
    </div>

    <br><br><br><br>


    <table border="1" cellspacing="0" ; style="padding-left: 30px;border: darkviolet">
        <tr>
            <td>巡检编号</td>
            <td>巡检人员</td>
            <td>巡检日期</td>
            <td>巡检结果</td>
            <td>现场描述</td>
        </tr>

        <c:forEach items="${arr}" var="check">
            <tr>
                <td>${check.getXj_id()}</td>
                <td>${check.getXj_staff()}</td>
                <td>${check.getXj_date()}</td>
                <td>${check.getXj_result()}</td>
                <td>${check.getXj_des()}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
