<%@include file="../header.jsp" %>

${user.username}
<h3>Personal Collection:</h3>
<c:forEach var="ownership" items="${ownCollection}">
    <div>
            ${ownership.headphone.fullName}
    </div>
</c:forEach>

<h3>Loaned/Owned Collection:</h3>
<c:forEach var="ownership" items="${loanedCollection}">
    <div>
            ${ownership.headphone.fullName}
    </div>
</c:forEach>

<c:if test="${not selfFollow}">
    <c:if test="${not followed}">
        <button onclick="window.location.href='/user/follow/${user.id}'">Follow</button>
    </c:if>
    <c:if test="${followed}">
        <button onclick="window.location.href='/user/unfollow/${user.id}'">Unfollow</button>
    </c:if>
</c:if>

<div>
    <c:forEach var="tweet" items="${tweets}">
        <div>
            ${tweet.user.username} reviewed ${tweet.headphone.fullName}
            ${tweet.review}
        </div>
    </c:forEach>
</div>

<div>
    <h3>
        Users being followed(${observedUsers.size()} in total):
    </h3>
    <c:forEach var="user" items="${observedUsers}">
        ${user.username}<br>

    </c:forEach>
</div>
<div>
    <h3>
        Users following:(${observers.size()} in total):
    </h3>
    <c:forEach var="user" items="${observers}">
        ${user.username}<br>

    </c:forEach>
</div>

<%@include file="../footer.jsp" %>