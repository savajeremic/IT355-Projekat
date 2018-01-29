<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@include file="components/header.jsp" %>
<section class="about-section">
  <div class="about-section-inner">
    <header class="about-header">
      <h1>GameDream<i class="fa fa-registered header-icon" aria-hidden="true"></i></h1>
      <p class="about-header-intro">The gaming Client designed for a convenient purchasing, playing and updating games, as well as an online play between gaming platforms,
        GameDream is also built with optionality in mind, and a belief that you should own the games you buy.
      </p>
      <hr/>
      <img class="signin-img" src='<c:url value="/img/logreggames.png" />'/>
      <p class="about-header-intro" style="color: #102d3c;">If you aren't a member of our community, please join!
      </p>
      <button class="gd-btn about-button"> Welcome! </button>
      <p class="about-header-intro" style="color: #102d3c;">If you already are, hey, welcome back!</p>
    </header>
  </div>
</section>
<%@include file="components/footer.jsp" %>