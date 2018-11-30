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


            <h3>${tweet.user.username} tweeted:</h3>
            <div class="media rounded border">
                <img class="mr-3 rounded border" src="${tweet.headphone.url}" width="150px" height="150px"
                     alt="Generic placeholder image">
                <div class="media-body">
                    <h5 class="mt-0"><a
                            href="/headphones/headphone/${tweet.headphone.id}">${tweet.headphone.fullName}</a>
                        by <a href="/user/${tweet.user.id}">${tweet.user.username}</a> (Rated: ${tweet.rating})
                    </h5>
                    ${tweet.review}<br>
                    <br><br><br><br>
                    <h4>Comments section:</h4>
                    <c:forEach var="comment" items="${comments}">
                        <div class="media mt-3 border rounded">
                            <img class="mr-3 rounded border"
                                 src="https://i.pinimg.com/originals/86/c2/40/86c240e476f56331022765b6b7025e1c.png"
                                 width="40px" height="40px">
                            <div class="media-body border">
                                <h5 class="mt-0"><a href="/user/${comment.user.id}">${comment.user.username}</a></h5>
                                    ${comment.text}<br> <a href='/comments/edit/${comment.id}'">Edit Comment</a>
                            </div>
                        </div>

                    </c:forEach><br>
                    <form:form method="post" class="card center" action="/comments/add" modelAttribute="newComment">
                        <form:textarea rows="5" path="text" required="required" placeholder="Your comment" id="textId"/>
                        <form:errors path="text"/>
                        <form:hidden path="user.id" value="${user.id}"/>
                        <form:hidden path="tweet.id" value="${tweet.id}"/>
                        <input type="submit" class="btn btn-primary" value="Comment">
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="../footer.jsp" %>