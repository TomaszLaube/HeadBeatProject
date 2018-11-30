<%@include file="../header.jsp" %>


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
            <br>

            <h2 class="header center">Update your account</h2>
            <form:form method="post" class="card center" modelAttribute="user">
                <div class="form-group">
                    <form:input class="form-control" required="required" placeholder="Enter email" path="email" id="emailId"/>
                    <form:errors path="email"/><br>
                </div>


                <div class="form-group">
                    <form:input path="username" class="form-control" required="required" placeholder="Enter username" id="usernameId"/>
                    <form:errors path="username"/><br>
                </div>


                <div class="form-group">
                    <form:input path="password" class="form-control" required="required" placeholder="Enter password" type="password" id="passwordId"/>
                    <form:errors path="password"/><br>
                </div>


                <div class="form-group">
                    <form:input path="firstName" class="form-control" required="required" placeholder="Enter Firstname" id="firstNameId"/>
                    <form:errors path="firstName"/><br>
                </div>


                <div class="form-group">
                    <form:input path="lastName" class="form-control" required="required" placeholder="Enter Lastname" id="lastNameId"/>
                    <form:errors path="lastName"/><br>
                </div>


                <div class="form-group">
                    <form:input path="address" class="form-control" required="required" placeholder="Enter address" id="addressId"/>
                    <form:errors path="address"/><br>
                </div>


                <div class="form-group">
                    <form:input path="telephone" class="form-control" required="required" placeholder="Enter telephone" id="telephoneId"/>
                    <form:errors path="telephone"/><br>
                </div>
                <form:hidden path="id" value="${user.id}"/>

                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Update account">
                </div>

            </form:form>

        </div>
    </div>
</div>


<%@include file="../footer.jsp" %>