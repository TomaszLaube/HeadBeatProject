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



            <h3>Look for someone new:</h3>
            <form method="post" class="card center">
                <div class="form-group">
                    <label  for="selectorId">Search by:</label>
                    <select name="selector" class="form-control" id="selectorId" required>
                        <option value="username">Username</option>
                        <option value="email">E-mail</option>
                        <option value="lastName">Lastname</option>
                        <option value="telephone">Telephone</option>
                    </select>
                </div>

                <div class="form-group">
                    <input type="text" name="keyword" class="form-control" placeholder="Enter keyword" id="keywordId">
                </div>

                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Find">
                </div>

            </form>

            <c:if test="${searchInit}">
                <c:if test="${empty searchResults}">
                    <h3>No search results found. Try again...</h3>
                </c:if>
                <c:if test="${not empty searchResults}">
                    <h3>Search Results:</h3>
                    <c:forEach var="user" items="${searchResults}">

                        <div>
                            <a href="/user/${user.id}">${user.username}<br></a>
                        </div>
                    </c:forEach>
                </c:if>

            </c:if>


            <h3>Whole Community</h3>
            <c:forEach var="user" items="${allUsers}">
                <div>
                    <a href="/user/${user.id}">${user.username}<br></a>
                </div>
            </c:forEach>

            <%@include file="../footer.jsp" %>

        </div>
    </div>
</div>





