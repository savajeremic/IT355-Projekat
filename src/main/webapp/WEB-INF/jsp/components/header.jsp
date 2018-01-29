<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String uri = request.getRequestURI();
    String pageName = uri.substring(uri.lastIndexOf("/") + 1);
%>
<!DOCTYPE html>
<html> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> ${title} | <spring:message code="title"/></title>
        <link rel="stylesheet" href='<c:url value="/css/font-awesome.min.css" />'/>
        <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css" />'/>
        <link rel="stylesheet" href='<c:url value="/css/style.css" />'/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <div class="img-background"></div>
</head>
<body onload='document.loginForm.username.focus();'>
    <nav class="navbar navbar menu"><!--Bez navbar-inverse == Transparentan menu-->
        <div class="containter-fluid menu_container">
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <a class="navbar-brand" href="/SavaJeremic"><spring:message code="title.name"/></a>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <spring:message code="menu.store"/><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/SavaJeremic"><spring:message code="menu.home"/></a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="/SavaJeremic/viewGames"><spring:message code="menu.allgames"/></a></li>
                                <c:if test="${!empty genres}">
                                    <c:forEach items="${genres}" var="genre">
                                    <li class="dropdown-submenu">
                                        <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                            ${genre.name}<i class="fa fa-angle-double-right menu-arrow" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="SavaJeremic/about" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <spring:message code="menu.about"/><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/about"><spring:message code="menu.about.aboutus"/></a></li>
                            <li role="separator" class="divider"></li>
                            <li><a><spring:message code="menu.about.join"/></a></li>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <spring:message code="menu.support"/><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a><spring:message code="menu.support.report"/></a></li>
                            <li><a><spring:message code="title.name"/></a></li>
                            <li role="separator" class="divider"></li>
                            <li><a><spring:message code="menu.support.department"/></a></li>
                        </ul>
                    </li>

                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                        <li class="dropdown"><!--Ako NIJE ulogovan korisnik-->
                            <a style="color: #c6142c;" class="dropdown-toggle menu-user" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <span class="glyphicon glyphicon-log-in"></span><spring:message code="menu.signin"/><span class="caret"></span></a>
                            <ul class="dropdown-menu signin-drop">
                                <li class="signin-elements">
                                    <!--<a href="/SavaJeremic/login">--><button type="button" data-toggle="modal" data-target="#loginModal" class="gd-btn menu-btn-log">
                                        <spring:message code="menu.signin.log"/></button> <!--</a>-->
                                    <a href="/SavaJeremic/register"><button type="button" data-toggle="modal" data-target="#registerModal" class="gd-btn menu-btn-reg">
                                            <spring:message code="menu.signin.reg"/></button></a>
                                </li>
                                <li role="separator" class="divider"></li>
                                <li><img class="signin-img" src='<c:url value="/img/logreggames.png" />'/></li>
                            </ul>
                        </li>
                    </c:if>

                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <span class="glyphicon glyphicon-log-in">
                                </span>${pageContext.request.userPrincipal.name}<span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu">
                                <li class="menu-header_label"><spring:message code="menu.user.youracc"/></li>
                                <li><a class="menu-account_user-name">${pageContext.request.userPrincipal.name}</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="<c:url value='/userGames/'/>"><spring:message code="menu.user.games"/></a></li>
                                <li><a><spring:message code="menu.user.wishlist"/></a></li>
                                <li role="separator" class="divider"></li>
                                <script>
                                    function formSubmit() {
                                        document.getElementById("logoutForm").submit();
                                    }
                                </script>
                                <c:url value="/j_spring_security_logout" var="logoutUrl" />
                                <form action="${logoutUrl}" method="post" id="logoutForm">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </form>
                                <li><a href="javascript:formSubmit()"><spring:message code="menu.user.logout"/></a></li>
                            </ul>
                        </li>
                    </c:if>


                    <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="menu.admin.work"/>
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/SavaJeremic/admin/users"><button class="gd-btn menu-btn-log"><spring:message code="viewusers"/></button></a></li>
                                <li><a href="/SavaJeremic/admin/addGame"><button class="gd-btn menu-btn-log"><spring:message code="addgame"/></button></a></li>
                                <li><a href="/SavaJeremic/admin/addGenre"><button class="gd-btn menu-btn-log"><spring:message code="menu.admin.add.genre"/></button></a></li>
                            </ul>
                        </li>
                    </c:if>
                    <!--</sec:authorize>-->  
                    <c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
                        <li class="dropdown menu_tray">
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <span class="glyphicon glyphicon-shopping-cart"></span>
                                </c:if>
                                <c:if test="${pageContext.request.userPrincipal.name == null}">
                                    <span class="glyphicon glyphicon-shopping-cart"></span>
                                </c:if>
                            </a>
                            <ul class="dropdown-menu cart-drop">
                                <c:if test="${pageContext.request.userPrincipal.name == null}">
                                    <li class="menu-cart-empty">
                                        <span class="glyphicon glyphicon-shopping-cart"></span>
                                        <p class="menu-cart-empty-header"><spring:message code="cart.empty"/></p>
                                        <hr/>
                                        <div>
                                            <p><spring:message code="cart.empty.login"/></p>
                                            <button data-toggle="modal" data-target="#loginModal" class="gd-btn menu-btn-log"><spring:message code="menu.signin.log"/></button>
                                            <button data-toggle="modal" data-target="#registerModal" class="gd-btn menu-btn-reg"><spring:message code="menu.signin.reg"/></button>
                                        </div>
                                    </li>
                                </c:if>
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <li class="menu-cart-user">
                                        <div class="pre-scrollable">
                                            <div class="cart-header">
                                                <c:set var="total" value="${0}"/>
                                                <c:forEach items="${items}" var="items">
                                                    <c:set var="total" value="${total + items.game.price}" />
                                                </c:forEach>
                                                <p class="items-added"><span><spring:message code="cart.totalprice"/>${total}</span><spring:message code="cart.dollar"/></p>
                                                <a href="<c:url value='/checkout/'/>">
                                                    <button type="submit" class="gd-btn checkout-btn checkout-btn-menu"><spring:message code="cart.checkout"/></button>
                                                </a>
                                                <span class="cart-menu-text">  </span>
                                                <a href="/SavaJeremic/cart"><p class="items-added"><spring:message code="cart.your"/></p></a>
                                            </div>
                                            <c:forEach items="${items}" var="items">
                                                <input type="hidden" name="id" id="id" path="id" value="${game.id}" />
                                                <div class="media-cart">
                                                    <a class="pull-left">
                                                        <img src="${items.game.cover}" class="cart-img">
                                                    </a>
                                                    <div class="media-body">
                                                        <span class="media-meta pull-right">
                                                            <p class="cart-price">${items.game.price}$</p>
                                                        </span>
                                                        <div class="pull-left">
                                                            <h4 class="title trunc-name">${items.game.name}</h4>
                                                            <a href="<c:url value='/deleteFromCart/${items.game.id}'/>">
                                                                <p class="remove-cart-text"><spring:message code="cart.remove"/></p>
                                                            </a>

                                                        </div>
                                                    </div>
                                                    <hr class="menu-break"/>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </li>
                                </c:if>
                            </ul>
                        </li>
                    </c:if>
                </ul>
                </ul>
                <div class="container search">
                    <form class="search-form">
                        <div class="form-group has-feedback">
                            <label for="search" class="sr-only"><spring:message code="menu.search"/></label>
                            <input type="text" class="form-control" name="search" id="search" placeholder="search">
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </nav>

    <div id="loginModal" class="modal fade" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="login-box">
            <form name="form" class="form form-login" action="<c:url value='/j_spring_security_check' />" method='POST'>
                <h2 class="form-title"><spring:message code="menu.signin.log"/></h2>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
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
                    <button class="gd-btn menu-btn-log form-btn"><spring:message code="menu.signin.log"/></button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </div>
    </div>

    <div id="registerModal" class="modal fade" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="login-box">
            <form:form method="POST" modelAttribute="user" class="form form-login" role="form">
                <h2 class="form-title"><spring:message code="menu.signin.reg"/></h2>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <% String success = (String) request.getAttribute("successMsg");%>
                <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
                <% String error = (String) request.getAttribute("error");%>
                <%= (error != null) ? "<div class=\"alert alert-danger\">" + error + "</div>" : ""%>
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