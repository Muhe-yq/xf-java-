<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2022/6/18
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
       #frame{
           margin: 0;
           padding: 0;
        }
        #inner{
            width: 550px;
            height: 400px;
            /*margin-left: 480px;
            margin-top: 200px;*/
            left: 0px;
            right: 0px;
            margin: 150px auto 0;
            /*border: blue solid 3px;*/
        }
        #login_{
            width: 300px;
            height: 200px;
            margin-left: 125px;
            margin-top: 100px;
            /*border: blueviolet solid 2px;*/
        }
       body{
           background: url("../images/Login.jpg");
           background-size: 100% 100%;
       }
       input{
            height: 30px;
            width: 220px;
            margin-top: 20px;
            border: blueviolet 3px solid;
            border-radius: 20px;
        }
        button{
            width:100px;
            font-siza :18px;
            margin-left: 20px;
        }
    </style>

    <script>
        function login(){
            let uid=document.getElementById("uid").value;
            let pwd=document.getElementById("upwd").value;
            if(uid==null||uid.trim()==""){
                alert("账号不能为空");
                // document.getElementById("error").innerHTML = "账号不能为空";
                return;
            }
            if(pwd==null||pwd.trim()==""){
                alert("密码不能为空");
                // document.getElementById("error").innerHTML= "密码不能为空";
                return;
            }
            window.location.href = 'login?uid='+uid+'&pwd='+pwd;//服务器地址
        }
        function register(){
            window.open("reg.jsp",null,"width=400,height=400,left=500,top=500",true);
        }

    </script>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<div id="frame">
    <div id="inner">
        <div id="login_">
            &nbsp;账号：&nbsp;&nbsp;<input type="text" id="uid"><br>
            &nbsp;密码：&nbsp;&nbsp;<input type="password" id="upwd">
            <br><br>
            &nbsp;<button id="btn01" onclick="register()">注册</button>&nbsp;&nbsp;
            <button id="btn02" onclick="login()">登录</button><br>
            <span id="error" style="color: black">${error}</span>
        </div>
    </div>
</div>


</body>
</html>
