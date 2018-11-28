<%@include file="../header.jsp" %>

<h3>Personal Collection</h3>
<c:forEach var="headphone" items="${ownHeadphones}">
    <div>
        <div><img src="${headphone.url}" width="100px" height="100px"></div>
            ${headphone.manufacturer},${headphone.model}
        <c:forEach items="${userTweets}" var="tweet">
            <c:if test="${headphone.id == tweet.headphone.id}">
                <h3>REVIEWED</h3>
            </c:if>
        </c:forEach>
        <a href="/headphones/headphone/${headphone.id}">Details</a>
        <a href="/headphones/removeOwnership/${headphone.id}">I don't own these anymore</a>
    </div>
</c:forEach>

<h3>Loaned/Owned Collection</h3>
<c:forEach var="headphone" items="${loanedHeadphones}">
    <div>
        <div><img src="${headphone.url}" width="100px" height="100px"></div>
            ${headphone.manufacturer},${headphone.model}
        <c:forEach items="${userTweets}" var="tweet">
            <c:if test="${headphone.id == tweet.headphone.id}">
                <h3>REVIEWED</h3>
            </c:if>
        </c:forEach>
        <a href="/headphones/headphone/${headphone.id}">Details</a>
        <a href="/headphones/moveToPersonal/${headphone.id}">Move to Personal</a>
    </div>
</c:forEach>

<a href="/headphones/add">Add Headphone</a>
<%@include file="../footer.jsp" %>