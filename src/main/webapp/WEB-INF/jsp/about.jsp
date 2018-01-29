<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@include file="components/header.jsp" %>
<section class="about-section">
  <div class="about-section-inner">
    <header class="about-header">
      <h1><spring:message code="title.name"/><i class="fa fa-registered header-icon" aria-hidden="true"></i></h1>
      <p class="about-header-intro"><spring:message code="about1"/></p>
      <hr/>
      <img class="signin-img" src='<c:url value="/img/logreggames.png" />'/>
      <p class="about-header-intro" style="color: #102d3c;"><spring:message code="about2"/></p>
      <button class="gd-btn about-button"> Welcome! </button>
      <p class="about-header-intro" style="color: #102d3c;"><spring:message code="about3"/></p>
    </header>
  </div>
</section>
<%@include file="components/footer.jsp" %>