<%@include file="../header.jsp" %>


<a href="/offers/chooseUser">Create new Offer</a>

<h3>Offer inbox:</h3>
<c:forEach var="offer" items="${inbox}">
    <div>
        ${offer.sender.username}, ${offer.status.name}<br>
            Current status: ${offer.status.name}<br>
        <a href="/offers/offerDetailsInbox/${offer.id}">See details</a>
    </div>
</c:forEach>


<h3>Offer outbox:</h3>
<c:forEach var="offer" items="${outbox}">
    <div>
            ${offer.receiver.username}, ${offer.status.name}<br>
                Current status: ${offer.status.name}<br>
        <a href="/offers/offerDetailsOutbox/${offer.id}">See details</a>
    </div>
</c:forEach>
<%@include file="../footer.jsp" %>