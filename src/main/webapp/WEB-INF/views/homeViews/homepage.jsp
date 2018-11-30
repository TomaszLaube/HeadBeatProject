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
                            <c:if test="${newOffers.size() == 0}">
                                <a href="/offers/offerBox" class="nav-link">Offers<span class="sr-only">(current)</span></a><br>
                            </c:if>
                            <c:if test="${newOffers.size() > 0}">
                                <a href="/offers/offerBox" class="nav-link">Offers(${newOffers.size()})<span
                                        class="sr-only">(current)</span></a><br>
                            </c:if>
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
            <h3>Latest Tweets:</h3>
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
        </div>
    </div>
</div>

<%@include file="../footer.jsp" %>