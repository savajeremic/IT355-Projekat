<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@include file="components/header.jsp" %>
<c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
    <c:if test="${!empty games}">
        <div class="container">
            <div class="row">
                <section class="content">
                    <h1><spring:message code="menu.allgames"/></h1>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="container search">
                                    <form class="search-form">
                                        <div class="form-group has-feedback" style="float: left !important;">
                                            <label for="search" class="sr-only"><spring:message code="menu.search"/></label>
                                            <input type="text" class="form-control" name="search" id="search" placeholder="search">
                                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                        </div>
                                </div>
                                <div class="table-container">
                                    <% String success = (String) request.getAttribute("successMsg");%>
                                    <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
                                    <% String error = (String) request.getAttribute("error");%>
                                    <%= (error != null) ? "<div class=\"alert alert-danger\">" + error + "</div>" : ""%>
                                    <table class="table table-filter">
                                        <tbody>
                                            <c:forEach items="${games}" var="game">
                                                <tr>
                                                    <td>
                                                        <form method="POST" action="/SavaJeremic/addToCart">
                                                            <input type="hidden" name="id" id="id" path="id" value="${game.id}" />
                                                            <div class="media">
                                                                <a class="pull-left">
                                                                    <img src="${game.cover}" class="media-photo">
                                                                </a>
                                                                <div class="media-body">
                                                                    <span class="media-meta pull-right">
                                                                        <button type="submit" class="gd-btn buy-btn">${game.price}.$</button>
                                                                    </span>
                                                                    <h4 class="title">
                                                                        ${game.name}
                                                                        <span class="pull-right">
                                                                            <i class="fa fa-heart wishlist" aria-hidden="true"></i>
                                                                            <p class="wishlist-text"><spring:message code="game.addtowishlist"/>t</p>
                                                                        </span>
                                                                    </h4>
                                                                    <p class="summary">${game.genre}</p>
                                                                </div>
                                                            </div>
                                                        </form>
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

<!-- Simple Admin Table View of Games -->
<c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
    <table class="table table-filter">
        <thead>
            <tr>
                <th>Name</th>
                <th>Company</th>
                <th>Description</th>
                <th>Price</th>
                <th>Rating</th>
                <th>Votes</th>
                <th>Cover</th>
                <th>Version</th>
                <th>Release Date</th>
                <th>Size</th>
                <th>Genre</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${games}" var="game">
                <tr>
                    <td>${game.name}</td>
                    <td>${game.company}</td>
                    <td>${game.description}</td>
                    <td>${game.price}</td>
                    <td>${game.rating}</td>
                    <td>${game.votes}</td>
                    <td>${game.cover}</td>
                    <td>${game.version}</td>
                    <td>${game.release_date}</td>
                    <td>${game.size}</td>
                    <td>${game.genre}</td>
                    <td><button class="btn-warning"><a href="<c:url value='/admin/editGame/${game.id}'/>">edit</a></button></td>
                    <td><button class="btn-danger"><a href="<c:url value='/admin/deletegame/${game.id}'/>">delete</a></button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>
<%@include file="components/footer.jsp" %>