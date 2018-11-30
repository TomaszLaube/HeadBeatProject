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


            <div class="row">
                <div class="col-sm">
                    <h3>Offer Inbox:</h3>
                    <c:forEach var="offer" items="${inbox}">
                        <div class="media rounded border">
                            <img src="${offer.offered.url}" width="100px" height="100px">
                            <div class="media-body">
                                <h5 class="mt-0">
                                    <a href="/user/${offer.sender.id}">${offer.sender.username}</a> offers <a href="/headphones/headphone/${offer.offered.id}">${offer.offered.fullName}</a>
                                </h5>
                                <div>
                                    Requests: <a href="/headphones/headphone/${offer.requested.id}">${offer.requested.fullName}</a>
                                    <button class="btn btn-primary ml-3" onclick="window.location.href='/offers/offerDetailsInbox/${offer.id}'">Details</button>
                                    <br>
                                    Current status: ${offer.status.name}
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <button class="btn btn-primary" onclick="window.location.href='/offers/chooseUser'">Create Offer</button>

                </div>
                <div class="col-sm">
                    <h3>Sent Offers:</h3>
                    <c:forEach var="offer" items="${outbox}">
                        <div class="media rounded border">
                            <img src="${offer.requested.url}" width="100px" height="100px">
                            <div class="media-body">
                                <h5 class="mt-0">
                                    You asked <a href="/user/${offer.receiver.id}">${offer.receiver.username}</a> for <a href="/headphones/headphone/${offer.requested.id}">${offer.requested.fullName}</a>
                                </h5>
                                <div>
                                    Offering: <a href="/headphones/headphone/${offer.offered.id}">${offer.offered.fullName}</a>
                                    <button class="btn btn-primary ml-3" onclick="window.location.href='/offers/offerDetailsOutbox/${offer.id}'">Details</button>
                                    <br>
                                    Current status: ${offer.status.name}
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>



<%@include file="../footer.jsp" %>