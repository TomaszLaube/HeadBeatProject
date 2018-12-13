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
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary rounded">
                <a class="navbar-brand" href="/home">
                    <img class="header"
                         src="https://i.pinimg.com/originals/86/c2/40/86c240e476f56331022765b6b7025e1c.png"
                         width="30px" height="35px">
                </a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li >
                            <h7 class="nav-link">${loggedUser.username}:</h7>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="/user/account">Account<span class="sr-only">(current)</span></a>
                        </li>

                        <li class="nav-item active">
                            <a class="nav-link" href="/user/community">Community<span
                                    class="sr-only">(current)</span></a>
                        </li>

                        <li class="nav-item active">
                            <a class="nav-link" href="/headphones/collection">Headphones<span
                                    class="sr-only">(current)</span></a>
                        </li>

                        <li class="nav-item active">
                            <a href="/offers/offerBox" class="nav-link">Offers<span class="sr-only">(current)</span></a><br>
                        </li>

                        <li class="nav-item active">
                            <a class="nav-link" href="/headphones/ranking">Ranking<span class="sr-only">(current)</span></a>
                        </li>

                        <li class="nav-item active">
                            <a class="nav-link" href="/logout">Logout<span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                </div>
            </nav>
            <%--
                       <h3>Headphones in DB:</h3>
                       <c:forEach var="headphone" items="${remainingHeadphones}" varStatus="loop">
                           <div class="media rounded border">
                               <img src="${headphone.url}" width="100px" height="100px">
                               <div class="media-body">
                                   <h5 class="mt-0">
                                       <a href="/headphones/headphone/${headphone.id}">${headphone.fullName}</a></h5>
                                   <button class="btn btn-primary" onclick="window.location.href='/editData/${headphone.id}'">Edit data</button>

                               </div>
                           </div>
                       </c:forEach>
                       --%>

            <div class="row">
                <div class="col-sm">
                    <h3>New headphones in database:</h3>
                    <c:forEach var="headphone" items="${newHeadphones}">
                        <div class="media rounded border">
                            <img src="${headphone.url}" width="100px" height="100px">
                            <div class="media-body">
                                <h5 class="mt-0">
                                    <a href="/headphones/headphone/${headphone.id}">${headphone.fullName}</a></h5>
                                    <button class="btn btn-primary" onclick="window.location.href='/editData/${headphone.id}'">Edit data</button>

                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div class="col-sm">
                    <h3>Remaining headphones:</h3>
                    <c:forEach var="headphone" items="${remainingHeadphones}" varStatus="loop">
                        <div class="media rounded border">
                            <img src="${headphone.url}" width="100px" height="100px">
                            <div class="media-body">
                                <h5 class="mt-0">
                                    <a href="/headphones/headphone/${headphone.id}">${headphone.fullName}</a></h5>
                                    <button class="btn btn-primary" onclick="window.location.href='/editData/${headphone.id}'">Edit data</button>

                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>
    </div>
</div>



<%@include file="../footer.jsp" %>

