<%@include file="../header.jsp" %>

<div>
    ${ranking.headphone.fullName} Ranked: ${ranking.overallRating}
</div>
<div>
    <c:forEach var="tweet" items="${tweets}">
        <div>
            ${tweet.user.username} reviewed  ${ranking.headphone.fullName}<br>
            Ranked: ${tweet.rating}<br>
                <div>
                        ${tweet.review}
                </div>
                <a href="/tweets/tweetDetails/${tweet.id}">Details</a><br>

        </div>
    </c:forEach>
</div>
<c:if test="${toReview}">
<div>
    <h3>Add your review:</h3>
    <form method="post" action="/tweets/addTweetOwn/${ranking.headphone.id}">
        <label for="reviewId">Your Review of ${ranking.headphone.fullName}:</label>
        <input type="textarea" name="review" id="reviewId" required>
        <label for="ratingId">Your rating:</label>
        <select name="rating" id="ratingId" required>
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
        <input type="submit" value="Tweet Review">
    </form>
</div>
</c:if>

<%@include file="../footer.jsp" %>