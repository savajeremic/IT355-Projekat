<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="components/header.jsp" />

<div id="loginModal" role="dialog">
    <div class="login-box">
        <form name="form" class="form form-login" action="<c:url value='/j_spring_security_check' />" method='POST'>
            <h2 class="form-title">log in</h2>
            <c:if test="${not empty error}">
                <div class="error alert alert-warning">${error}</div>
            </c:if>
            <c:if test="${not empty msg}">
                <div class="msg alert alert-info"><strong>${msg}</strong></div>
                    </c:if>
            <div class="form-group">
                <input type="text" placeholder="Username" id="username" type="text" class="form-control" name="username">
            </div>
            <div class="form-group">
                <input type="password" placeholder="Password" id="password" class="form-control" name="password">
            </div>
            <div class="form-group">
                <button class="gd-btn menu-btn-log form-btn">Login</button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
    </div>
</div>

<jsp:include page="components/footer.jsp" />