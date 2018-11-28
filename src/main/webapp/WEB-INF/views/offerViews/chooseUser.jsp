<%@include file="../header.jsp" %>


<h3>Choose user to send offer:</h3>
<c:forEach var="user" items="${followed}">
    <div>
        ${user.username}<br>
        <a href="/offers/createOffer/${user.id}">Propose loan</a>
    </div>
</c:forEach>

<%@include file="../footer.jsp" %>