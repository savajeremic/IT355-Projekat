<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="components/header.jsp" />
<div class="frontpage-promo">
    <header class="containter promo-header">
        <span class="h-span">
            <div class="h-before">
                <img src="./img/header-line-left.png" />
            </div>
            <h1 class="h-title"><spring:message code="header.title"/></h1>
            <div class="h-after">
                <img src="./img/header-line-right.png" />
            </div>
        </span>
        <h2 class="header-subtitle"><spring:message code="header.subtitle"/></h2>

        <div id="myCaroussel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="active item">
                    <img class="img-slide" src='<c:url value="/img/carousel1.jpg" />'/>
                </div>

                <div class="item">
                    <img src='<c:url value="/img/carousel2.jpg" />'/>
                </div>

                <div class="item">
                    <img src='<c:url value="/img/carousel3.jpg" />'/>
                </div>

                <div class="item">
                    <img src='<c:url value="/img/carousel4.jpg" />'/>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel"></a>
            <a class="right carousel-control" href="#myCarousel"></a>
        </div>

        <h1 class="header-title"><spring:message code="header.uskoro"/></h1>
    </header>

    <div class="container">
        <div class="bundle-list">
            <div class="bundle-list-item">
                <img class="bundle-img" src='<c:url value="/img/promo1.png" />'/>
                <div class="bundle-price">
                    <button class="price"><spring:message code="home.promo1.price"/></button>
                </div>
            </div>
            <div class="bundle-list-item">
                <img class="bundle-img" src='<c:url value="/img/promo2.jpg" />'/>
                <div class="bundle-price">
                    <button class="price"><spring:message code="home.promo2.price"/></button>
                </div>
            </div>
            <div class="bundle-list-item">
                <img class="bundle-img" src='<c:url value="/img/promo3.jpg" />'/>
                <div class="bundle-price">
                    <button class="price"><spring:message code="home.promo3.price"/></button>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="components/footer.jsp" />