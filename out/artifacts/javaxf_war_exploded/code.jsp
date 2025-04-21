<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html charset=UTF-8">
    <title>二维码</title>
    <style>
        #myTab0_Content0 {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
    </style>
    <script src="http://s.anqu.com/zt/xylz/js/jquery-1.8.3.min.js"></script>
    <script src="http://s.anqu.com/v1/js/jquery.qrcode.min.js"></script>
</head>
<body>
<div id="myTab0_Content0">
    <script>
        jQuery(function () {
            const role = ${dev_name};
            jQuery('#myTab0_Content0').qrcode({width: 140,height: 140,text: "http://192.168.31.97:8080/javaxf/fileServlet?action=goNewCheck&dev_id="+"${dev_id}"+"&dev_name="+"${dev_name}"});
        })
    </script>
</div>
</body>
</html>
