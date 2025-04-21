<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2022/6/22
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>消防设备管理系统</title>
    <style>
        body {
            background-color: #ea5d5d;
            font-family: Arial, sans-serif;
        }

        #main {
            max-width: 800px;
            margin: 0 auto;
            padding: 50px;
            background-color: #FFFFFF;
            border: 1px solid #E0E0E0;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 32px;
            color: #333333;
            text-align: center;
        }

        #content {
            margin-top: 30px;
            font-size: 16px;
            line-height: 1.5;
            color: #666666;
        }
    </style>
    <link rel="stylesheet" href="css/Navigation_css.css">
</head>
<body>
<div id="main">
    <br><br><br><br><br><br>
    <h1>欢迎来到消防设备管理系统</h1>
    <div id="content">
        <p>使用说明：这是一个消防设备管理系统，用于管理公司的消防设备。使用人员被分为两类，分别是管理人员与员工，员工可以查看设备信息、记录巡检信息等，管理人员除拥有员工的所有功能外，还可以查看公司的人员名单，并可以将员工设置为管理员或将管理员设置为员工。</p>
        <p>使用者不仅可以在系统中查看公司全部消防设备的编号、种类名称与有效日期，还可以对消防设备进行增删改查等操作。员工还可以巡检设备，并在系统中记录巡检结果、巡检日期、现场描述等。除此之外，使用者可以在系统中维护设备种类，您不仅可以修改已有的设备种类信息，并且在您添加或修改新设备时，若新设备的种类未在设备种类中记载，系统将自动在设备种类中添加该设备种类。</p>
        <p>以上便是此系统的主要功能，祝使用愉快。</p>
    </div>
</div>
</body>
</html>
