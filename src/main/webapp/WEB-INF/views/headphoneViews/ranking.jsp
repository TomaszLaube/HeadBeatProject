<%@include file="../header.jsp" %>

<h3>Ranked Headphones</h3>
<c:forEach var="ranking" items="${rankings}" varStatus="loop">
    <h3>${loop.index +1}.</h3>
    <div>
        ${ranking.headphone.manufacturer} ${ranking.headphone.model} Rated: ${ranking.overallRating}
    </div>
</c:forEach>


<h3>Unranked headphones</h3>
<c:forEach var="headphone" items="${unrankedHeadphones}">
    <div>
            ${headphone.manufacturer} ${headphone.model} Not Rated yet
    </div>
</c:forEach>

<%@include file="../footer.jsp" %>