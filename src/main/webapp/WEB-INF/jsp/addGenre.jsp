<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@include file="components/header.jsp" %>
<h1>Add genre</h1>
<div class="container">
    <div class="col-md-6 col-md-offset-3">
        <c:url var="addGenre" value="/addGenre" ></c:url>
        <form:form method="POST" modelAttribute="genre">
            <% String success = (String) request.getAttribute("successMsg");%>
            <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
            <div class="form-group">
                <form:input type="hidden" id="id" class="form-control" placeholder="id" path="id" />
                <form:label path="name"><spring:message code="game.name"/></form:label>
                <form:input type="name" class="form-control" id="name" placeholder="name" path="name" />
            </div>
            <button type="submit" class="btn btn-primary"><spring:message code="menu.admin.add.genre"/></button>
        </form:form>
    </div>
</div>
<%@include file="components/footer.jsp" %>