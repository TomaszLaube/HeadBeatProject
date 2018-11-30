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


            <div class="border rounded">
                <h3>Offer Details</h3>
                From:${offer.sender.username}<br>
                To:${offer.receiver.username}<br>
                Offered Headphones:${offer.offered.manufacturer} ${offer.offered.model}<br>
                Requested Headphones:${offer.requested.manufacturer} ${offer.requested.model}<br>
                Current Status:${offer.status.name}<br>
                <c:if test="${responsive}">
                    <c:if test="${offer.status.id == 1}">
                        <button class="btn btn-success" onclick="window.location.href='/offers/acceptOffer/${offer.id}'">Accept Offer</button>
                        <button class="btn btn-danger" onclick="window.location.href='/offers/declineOffer/${offer.id}'">Decline Offer</button>
                    </c:if>
                    <c:if test="${offer.status.id==2}">
                        <button class="btn btn-primary" onclick="window.location.href='/offers/endLoan/${offer.id}'">Finish Loan</button>
                    </c:if>
                    <br>
                    <c:if test="${offer.status.id==4}">
                        <c:if test="${not empty tweet}">
                            <h4>Your review:</h4>
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
                        </c:if>

                        <c:if test="${empty tweet}">

                            <form method="post" class="card center" action="/tweets/addTweetReceiver/${offer.id}">
                                <h3>Add your review of ${offer.offered.fullName}</h3>
                                <input type="textarea" rows="5" name="review" placeholder="Your review of ${offer.offered.manufacturer}" id="reviewId1" required>


                                <h3>Your rating</h3>
                                <div>
                                <select name="rating" class="form-control" id="ratingId1" required>
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
                                </div>

                                <input type="submit" class="btn btn-primary" value="Tweet Review">
                            </form>
                        </c:if>
                    </c:if>
                </c:if>
                <br>
                <c:if test="${not responsive && offer.status.id==4}">
                    <c:if test="${not empty tweet}">
                        <br><h4>Your review:</h4>
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
                    </c:if>
                    <c:if test="${empty tweet}">
                        <form method="post" class="card center" action="/tweets/addTweetSender/${offer.id}">
                            <h3>Add your review of ${offer.requested.fullName}</h3>
                            <input type="textarea" rows="5" name="review" id="reviewId2" required>
                            <h3>Your rating</h3>
                            <div>
                            <select name="rating" class="form-control" id="ratingId2" required>
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
                            </div>
                            <input type="submit" class="btn btn-primary" value="Tweet Review">
                        </form>
                    </c:if>
                </c:if>
            </div>

        </div>
    </div>
</div>





<%@include file="../footer.jsp" %>