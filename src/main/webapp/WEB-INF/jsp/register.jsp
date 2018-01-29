<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="components/header.jsp" />

<!-- Modal Register -->
<div id="registerModal"role="dialog">
    <div class="login-box">
        <form:form method="POST" modelAttribute="user" class="form form-login" role="form">
            <% String success = (String) request.getAttribute("successMsg");%>
            <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
            <% String error = (String) request.getAttribute("error");%>
            <%= (error != null) ? "<div class=\"alert alert-danger\">" + error + "</div>" : ""%>
            <h2 class="form-title"><spring:message code="menu.signin.reg"/></h2>
            <div class="form-group">
                <label for="email"><spring:message code="user.email"/></label>
                <input id="email" name="email" class="field-input">
            </div>
              
            <div class="form-group">
                <label for="username"><spring:message code="user.username"/></label>
                <input type="username" class="form-control" name="username"/>
            </div>
              
            <div class="form-group">
                <label for="password"><spring:message code="user.password"/></label>
                <input type="password" class="form-control" name="password"/>
            </div>
              
            <div class="form-group">
                <button class="gd-btn menu-btn-reg form-btn"><spring:message code="menu.signin.reg"/></button>
            </div>
        </form:form>
    </div>
</div>

<jsp:include page="components/footer.jsp" />
