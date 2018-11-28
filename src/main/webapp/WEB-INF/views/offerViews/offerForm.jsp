<%@include file="../header.jsp" %>

<h3>Offer loan to ${receiver.username}</h3>
<form method="post">
   <label for="offeredId">Pick Available Headphones to offer:</label>
    <select name="offered" id="offeredId" required>
        <c:forEach var="ownership" items="${ownOwnerships}">
            <option value="${ownership.headphone.id}">${ownership.headphone.manufacturer} ${ownership.headphone.model}</option>
        </c:forEach>
    </select>
    <label for="requestedId">Pick Available Headphones to loan:</label>
    <select name="requested" id="requestedId" required>
        <c:forEach var="ownership" items="${userOwnerships}">
            <option value="${ownership.headphone.id}">${ownership.headphone.manufacturer} ${ownership.headphone.model}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Send Offer">
</form>
<%@include file="../footer.jsp" %>