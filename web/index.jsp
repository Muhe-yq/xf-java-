<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2023/6/13
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>巡检系统</title>
  <style>
    *{
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 黑体;
    }
    body{
      overflow: hidden;
    }
    section{
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background: linear-gradient(
              to bottom, #f1f4f9,#dff1ff
      );
    }
    section .color{
      position: absolute;
    }
    section .color:nth-child(1){
      top: -350px;
      width: 600px;
      height: 600px;
      background: #ff359b;
    }
    section .color:nth-child(2){
      bottom: -150px;
      left: 150px;
      width: 500px;
      height: 500px;
      background: #fffd87;
    }
    section .color:nth-child(3){
      bottom: 50px;
      right: 100px;
      width: 300px;
      height: 300px;
      background: #00dfff;
    }
    section .color{
      filter: blur(150px);
    }
    .container{
      position: relative;
      width: 400px;
      min-height: 400px;
      background: rgba(255,255,255,.1);
      border-radius: 10px;
      display: flex;
      justify-content: center;
      align-items: center;
      backdrop-filter: blur(5px);
      box-shadow: 0 25px 45px rgba(0,0,0,.1);
      border: 1px solid rgba(255,255,255,.5);
      border-right: 1px solid rgba(255,255,255,.2);
      border-bottom: 1px solid rgba(255,255,255,.2);
    }
    .form{
      position: relative;
      width: 100%;
      height: 100%;
      padding: 40px;
    }
    .form h2{
      position: relative;
      color: #fff;
      font-size: 24px;
      font-weight: 600;
      letter-spacing: 1px;
      margin-bottom: 40px;
    }
    .form h2::before{
      content: "";
      position: absolute;
      left: 0;
      bottom: -10px;
      width: 80px;
      height: 4px;
      background: #fff;
    }
    .form .inputBox{
      width: 100%;
      margin-top: 20px;
    }
    .form .inputBox input{
      width: 100%;
      background: rgba(255,255,255,.2);
      border: none;
      outline: none;
      padding: 10px 20px;
      border-radius: 35px;
      box-shadow: 0 25px 45px rgba(0,0,0,.5);
      border-right: 1px solid rgba(255,255,255,.2);
      border-bottom: 1px solid rgba(255,255,255,.2);
      letter-spacing: 1px;
      color: #fff;
      box-shadow:0 5px 15px rgba(0,0,0,.05);
    }
    .form .inputBox input::placeholder{
      color: #fff;
    }
    .form .inputBox input[type="botton"]{
      background: #fff;
      color: #666;
      max-width: 100px;
      cursor: pointer;
      margin-bottom: 20px;
      font-weight: 600;
    }
    .forget {
      margin-top: 5px;
      color: #483862;
      font-size: 20px
    }
    .forget a {
      color: #fff;
      font-weight: 600;
    }
    .box {
      position: relative;
    }
    .box .square{
      position: absolute;
      width: 100px;
      height: 100px;
      background: rgba(255,255,255,.1);
      backdrop-filter: blur(5px);
      box-shadow: 0 25px 45px rgba(0,0,0,.1);
      border: 1px solid rgba(255,255,255,.5);
      border-right: 1px solid rgba(255,255,255,.2);
      border-bottom: 1px solid rgba(255,255,255,.2);
      border-radius: 10px;
    }
    .box .square:nth-child(1){
      bottom: 10px;
      right: -70px;
      width: 100px;
      height: 100px;
    }
    .box .square:nth-child(2){
      top: 35px;
      right: -10px;
      width: 130px;
      height: 130px;
    }
    .box .square:nth-child(3){
      bottom: -10px;
      left: -100px;
      width: 80px;
      height: 80px;
    }
    .box .square:nth-child(4){
      top: -40px;
      left: -70px;
      width: 90px;
      height: 90px;
    }
    .box .square:nth-child(5){
      top: 100px;
      left: -110px;
      width: 150px;
      height: 150px;
    }
    .box .square{
      animation: animate 10s linear infinite;
      animation-delay: calc(-1s*var(--i));
    }
    @keyframes animate {
      0%,100%{
        transform: translateY(-40px);
      }
      50%{
        transform: translateY(40px);
      }
    }
  </style>
  <script>
    function login(){
      let uid=document.getElementById("uid").value;
      let pwd=document.getElementById("pwd").value;
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
      window.location.href = "login?uid="+uid+"&pwd="+pwd;//服务器地址
    }
    function register(){
      window.open("reg.jsp",null,"width=800,height=500,left=200,top=50",true);
    }

  </script>

  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<section>
  <div class="color"></div>
  <div class="color"></div>
  <div class="color"></div>
  <div class="box">
    <div class="square" style="--i:0"></div>
    <div class="square" style="--i:1"></div>
    <div class="square" style="--i:2"></div>
    <div class="square" style="--i:3"></div>
    <div class="square" style="--i:4"></div>
    <div class="container">
      <div class="form">
        <h2>Login Form</h2>
        <form>
          <div class="inputBox">
            <input type="text" placeholder="Username" id="uid">
          </div>
          <div class="inputBox">
            <input type="password" placeholder="Password" id="pwd">
          </div>
          <div class="inputBox">
            <input type="botton" value="Login" onclick="login()">
            <input type="botton" value="Register" onclick="register()">
          </div>
          <p class="forget">${error}</p>
        </form>
      </div>
    </div>
  </div>
</section>
</body>
</html>
