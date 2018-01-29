<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@include file="components/header.jsp" %>
<c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
    <c:if test="${!empty userItems}">
        <div class="container">
            <div class="row">
                <section class="content">
                    <h1><spring:message code="user.yourgames"/></h1>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="table-container">
                                    <% String success = (String) request.getAttribute("successMsg");%>
                                    <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
                                    <% String error = (String) request.getAttribute("error");%>
                                    <%= (error != null) ? "<div class=\"alert alert-danger\">" + error + "</div>" : ""%>
                                    <table class="table table-filter">
                                        <tbody>
                                            <c:forEach items="${userItems}" var="items">
                                                <tr>
                                                    <td>
                                                        <input type="hidden" name="id" id="id" path="id" value="${items.game.id}" />
                                                        <div class="media">
                                                            <a class="pull-left">
                                                                <img src="${items.game.cover}" class="media-photo">
                                                            </a>
                                                            <div class="media-body">
                                                                <span class="media-meta pull-right">
                                                                    <button type="submit" class="gd-btn buy-btn">OWNED</button>
                                                                </span>
                                                                <h4 class="title">
                                                                    ${items.game.name}
                                                                    <span class="pull-right">
                                                                        <i class="fa fa-heart wishlist" aria-hidden="true"></i>
                                                                        <p class="wishlist-text"><spring:message code="game.addtowishlist"/>t</p>
                                                                    </span>
                                                                </h4>
                                                                <p class="summary">${items.game.genre}</p>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </c:if>
</c:if>