<%@include file="../header.jsp" %>

<form:form method="post" modelAttribute="newHeadphone">
    <label for="manufacturerId">Manufacturer:</label>
    <form:input path="manufacturer" id="manufacturerId"/>
    <form:errors path="manufacturer"/>
    <label for="modelId">Model:</label>
    <form:input path="model" id="modelId"/>
    <form:errors path="model"/>
    <input type="submit" value="Check">
</form:form>

<%@include file="../footer.jsp" %>