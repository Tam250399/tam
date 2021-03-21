<%--
  Created by IntelliJ IDEA.
  model.entities.User: Admin
  Date: 3/15/2021
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="LoginStyle.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Raleway');
        html,
        body {
            width: 100%;
            height: 100%;
            font-family: 'Raleway';
            font-size: 16px;
            font-weight: bold;
        }

        .bg {
            background-image: url("/Login/img/anh5.jpg");
            background-size: cover;
            width: 100%;
            height: 100%;
        }

        .row-container {
            border: 1px solid #fff;
            border-radius: 20px;
            margin-top: 10vh;
            /* vh= Viewport's height */
            padding: 30px;
            -webkit-box-shadow: 0px 1px 22px 5px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 0px 1px 22px 5px rgba(0, 0, 0, 0.75);
            box-shadow: 0px 1px 22px 5px rgba(0, 0, 0, 0.75);
        }

        label,
        .form-check-label,
        h1 {
            color: white;
            text-shadow: 2px 2px 10px #000;
            text-align: center;
        }

        .emailError,
        .passwordError {
            color: red;
            background-color: blanchedalmond;
            padding-left: 10px;
            border-radius: 4px;
            margin-top: 1px;
        }

        .sign-up {
            margin: 1em 0;
        }

        .sign-up h2 {
            font-size: 22px;
            color: #fff;
            font-family: 'Roboto Condensed', sans-serif;
            text-align: center;
            background: #ff3366;
            width: 40px;
            height: 40px;
            line-height: 1.7em;
            border-radius: 50%;
            margin: 0 auto;
        }

        p {
            text-align: center;
            font-size: 15px;
        }

        .header-social a.face {
            background: url("/Login/img/fac.png")no-repeat 12px 9px #3B62A3;
            color: #FFF;
            font-size: 16px;
            font-weight: 400;
            padding: 0 2em;
            padding-top: 5px;
            width: 46%;
            text-align: left;
            margin-right: 4%;
            display: inline-block;
            border-radius: 3px;
            font-family: 'Roboto Condensed', sans-serif;
        }

        .header-social a.face:hover {
            background: url("/Login/img/fac.png")no-repeat 12px 9px #0E387C;
            transition: 0.5s all;
            -webkit-transition: 0.5s all;
            -moz-transition: 0.5s all;
            -o-transition: 0.5s all;
        }

        .header-social a.zalo {
            background: url('/Login/img/zalo1.png')no-repeat 12px 9px #19B0E7;
            color: #FFF;
            font-size: 16px;
            font-weight: 400;
            padding: 0 3em;
            padding-top: 6px;
            width: 45%;
            text-align: left;
            transition: 0.5s all;
            display: inline-block;
            cursor: pointer;
            outline: none;
            border-radius: 3px;
            font-family: 'Roboto Condensed', sans-serif;
        }

        .header-social a.zalo:hover {
            background: url("/Login/img/zalo1.PNG")no-repeat 12px 9px #0192C7;
            transition: 0.5s all;
            -webkit-transition: 0.5s all;
        }
    </style>
</head>
<body>
<div class="container-fluid bg">
    <div class="row justify-content-center">
        <div class="col-md-3 col-sm-6 col-xs-12 row-container">
            <form action="/Login?action=login" method="post">
                <h1>Login Now</h1>
                <div class="form-group">
                    <label for="email">User Name</label>
                    <input type="text" class="form-control" id="email" placeholder="User Name" name="user">
                    <p class="emailError"></p>
                </div>
                <div class="form-group">
                    <label for="password" class="label">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Password" name="password">
                    <p class="passwordError"></p>
                </div>
                <p class="text-danger" style="font-size: 15px">${mess}</p>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Check me out</label>
                </div>
                <button type="submit" class="btn btn-success btn-block my-3">Login</button>
                <a href="/Login?action=regiter" class="dangky" >
                    <p>Đăng ký</p>
                </a>
            </form>
            <div class="header-left-top">
                <div class="sign-up">
                    <h2>or</h2>
                </div>

            </div>
            <div class="header-social wthree" style="padding-left:12px">
                <a href="#" class="face">
                    <h5>Facebook</h5>
                </a>
                <a href="#" class="zalo">
                    <h5> Zalo</h5>
                </a>
            </div>

        </div>
    </div>
</div>
<br>
<%
    String login_msg=(String)request.getAttribute("error");
    if(login_msg!=null) out.println("<font color=red size=4px style ='margin-left: 80px;'> "+login_msg+"</font>");
%>
</body>

</html>
