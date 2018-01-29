<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="components/header.jsp" />

<div class="container">
    <div class="row">
        <section class="content">
            <h1>All Games</h1>
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="container search">
                            <form class="search-form">
                                <div class="form-group has-feedback" style="float: left !important;">
                                    <label for="search" class="sr-only">Search</label>
                                    <input type="text" class="form-control" name="search" id="search" placeholder="search">
                                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                </div>
                            </form>
                        </div>
                        <div class="table-container">
                            <c:if test="${!empty games}">
                                <table class="table table-filter">
                                    <tbody>
                                        <tr>
                                            <th width="350">Name</th>
                                            <th width="200">Genre</th>
                                            <th width="200">Company</th>
                                            <th width="200">Description</th>
                                        </tr>
                                        <c:forEach items="${games}" var="game">
                                        <tr>
                                            <td>${game.name}</td>
                                            <td>${game.genre}</td>
                                            <td>${game.company}</td>
                                            <td>${game.description}</td>  
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