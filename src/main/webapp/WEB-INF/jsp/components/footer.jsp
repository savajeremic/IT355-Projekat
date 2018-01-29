<%-- 
    Document   : footer
    Created on : 23-Oct-2017, 12:15:48
    Author     : Jack
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<footer class="navbar-bottom" style="border-top:1px solid #cecece;">
  <div class="col-md-4 col-md-push-4">
    <ul class="nav nav-pills nav-justified">
      <li><a><spring:message code="footer.company"/></a></li>
      <li><a><spring:message code="footer.about"/></a></li>
      <li><a><spring:message code="footer.terms"/></a></li>
    </ul>
  </div>
</footer>
    
<script src='<c:url value="/js/jquery-2.1.1.js" />' ></script>
<script src='<c:url value="http://maps.google.com/maps/api/js?sensor=true" />' ></script>
<script src='<c:url value="/js/bootstrap.min.js" />' ></script>
</body>
</html>
