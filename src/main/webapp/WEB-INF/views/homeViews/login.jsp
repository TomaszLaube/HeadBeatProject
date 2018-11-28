<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tlaube
  Date: 25.11.18
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HeadBeat</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <div class="card">
        <div class="card-body">
            <img class="header center"
                 src="https://i.pinimg.com/originals/86/c2/40/86c240e476f56331022765b6b7025e1c.png"
                 width="300px" height="300px">
            <h2 class="header center">Welcome to HeadBeat</h2>
            <form method="post" class="card center">

                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Enter username" name="username"
                           id="usernameId"><br>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Enter password"
                           id="passwordId">
                    <c:if test="${notLogged}">
                        <div class="error">Incorrect login data</div>
                    </c:if><br>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Login">
                </div>
            </form>
            <div class="center">
                <button onclick="window.location.href='/register'" class="btn btn-primary">Register</button>
            </div>
        </div>
    </div>
</div>


</body>
</html>
