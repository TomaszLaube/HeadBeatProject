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

            <div class="media rounded border">
                <img src="${ranking.headphone.url}" width="200px" height="200px">
                <div class="media-body">
                    <h5 class="mt-0">
                        <a href="/headphones/headphone/${ranking.headphone.id}">${ranking.headphone.fullName}</a>
                    </h5>
                    <div>
                        Rated: ${ranking.overallRating}
                    </div>
                </div>
            </div>
            <br>
            <h3>Latest Tweets of ${ranking.headphone.fullName}:</h3>
            <div>
                <c:forEach var="tweet" items="${tweets}">
                    <div class="media rounded border">
                        <img class="mr-3 rounded border" src="${tweet.headphone.url}" width="150px" height="150px"
                             alt="Generic placeholder image">
                        <div class="media-body">
                            <h5 class="mt-0"><a href="/user/${tweet.user.id}">${tweet.user.username}</a> (Rated: ${tweet.rating})
                            </h5>
                                ${tweet.review}<br>
                            <a href="/tweets/tweetDetails/${tweet.id}">Details</a><br>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${toReview}">
                <br>
                <div>
                    <h3>Add your review:</h3>
                    <form method="post" class="card center" action="/tweets/addTweetOwn/${ranking.headphone.id}">
                        <input type="textarea" name="review" id="reviewId" required>
                        <label for="ratingId">Your rating:</label>
                        <select name="rating" class="form-control" id="ratingId" required>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select>
                        <input type="submit" class="btn btn-primary" value="Tweet Review">
                    </form>
                </div>
            </c:if>
        </div>
    </div>
</div>





<%@include file="../footer.jsp" %>