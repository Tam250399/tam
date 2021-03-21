<%--
  Created by IntelliJ IDEA.
  model.entities.User: Admin
  Date: 3/15/2021
  Time: 8:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="Main/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <style>
        h2 {
            color: aliceblue;
        }
    </style>
</head>
<body style="background-color: #170f23">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <!-- Brand -->
    <img src="Main/logo/logo.PNG" height="80px" ; width="115px">
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
            <c:if test="${sessionScope.acc == null}">
                <li class="nav-item">
                    <a class="nav-link" href="Login?action=Login">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Upload</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.acc != null}">
                <li class="nav-item">
                    <a class="nav-link" href="Login?action=deleteLogin">Logout </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Hello <c:out value="${sessionScope.name}"/></a>
                </li>
                <figure class="image mar-r-10 is-40x40 is-rounded " id="icon">
                    <a class="nav-link" href="/Login?action=ShowUser">
                        <img src="https://avatar.talk.zdn.vn/default" style="width: 40px;
    border-radius: 50%;
    margin-left: 20px;">
                    </a>
                </figure>
            </c:if>
            <%--            <li class="nav-item">--%>
            <%--                <a class="nav-link" href="/Login?action=controller.Login">Sign in</a>--%>
            <%--            </li>--%>
            <%--            <li class="nav-item">--%>
            <%--                <a class="nav-link" href="#">Create account</a>--%>
            <%--            </li>--%>


        </ul>
    </div>
</nav>
<div id="myCarousel" class="carousel slide col-md-8 offset-md-2" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100"
                 src="https://photo-zmp3.zadn.vn/banner/c/e/f/3/cef3dc38ef7528d57b055aca985ac121.jpg" alt="Leopard">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100"
                 src="https://photo-zmp3.zadn.vn/banner/b/b/a/3/bba3aa0509af25e96452c2fe3221346e.jpg" alt="Cat">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100"
                 src="https://photo-zmp3.zadn.vn/banner/7/b/3/c/7b3cc839dd0ba23b59e0a21191d472df.jpg" alt="Lion">
        </div>
    </div>
    <!-- Controls -->
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<div class="row d-inline-flex col-md-10 offset-md-1">
    <!-- Gallery Item 1 -->
    <div class="col-12 col-sm-6 col-md-3 p-2" style="margin-left: 55px;">
        <div class="d-flex flex-column text-center  height100" style="width: 225px;">
            <div>
                <a href="javascript:;" onclick="ListSheep()"><img src="/Main/banner/anh1.jpg" style="width:150px"></a>
            </div>
            <a href="javascript:;" onclick="ListSheep()"><h2>Sheep</h2></a>
        </div>
    </div>
    <!-- Gallery Item 2 -->
    <div class="col-12 col-sm-6 col-md-3 p-2">
        <div class="d-flex flex-column text-center  height100" style="width: 225px;">
            <div>
                <a href="javascript:;" onclick="ListHorse()"><img src="/Main/banner/anh2.jpg" style="width:150px"></a>
            </div>
            <a href="javascript:;" onclick="ListHorse()"><h2>Horse</h2></a>
        </div>
    </div>
    <!-- Gallery Item 3 -->
    <div class="col-12 col-sm-6 col-md-3 p-2">
        <div class="d-flex flex-column text-center  height100" style="width: 225px;">
            <div>
                <a href="javascript:" onclick="ListDuck()"><img src="/Main/banner/anh3.jpg" style="width:150px"></a>
            </div>
            <a href="javascript:" onclick="ListDuck()"><h2>Duck</h2></a>
        </div>
    </div>
    <!-- Gallery Item 4 -->
    <div class="col-12 col-sm-6 col-md-1 p-2">
        <div class="d-flex flex-column text-center  height100" style="width: 225px;">
            <div>
                <a href="javascript:;" onclick="ListGoat()"><img src="/Main/banner/anh4.jpg" style="width:150px"></a>
            </div>
            <a href="javascript:;" onclick="ListGoat()"><h2>Goat</h2></a>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6 offset-md-3">
        <table>
            <c:forEach items="${musicList}" var="musicList">
                <tr>
                    <td>
                        <a href="javascript:;" onclick="PlayMusic(id)" id="<c:out value="${musicList.idMusic}"/>"><p
                                style="color: #00bcd4"><c:out value="${musicList.song_title}"></c:out></p></a>
                    </td>
                    <td>
                        <p style="color: #00bcd4" href="javascript:;" onclick="PlayMusic(id)"
                           id="<c:out value="${musicList.idMusic}"/>"><c:out
                                value="${musicList.song_genre}"></c:out></p>
                    </td>
                    <td>
                        <p style="color: #00bcd4" href="javascript:;" onclick="PlayMusic(id)"
                           id="<c:out value="${musicList.idMusic}"/>"><c:out
                                value="${musicList.artist_name}"></c:out></p>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div>
<div style=" width: 100% ; position: fixed ; bottom: 35px  ; height: 20px" id="Audio">

</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="List.js"></script>
</body>
</html>