<%@include file="../header.jsp" %>


<form:form method="post" action="/comments/edit" modelAttribute="comment">
    <label for="textId">Your comment:</label>
    <form:textarea path="text" id="textId"/>
    <form:errors path="text"/>
    <form:hidden path="user.id" value="${comment.user.id}"/>
    <form:hidden path="tweet.id" value="${comment.tweet.id}"/>
    <form:hidden path="id" value="${comment.id}"/>
    <form:hidden path="created" value="${comment.created}"/>
    <input type="submit" value="Edit Comment">
</form:form>

<%@include file="../footer.jsp" %>