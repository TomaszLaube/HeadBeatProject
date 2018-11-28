<%@include file="../header.jsp" %>


<h3>Offer Details</h3>

<div>
    Sender:${offer.sender.username}<br>
    Receiver:${offer.receiver.username}<br>
    Offered Headphones:${offer.offered.manufacturer} ${offer.offered.model}<br>
    Requested Headphones:${offer.requested.manufacturer} ${offer.requested.model}<br>
    Current Status:${offer.status.name}
    <c:if test="${responsive}">
        <c:if test="${offer.status.id == 1}">
            <button onclick="window.location.href='/offers/acceptOffer/${offer.id}'">Accept Offer</button>
            <button onclick="window.location.href='/offers/declineOffer/${offer.id}'">Decline Offer</button>
        </c:if>
        <c:if test="${offer.status.id==2}">
            <button onclick="window.location.href='/offers/endLoan/${offer.id}'">Finish Loan</button>
        </c:if>
        <c:if test="${offer.status.id==4}">
            <c:if test="${not empty tweet}">
                <div>
                        ${tweet.review}
                </div>
            </c:if>
            <c:if test="${empty tweet}">
                <form method="post" action="/tweets/addTweetReceiver/${offer.id}">
                    <label for="reviewId1">Your Review of ${offer.offered.manufacturer} ${offer.offered.model}:</label>
                    <input type="textarea" name="review" id="reviewId1" required>
                    <label for="ratingId1">Your rating:</label>
                    <select name="rating" id="ratingId1" required>
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
            </c:if>
        </c:if>
    </c:if>
    <c:if test="${not responsive && offer.status.id==4}">
        <c:if test="${not empty tweet}">
            <div>
                    ${tweet.review}
            </div>
        </c:if>
        <c:if test="${empty tweet}">
            <form method="post" action="/tweets/addTweetSender/${offer.id}">
                <label for="reviewId2">Your Review of ${offer.requested.manufacturer} ${offer.requested.model}:></label>
                <input type="textarea" name="review" id="reviewId2" required>
                <label for="ratingId2">Your rating:</label>
                <select name="rating" id="ratingId2" required>
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
        </c:if>
    </c:if>
</div>


<%@include file="../footer.jsp" %>