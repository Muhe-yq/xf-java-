<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <style>
        body{
            background-size: 100% 100%;
        }
        #aa{
            text-align:center;
            margin-top: 50px;
            font-size: 40px;
        }
        #bb{
            text-align:center;
            margin-top: 70px;
            font-size: 18px;
        }
    </style>
</head>
<body>
<h1 id="aa">
    注册
</h1>

<div id="bb">
    姓名:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="a"><br>
    性别:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="d"><br>
    身份证号:&nbsp;<input type="text" id="b"><br>
    密码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" id="c"><br><br><br>
    <button onclick="sure()">注册</button>
    <script>
        function sure(){
            let a = document.getElementById('a').value;//姓名
            let b = document.getElementById('b').value;//身份证号
            let c = document.getElementById('c').value;//密码
            let d = document.getElementById('d').value;//性别
            if(a==null||a.trim()==""){
                alert("姓名不能为空");
                return;
            }
            if(b==null||b.trim()==""){
                alert("身份证号不能为空");
                return;
            }
            if(c==null||c.trim()==""){
                alert("密码不能为空");
                return;
            }
            if(d==null||d.trim()==""){
                alert("性别不能为空");
                return;
            }
            window.location.href = 'reg?a='+a+'&b='+b+'&c='+c+'&d='+d;
        }
    </script>


</div>


</body>
</html>

