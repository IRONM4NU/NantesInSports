<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 
<%@ page import="com.google.appengine.api.users.*" %>
<%@ page import="java.util.*" %>
<% UserService userService = UserServiceFactory.getUserService(); %>
<%@ page import="nisq.Membre" %>
<%@ page import="nisq.Activity" %>
<jsp:include page="/member/header.jsp"></jsp:include>
<div id="main">
    <div class="shell">
      <div id="content" class="left">
        <div class="box box-featured">
        <div class="box-image"> <a href="#"><img src="css/images/logo_univ_nantes.jpg" alt="" /></a> <span class="mark-featured notext">&nbsp;</span> </div>
          <div class="box-body">
            <h2>Nantes In Sports</h2>
            <p class="text">Nantes In Sports est le projets que nous avions à réaliser pour la matière de Web Application et Cloud Computing. Cette matière entre dans le cadre du Master 1 Informatique de l'UFR Sciences et Techniques de Nantes.</p>
           </div>
          <div class="cl">&nbsp;</div>
        </div>
       </div>
<jsp:include page="/member/sidebar.jsp"></jsp:include>        
<jsp:include page="/member/footer.jsp"></jsp:include>