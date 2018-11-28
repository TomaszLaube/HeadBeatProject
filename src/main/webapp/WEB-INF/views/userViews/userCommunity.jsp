<%@include file="../header.jsp" %>

<h3>Look for someone new:</h3>
<form method="post">
    <label for="selectorId">Search by:</label>
    <select name="selector" id="selectorId" required>
        <option value="username">Username</option>
        <option value="email">E-mail</option>
        <option value="lastName">Lastname</option>
        <option value="telephone">Telephone</option>
    </select>
    <label for="keywordId">Keyword:</label>
    <input type="text" name="keyword" id="keywordId">
    <input type="submit" value="Find">
</form>

<c:if test="${searchInit}">
    <c:if test="${empty searchResults}">
        <h3>No search results found. Try again...</h3>
    </c:if>
    <c:if test="${not empty searchResults}">
        <c:forEach var="user" items="${searchResults}">
            <div>
                    ${user.username}<br>
                <a href="/user/${user.id}">See profile</a>
            </div>
        </c:forEach>
    </c:if>

</c:if>


<h3>Whole Community</h3>
<c:forEach var="user" items="${allUsers}">
    <div>
            ${user.username}<br>
        <a href="/user/${user.id}">See profile</a>
    </div>
</c:forEach>

<%@include file="../footer.jsp" %>