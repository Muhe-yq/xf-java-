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
    <title>检查结果记录</title>
    <style>
        body{
            background-size: 100% 100%;
            font-family: Arial, sans-serif;
        }
        #main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        #addDeviceInner{
            width: 400px;
            text-align: center;
            padding-top: 50px;
        }
        input{
            height: 40px;
            width: 80%;
            border: 2px solid blueviolet;
            border-radius: 2px;
            font-size: 16px;
            margin-bottom: 10px;
            padding: 5px;
        }
        div.style {
            font-size: 24px;
            margin-bottom: 20px;
        }

        button {
            width: 150px;
            height: 40px;
            font-size: 18px;
            margin-bottom: 20px;
        }
    </style>
    <link rel="stylesheet" href="css/Navigation_css.css" type="text/css">
</head>
<body>
<div id="main">
    <div id="addDeviceInner">
        <h1>添加巡检信息</h1>
        <div class="style">设备ID：<input type="text" id="dev_id" value="${dev_id}" readonly="true"></div>
        <div class="style">设备名称：<input type="text" id="dev_name" value="${dev_name}" readonly="true"></div>
        <div class="style">巡检人员：<input type="text" id="xj_staff"></div>
        <div class="style">巡检日期：<input type="text" id="xj_date"></div>
        <div class="style">巡检结果：<input type="text" id="xj_result"></div>
        <div class="style">现场描述：<input type="text" id="xj_des"></div>
        <button onclick="sureAddCheck()">确认添加</button>
    </div>
    <script>
        function sureAddCheck(){
            let xj_staff = document.getElementById("xj_staff").value;
            let xj_date = document.getElementById("xj_date").value;
            let xj_result = document.getElementById("xj_result").value;
            let xj_des = document.getElementById("xj_des").value;
            if(xj_staff==null||xj_staff.trim()==""){
                alert("人员不能为空");
                return;
            }
            if(xj_date==null||xj_date.trim()==""){
                alert("日期不能为空");
                return;
            }
            if(xj_result==null||xj_result.trim()==""){
                alert("巡检结果不能为空");
                return;
            }
            if(xj_des==null||xj_des.trim()==""){
                alert("现场描述不能为空");
                return;
            }
            alert("添加成功!");
            window.location.href = "fileServlet?action=sureAddCheck&admId=220701062230&b="+xj_staff+"&c="+xj_date+"&d="+xj_result+"&e="+xj_des+"&f=${dev_id}&g=${dev_name}";
        }
    </script>
</div>
</body>
</html>
