<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@include file="components/header.jsp" %>

<div class="container">
    <div class="row">
        <section class="content">
            <h1><spring:message code="cart.games"/></h1>
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
                                    <c:if test="${!empty items}">
                                        <c:forEach items="${items}" var="items">
                                            <tr>
                                                <td>
                                                    <input type="hidden" name="id" id="id" path="id" value="${items.game.id}" />
                                                    <div class="media">
                                                        <a class="pull-left">
                                                            <img src="${items.game.cover}" class="media-photo">
                                                        </a>
                                                        <div class="media-body">
                                                            <span class="media-meta pull-right">
                                                                <a href="<c:url value='/deleteFromCart/${items.game.id}'/>">
                                                                    <button type="submit" class="gd-btn buy-btn">Remove from cart</button>
                                                                </a>
                                                            </span>
                                                            <h4 class="title">
                                                                ${items.game.name}
                                                                <span class="pull-right">
                                                                    <i class="fa fa-heart wishlist" aria-hidden="true"></i>
                                                                    <p class="wishlist-text"><spring:message code="game.addtowishlist"/></p>
                                                                </span>
                                                            </h4>
                                                            <p class="summary">${items.game.genre}</p>
                                                        </div>
                                                    </div>
                                                </td>
                                                <c:if test="${empty items}">
                                                    <c:url var="games"  value="/viewGames/" />
                                                    <td>
                                                        <h1>User, you have no games in your cart! <br />
                                                            <a href='${games}'>
                                                                <button type="submit" class="gd-btn menu-btn-log form-btn"><spring:message code="cart.addyourgamesfromhere"/></button>
                                                            </a>
                                                        </h1>
                                                    </td> 
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                            <a href="<c:url value='/checkout/'/>">
                                <button type="submit" class="gd-btn checkout-btn checkout-btn-menu"><spring:message code="cart.checkout"/></button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>