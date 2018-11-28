<%@include file="../header.jsp" %>

<h3>Tweet:</h3>
<div>
    ${tweet.user.username} tweets:<br>
    ${tweet.review}, Rated: ${tweet.rating}
</div>
<div>
    <c:forEach var="comment" items="${comments}">
        <div>
            ${comment.user.username}<br>
            ${comment.text}<br>
            <a href="/comments/edit/${comment.id}">Edit</a>
        </div>
    </c:forEach>
</div>

<form:form method="post" action="/comments/add" modelAttribute="newComment">
    <label for="textId">Your comment:</label>
    <form:textarea path="text" id="textId"/>
    <form:errors path="text"/>
    <form:hidden path="user.id" value="${user.id}"/>
    <form:hidden path="tweet.id" value="${tweet.id}"/>
    <input type="submit" value="Comment">
</form:form>

<%@include file="../footer.jsp" %>