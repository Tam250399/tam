<%--
  Created by IntelliJ IDEA.
  model.entities.User: Admin
  Date: 3/15/2021
  Time: 8:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body style="background-image:url('/Regiter/img/anh4.jpg')">
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6 offset-3" style="line-height: 60px;">
            <legend style="color:red; font-size:30px"><a href="#"><i class="glyphicon glyphicon-globe"></i></a> Đăng ký thành viên!!
            </legend>
            <form method="post" class="form" role="form">
                <div class="row">
                    <div class="col-md-12"> <input class="form-control" name="UserName" placeholder="UserName" required="" autofocus="" type="text">
                    </div>
                    <div class="col-xs-6 col-md-6"> <input class="form-control" name="firstname" placeholder="Họ" required="" autofocus="" type="text">
                    </div>
                    <div class="col-xs-6 col-md-6"> <input class="form-control" name="lastname" placeholder="Tên" required="" type="text">
                    </div>
                </div> <input class="form-control" name="youremail" placeholder="Email" type="email"> <input class="form-control" name="password" placeholder="Mật khẩu" required="" autofocus=""  type="password">
                <input class="form-control" required="" autofocus=""  name="retypepassword" placeholder="Nhập lại mật khẩu"
                                                                                                                                                                                                 type="password"> <label> Ngày sinh</label>
                <div class="row">
                    <div class="col-xs-4 col-md-4"> <select class="form-control">              <option value="Day">Ngày</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>         </select>
                    </div>
                    <div class="col-xs-4 col-md-4"> <select class="form-control">              <option value="Month">Tháng</option>

                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>            </select>
                    </div>
                    <div class="col-xs-4 col-md-4"> <select class="form-control">              <option value="Year">Năm</option>
                        <option>2000</option>
                        <option>1999</option>
                        <option>1998</option>
                        <option>1996</option>
                        <option>1995</option>
                        <option>1993</option>
                        <option>1992</option>
                        <option>1991</option>
                        <option>1982</option>          </select>
                    </div>
                </div>
                <label class="radio-inline">

                    <input name="sex" id="inlineCheckbox1" value="male" type="radio">Nam </label>
                <label class="radio-inline"> <input name="sex" id="inlineCheckbox2" value="female" type="radio"> Nữ </label>
                <br>
                <br>
                <button class="btn btn-lg btn-primary btn-block" type="submit" > Đăng ký</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
