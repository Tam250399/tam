<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/19/2021
  Time: 2:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <!-- Brand -->
    <a href="/Login?action=back">
    <img src="/ListUser/img/logo.PNG" height="80px" ; width="115px">
    </a>
    <!-- Toggler/collapsibe Button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar links -->
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#">Playlist</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Nghệ Sĩ</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Thể Loại</a>
            </li>
        </ul>
    </div>
    <ul class="navbar-nav ml-auto">
        <form class="form-inline" action="/somepage">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" style="width:340px">
            <button class="btn btn-success" type="submit">Search</button>
        </form>
    </ul>
    <div class="collapse navbar-collapse" id="collapsibleNavbar" style="padding-left:150px;">
        <ul class="navbar-nav" id="nav">
            <li class="nav-item">
                <a class="nav-link" href="/Login?action=Login">Sign in</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Create account</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Upload</a>
            </li>
            <figure class="image mar-r-10 is-40x40 is-rounded " id="icon">
                <a class="nav-link" href="https://id.zalo.me/account?continue=http://localhost:8080/">
                    <img src="https://avatar.talk.zdn.vn/default" style="width: 40px;

        border-radius: 50%;
        margin-left: 20px;">
                </a>
            </figure>
        </ul>
    </div>
</nav>


<div class="container" style=" float: left;
        height: 540px;
    width: 250px;
    background-color: grey;">

    <div class="list-group">
        <div class="accordion" id="accordionExample">
            <div class="card">
                <div class="card-header" id="headingOne">
                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"><i class="bi bi-file-earmark-person"></i>
                        Cá Nhân
                    </button>
                </div>
            </div>
            <a href="#" class="list-group-item active"><i class="bi bi-disc"></i>
                Khám Phá
            </a>
            <a href="#" class="list-group-item"><i class="bi bi-file-music"></i>ZingChart</a>
            <a href="#" class="list-group-item"> <i class="bi bi-flower1"></i>Theo Dõi</a>
            <hr>
            <a href="#" class="list-group-item"><i class="bi bi-file-earmark-music"></i>Nhạc Mới </a>
            <a href="#" class="list-group-item"><i class="bi bi-card-list"></i>Thể Loại </a>
            <a href="#" class="list-group-item"><i class="bi bi-gem"></i>Top 100</a>
            <a href="#" class="list-group-item"> <i class="bi bi-caret-right-square"></i>MV</a>
        </div>
    </div>
</div>

<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
    <div class="card-body">
        <div class="row">
            <div class="container-fluid">
                <h1 class="display-4 my-4 text-info" style="text-align: center;"> List of users</h1>
                <table class="table table-striped " id="users" style="width: 100%;">
                    <thead>
                    <tr id="list-header">
                        <th scope="col">ID</th>
                        <th scope="col">Actions</th>
                        <th scope="col">username</th>
                        <th scope="col">passwords</th>
                        <th scope="col">email</th>
                        <th scope="col">firtName</th>
                        <th scope="col">lastname</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope['username']}" var='user'>
                        <tr>
                            <td scope="row"><c:out value=" ${user.id}"></c:out></td>
                            <td>
                                <div class="btn-group dropright">
                                    <button type="button" class="btn btn-primary dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown"><i class="bi bi-pencil-square"></i>Primary</button>
                                    <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i>Delete</button>
                                </div>
                            </td>
                            <td><c:out value="${user.userName}"></c:out></td>
                            <td><c:out value="${user.password}"></c:out></td>
                            <td><c:out value="${user.youremail}"></c:out></td>
                            <td><c:out value="${user.firstname}"></c:out></td>
                            <td><c:out value="${user.lastname}"></c:out></td>
                        </tr>

                    </c:forEach>
                    <tr>
                        <td scope="row">1</td>
                        <td>
                            <div class="btn-group dropright">
                                <button type="button" class="btn btn-primary dropdown-toggle" id="dropdownMenuButton1" data-toggle="dropdown"><i class="bi bi-pencil-square"></i>Primary</button>
                                <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i>Delete</button>

                            </div>
<%--                            <div class="dropdown-menu">--%>
                            <%--                                <form class="px-4 py-3" method="post">--%>

                            <%--                                    <div class="form-group" style="border: 1px solid;box-shadow: 5px 5px 2px 4px;;width: 670px;background-color: aquamarine;">--%>
<%--                                        <div class="main" style="margin-left: 90px ;padding-top: 30px;">--%>

<%--                                            <label for="UserName">UserName</label>--%>
<%--                                            <input type="UserName" id="UserName" value="${requestScope['user'].username}" name="username" class="form-control" placeholder="Nhập UserName" style="width:500px">--%>
<%--                                            <label >passwords</label>--%>
<%--                                            <input type="password" id="password" value="${requestScope['user'].passwords}" name="passwords" class="form-control" placeholder="Nhập Password" style="width:500px">--%>
<%--                                            <label for="myEmail">Email</label>--%>
<%--                                            <input type="email" id="myEmail" class="form-control" value="${requestScope['user'].email}" name="email" placeholder="Nhập Email" style="width:500px">--%>
<%--                                            <label for="firtName">firtName</label>--%>
<%--                                            <input type="text" id="firtName" class="form-control" value="${requestScope['user'].fistname}" name="fistname" placeholder="firtName" style="width:500px">--%>
<%--                                            <label for="lastname">lastname</label>--%>
<%--                                            <input type="text" id="lastname" class="form-control" ${requestScope['user'].lastame} name="lastname" placeholder="lastname" style="width:500px">--%>
<%--                                        </div>--%>
<%--                                        <div class="col-md-6 offset-5">--%>
<%--                                            <button type="submit" class="btn btn-primary" style="margin-top:50px;margin-bottom:20px">Save</button>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </form>--%>
<%--                            </div>--%>
                        </td>
                        <td>Công Tâm</td>
                        <td>123</td>
                        <td>tamthanhsk25@gmail.com</td>
                        <td>Công</td>
                        <td>Tâm</td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </div>
        </div>
    </div>

</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>
