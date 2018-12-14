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
            <img class="header center" src="https://i.pinimg.com/originals/86/c2/40/86c240e476f56331022765b6b7025e1c.png"
                 width="200px" height="200px">
            <h2 class="header center">Register your account</h2>
            <form:form method="post" class="card center" modelAttribute="user">
                <div class="form-group">
                    <form:input class="form-control" placeholder="Enter email" path="email" id="emailId"/>
                    <form:errors path="email"/><br>
                    <c:if test="${emailExists}">
                        <div class="error">This email address already exists!</div>
                    </c:if><br>
                </div>


                <div class="form-group">
                    <form:input path="username" class="form-control" placeholder="Enter username" id="usernameId"/>
                    <form:errors path="username"/><br>
                    <c:if test="${usernameExists}">
                        <div class="error">User with this username already exists!</div>
                    </c:if><br>
                </div>


                <div class="form-group">
                    <form:input path="password" class="form-control" placeholder="Enter password" type="password" id="passwordId"/>
                    <form:errors path="password"/><br>
                </div>

                <div class="form-group">
                    <form:input path="checkPassword" class="form-control" placeholder="Repeat password" type="password" id="checkPasswordId"/>
                    <form:errors path="checkPassword"/><br>
                    <c:if test="${wrongPassword}">
                        <div class="error">Please type the same password twice</div>
                    </c:if>
                </div>

                <div class="form-group">
                    <form:input path="firstName" class="form-control" placeholder="Enter Firstname" id="firstNameId"/>
                    <form:errors path="firstName"/><br>
                </div>


                <div class="form-group">
                    <form:input path="lastName" class="form-control" placeholder="Enter Lastname" id="lastNameId"/>
                    <form:errors path="lastName"/><br>
                </div>


                <div class="form-group">
                    <form:input path="address" class="form-control" placeholder="Enter address" id="addressId"/>
                    <form:errors path="address"/><br>
                </div>


                <div class="form-group">
                    <form:input path="telephone" class="form-control" placeholder="Enter telephone" id="telephoneId"/>
                    <form:errors path="telephone"/><br>
                    <c:if test="${telephoneExists}">
                        <div class="error">This telephone number already exists!</div>
                    </c:if><br>
                </div>


                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Register">
                </div>

            </form:form>

        </div>







    </div>




</div>

</body>
</html>