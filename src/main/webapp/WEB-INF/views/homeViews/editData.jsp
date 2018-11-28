<%@include file="../header.jsp" %>
<h3>Type the url for ${headphone.fullName} picture: </h3>
<form:form method="post" modelAttribute="headphone">
    <form:hidden path="id" value="${headphone.id}"/>
    <label for="manufacturerId">Manufacturer:</label>
    <form:input path="manufacturer" id="manufacturerId"/>
    <form:errors path="manufacturer"/>
    <label for="modelId">Model:</label>
    <form:input path="model" id="modelId"/>
    <form:errors path="model"/>
    <label for="urlId">Full Url:</label>
    <form:input path="url" id="urlId"/>
    <form:errors path="url"/>
    <input type="submit" value="Update data">
</form:form>
<%@include file="../footer.jsp" %>

