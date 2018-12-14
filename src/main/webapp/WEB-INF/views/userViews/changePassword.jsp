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

            <h2 class="header center">Change your password</h2>
            <form class="padding-small text-center" method="post">
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Current Password" name="oldPassword" required/>
                    <c:if test="${incorrectOldPassword}">
                        <div class="error">Enter correct password!</div>
                    </c:if>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="New password" name="newPassword" required/>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Repeat new password" name="newPasswordCheck" required/>
                    <c:if test="${incorrectNewPassword}">
                        <div class="error">Enter new password twice!</div>
                    </c:if>
                </div>
                <button class="btn btn-color rounded-0" type="submit">Change password</button>
            </form>
        </div>
    </div>
</div>




<%@include file="../footer.jsp" %>
