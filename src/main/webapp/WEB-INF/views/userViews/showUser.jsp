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

            <c:if test="${not selfFollow}">
                <c:if test="${not followed}">
                    <button class="btn btn-primary" onclick="window.location.href='/user/follow/${user.id}'">Follow</button>
                </c:if>
                <c:if test="${followed}">
                    <button class="btn btn-primary" onclick="window.location.href='/user/unfollow/${user.id}'">Unfollow</button>
                </c:if>
            </c:if>

            <h3>${user.username}'s personal data:</h3>
            <div class=" border rounded">
                Email: ${user.email}<br>
                Username: ${user.username}<br>
                Firstname: ${user.firstName}<br>
                Lastname: ${user.lastName}<br>
                Address: ${user.address}<br>
                Telephone: ${user.telephone}<br>
            </div><br>
            <br><br>

            <div class="row">
                <div class="col-sm">
                    <h3>Personal Collection</h3>
                    <c:forEach var="ownership" items="${ownCollection}">
                        <div class="media rounded border">
                            <img src="${ownership.headphone.url}" width="100px" height="100px">
                            <div class="media-body">
                                <h5 class="mt-0"><a
                                        href="/headphones/headphone/${ownership.headphone.id}">${ownership.headphone.fullName}</a>
                                    <c:forEach items="${userTweets}" var="tweet">
                                        <c:if test="${headphone.id == tweet.headphone.id}">
                                            REVIEWED
                                        </c:if>
                                    </c:forEach>
                                </h5>
                            </div>
                        </div>
                    </c:forEach>


                </div>





                <div class="col-sm">
                    <h3>Loaned/Owned Collection</h3>
                    <c:forEach var="ownership" items="${loanedCollection}">
                        <div class="media rounded border">
                            <img src="${ownership.headphone.url}" width="100px" height="100px">
                            <div class="media-body">
                                <h5 class="mt-0"><a
                                        href="/headphones/headphone/${ownership.headphone.id}">${ownership.headphone.fullName}</a>
                                    <c:forEach items="${userTweets}" var="tweet">
                                        <c:if test="${headphone.id == tweet.headphone.id}">
                                            REVIEWED
                                        </c:if>
                                    </c:forEach>
                                </h5>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <br>


            <div><br>
                <h3> ${user.username}'s latest tweets:</h3>
                <div>
                    <c:forEach var="tweet" items="${tweets}">
                        <div class="media rounded border">
                            <img class="mr-3 rounded border" src="${tweet.headphone.url}" width="150px" height="150px"
                                 alt="Generic placeholder image">
                            <div class="media-body">
                                <h5 class="mt-0"><a
                                        href="/headphones/headphone/${tweet.headphone.id}">${tweet.headphone.fullName}</a>
                                    by <a href="/user/${tweet.user.id}">${tweet.user.username}</a> (Rated: ${tweet.rating})
                                </h5>
                                    ${tweet.review}<br>
                                <a href="/tweets/tweetDetails/${tweet.id}">Details</a><br>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div><br><br>



            <div class="container">
                <div class="row">
                    <div class="col-sm border rounded">
                        <h3>
                            ${user.username} follows (${observedUsers.size()} in total):
                        </h3>
                        <c:forEach var="user" items="${observedUsers}">
                            <a href="/user/${user.id}">${user.username}</a><br>
                        </c:forEach>
                    </div>
                    <div class="col-sm border rounded">
                        <h3>
                            Users following ${user.username} (${observers.size()} in total):
                        </h3>
                        <c:forEach var="user" items="${observers}">
                            <a href="/user/${user.id}">${user.username}</a><br>

                        </c:forEach>
                    </div>
                </div>
            </div>




        </div>
    </div>
</div>




<%@include file="../footer.jsp" %>