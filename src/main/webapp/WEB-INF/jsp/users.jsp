<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="components/header.jsp" />

<div class="container">
    <div class="row">
        <section class="content">
            <h1>All Users</h1>
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
                            </form>
                        </div>
                        <div class="table-container">
                            <c:if test="${!empty users}">
                                <table class="table table-filter">
                                    <tbody>
                                        <tr>
                                            <th width="350"><spring:message code="user.username"/></th>
                                            <th width="200"><spring:message code="user.password"/></th>
                                            <th width="200"><spring:message code="user.email"/></th>
                                            <th width="200"><spring:message code="delete"/></th>
                                        </tr>
                                        <c:forEach items="${users}" var="user">
                                            <tr>
                                                <td>${user.username}</td>
                                                <td>${user.password}</td>
                                                <td>${user.email}</td> 
                                                <td><button class="btn-danger"><a href="<c:url value='/admin/deleteUser/${user.username}'/>"><spring:message code="delete"/></a></button></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<jsp:include page="components/footer.jsp" />