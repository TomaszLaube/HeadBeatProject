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
            <h3>Offer a loan to ${receiver.username}</h3>
            <form method="post" class="card center">

                <label for="offeredId">Pick Available Headphones to offer:</label>
                <select name="offered" class="form-control" id="offeredId" required>
                    <c:forEach var="ownership" items="${ownOwnerships}">
                        <option value="${ownership.headphone.id}">${ownership.headphone.manufacturer} ${ownership.headphone.model}</option>
                    </c:forEach>
                </select>
                <label for="requestedId">Pick Available Headphones to loan:</label>
                <select name="requested" class="form-control" id="requestedId" required>
                    <c:forEach var="ownership" items="${userOwnerships}">
                        <option value="${ownership.headphone.id}"> ${ownership.headphone.manufacturer} ${ownership.headphone.model}</option>
                    </c:forEach>
                </select>
                <input type="submit" class="btn btn-primary" value="Send Offer">
            </form>


        </div>
    </div>
</div>




<%@include file="../footer.jsp" %>