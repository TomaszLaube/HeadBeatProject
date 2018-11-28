<%@include file="../header.jsp" %>

<c:if test="${not empty proposedHeadphones}">
    <h3>Proposed headphones from the database:</h3>
    <c:forEach var="proposition" items="${proposedHeadphones}">
        <div>
                ${proposition.manufacturer}, ${proposition.model}, <a href="/headphones/assign/${proposition.id}">Add these</a>
        </div>
    </c:forEach>
    <a href="/headphones/addNew">I'm not seeing my headphones</a>
</c:if>
<c:if test="${empty proposedHeadphones}">
    <h3>No similar headphones found in the Database</h3>
    <a href="/headphones/addNew">Add new Headphone model</a>
</c:if>
<%@include file="../footer.jsp" %>