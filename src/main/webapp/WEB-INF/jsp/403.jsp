<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="components/header.jsp" />

<div class="frame">
    <div class="login-box">
        <form name="form" class="form form-login" action="<c:url value='/j_spring_security_check' />" method='POST'>
            <h1 class="form-title"><spring:message code="warning.part1"/></h1>
            <c:choose>
                <c:when test="${empty username}">
                    <h2><spring:message code="menu.signin.log"/></h2>
                </c:when>
                <c:otherwise>
                    <h2>${username} <spring:message code="warning.part2"/></h2>
                </c:otherwise>
            </c:choose>
        </form>
    </div>
</div>

<jsp:include page="components/footer.jsp" />