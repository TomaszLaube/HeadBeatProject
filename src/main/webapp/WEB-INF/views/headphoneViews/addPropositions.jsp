<%@include file="../header.jsp" %>



<div class="container">
    <div class="card">
        <div class="card-body">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary rounded">
                <a class="navbar-brand" href="/home">
                    <img class="header"
                         src="https://i.pinimg.com/originals/86/c2/40/86c240e476f56331022765b6b7025e1c.png"
                         width="30px" height="35px">
                </a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li >
                            <h7 class="nav-link">${loggedUser.username}:</h7>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="/user/account">Account<span class="sr-only">(current)</span></a>
                        </li>

                        <li class="nav-item active">
                            <a class="nav-link" href="/user/community">Community<span
                                    class="sr-only">(current)</span></a>
                        </li>

                        <li class="nav-item active">
                            <a class="nav-link" href="/headphones/collection">Headphones<span
                                    class="sr-only">(current)</span></a>
                        </li>

                        <li class="nav-item active">
                            <a href="/offers/offerBox" class="nav-link">Offers<span class="sr-only">(current)</span></a><br>
                        </li>

                        <li class="nav-item active">
                            <a class="nav-link" href="/headphones/ranking">Ranking<span class="sr-only">(current)</span></a>
                        </li>

                        <li class="nav-item active">
                            <a class="nav-link" href="/logout">Logout<span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                </div>
            </nav>
            <br>


            <c:if test="${not empty proposedHeadphones}">
                <h3>Proposed headphones from the database:</h3>
                <c:forEach var="proposition" items="${proposedHeadphones}">
                    <div class="media rounded border">
                        <img class="mr-3 rounded border" src="${proposition.url}" width="100px" height="100px"
                             alt="Generic placeholder image">
                        <div class="media-body">
                            <h5 class="mt-0"><a href="/headphones/headphone/${proposition.id}">${proposition.fullName}</a></h5>
                            <button class="btn btn-success" onclick="window.location.href='/headphones/assign/${proposition.id}'">Add these</button>
                        </div>
                    </div>

                </c:forEach>
                <button class="btn btn-danger" onclick="window.location.href='/headphones/addNew'">I'm not seeing my headphones</button>
            </c:if>
            <c:if test="${empty proposedHeadphones}">
                <h3>No similar headphones found in the Database</h3>
                <button class="btn btn-primary" onclick="window.location.href='/headphones/addNew'">Add new headphone model</button>
            </c:if>


        </div>
    </div>
</div>




<%@include file="../footer.jsp" %>