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
            </nav>
            <br>
            <div class="row">
                <div class="col-sm">
                    <h3>Personal Collection</h3>
                    <c:forEach var="headphone" items="${ownHeadphones}">
                        <div class="media rounded border">
                            <img src="${headphone.url}" width="100px" height="100px">
                            <div class="media-body">
                                <h5 class="mt-0"><a
                                        href="/headphones/headphone/${headphone.id}">${headphone.fullName}</a>
                                    <c:forEach items="${userTweets}" var="tweet">
                                        <c:if test="${headphone.id == tweet.headphone.id}">
                                            REVIEWED
                                        </c:if>
                                    </c:forEach>
                                </h5>
                                <button class="btn btn-primary"
                                        onclick="window.location.href='/headphones/removeOwnership/${headphone.id}'">Not
                                    owned anymore
                                </button>
                            </div>
                        </div>
                    </c:forEach>
                    <button class="btn btn-primary" onclick="window.location.href='/headphones/add'">Add new pair
                    </button>

                </div>
                <div class="col-sm">
                    <h3>Loaned/Owned Collection</h3>
                    <c:forEach var="headphone" items="${loanedHeadphones}">
                        <div class="media rounded border">
                            <img src="${headphone.url}" width="100px" height="100px">
                            <div class="media-body">
                                <h5 class="mt-0"><a
                                        href="/headphones/headphone/${headphone.id}">${headphone.fullName}</a>
                                    <c:forEach items="${userTweets}" var="tweet">
                                        <c:if test="${headphone.id == tweet.headphone.id}">
                                            REVIEWED
                                        </c:if>
                                    </c:forEach>
                                </h5>
                                <button class="btn btn-primary"
                                        onclick="window.location.href='/headphones/moveToPersonal/${headphone.id}'">Move
                                    to Personal
                                </button>
                            </div>
                        </div>

                    </c:forEach>
                </div>
            </div>

        </div>
    </div>
</div>


<%@include file="../footer.jsp" %>