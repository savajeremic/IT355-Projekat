<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@include file="components/header.jsp" %>
<h1>Add game</h1>
<c:url var="addGame" value="/addGame" ></c:url>
    <div class="container">
        <div class="col-md-6 col-md-offset-3">
        <c:url var="post_url" value="/admin/addGame/" />
        <form:form method="POST" action="${post_url}" modelAttribute="game">
            <% String success = (String) request.getAttribute("successMsg");%>
            <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : "" %>
            <div class="form-group">
                <form:input type="hidden" id="id" class="form-control" placeholder="id" path="id" />
                <form:label path="name"><spring:message code="addgame"/></form:label>
                <form:input type="name" id="name" class="form-control" placeholder="name" path="name" />
            </div>
            <div class="form-group">
                <form:label path="company"><spring:message code="game.company"/></form:label>
                <form:input type="company" id="company" class="form-control" placeholder="company" path="company" />
            </div>
            <div class="form-group">
                <form:label path="description"><spring:message code="game.description"/></form:label>
                <form:input type="description" id="description" class="form-control" placeholder="description" path="description" />
            </div>
            <div class="form-group">
                <form:label path="price"><spring:message code="game.price"/></form:label>
                <form:input type="price" id="price" class="form-control" placeholder="price" path="price" />
            </div>
            <div class="form-group">
                <form:label path="rating"><spring:message code="game.rating"/></form:label>
                <form:input type="rating" id="rating" class="form-control" placeholder="rating" path="rating" />
            </div>
            <div class="form-group">
                <form:label path="cover"><spring:message code="game.cover"/></form:label>
                <form:input type="cover" id="cover" class="form-control" placeholder="cover" path="cover" />
            </div>
            <div class="form-group">
                <form:label path="votes"><spring:message code="game.votes"/></form:label>
                <form:input type="votes" id="votes" class="form-control" placeholder="votes" path="votes" />
            </div>
            <div class="form-group">
                <form:label path="version"><spring:message code="game.version"/></form:label>
                <form:input type="version" id="version" class="form-control" placeholder="version" path="version" />
            </div>
            <div class="form-group">
                <form:label path="release_date"><spring:message code="game.release_date"/></form:label>
                <form:input type="release_date" id="release_date" class="form-control" placeholder="release date" path="release_date" />
            </div>
            <div class="form-group">
                <form:label path="size"><spring:message code="game.size"/></form:label>
                <form:input type="size" id="size" class="form-control" placeholder="size" path="size" />
            </div>
            <div class="form-group">
                <form:label for="genre" path="genre"><spring:message code="game.genre"/></form:label>
                <form:select id="slcRole" class="form-control" path="genre">
                    <form:option value="">SELECT</form:option>
                    <form:options items="${genres}" itemValue="id" itemLabel="name" />
                </form:select>
            </div>

            <button type="submit" class="btn btn-primary"><spring:message code="menu.admin.add.game"/></button>
        </form:form>
    </div>
</div>
<%@include file="components/footer.jsp" %>
