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
            </nav><br>

            <h3>Your comment:</h3>
                    <form:form method="post" class="card center" action="/comments/edit" modelAttribute="comment">
                        <form:textarea rows="5" path="text" id="textId"/>
                        <form:errors path="text"/>
                        <form:hidden path="user.id" value="${comment.user.id}"/>
                        <form:hidden path="tweet.id" value="${comment.tweet.id}"/>
                        <form:hidden path="id" value="${comment.id}"/>
                        <form:hidden path="created" value="${comment.created}"/>
                        <input type="submit" class="btn btn-primary" value="Update Comment">
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="../footer.jsp" %>