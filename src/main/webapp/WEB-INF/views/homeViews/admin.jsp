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


<h3>New headphones in Database:</h3>
<div>
    <c:forEach var="headphone" items="${newHeadphones}">
        <div>
            <div>
                <img src="${headphone.url}" width="100px" height="100px">
            </div>
                ${headphone.fullName} <a href="/editData/${headphone.id}">Edit Data</a>
        </div>
    </c:forEach>
</div>

<h3>Remaining headphones in Database:</h3>
<div>
    <c:forEach var="headphone" items="${remainingHeadphones}">
        <div>
            <div>
                <img src="${headphone.url}" width="100px" height="100px">
            </div>
                ${headphone.fullName} <a href="/editData/${headphone.id}">Edit Data</a>
        </div>
    </c:forEach>
</div>
<%@include file="../footer.jsp" %>

