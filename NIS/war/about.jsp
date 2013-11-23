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
        <div class="box box-featured">
        <div class="box-image"> <a href="#"><img src="css/images/openData.jpg" alt="" /></a> <span class="mark-featured notext">&nbsp;</span> </div>
          <div class="box-body">
            <h2>Open Data de Nantes</h2>
           <p class="text">Nous avions pour consigne d'utiliser les données de l'open data de Nantes, et de s'en servir dans une apllication. Il fallait tout d'abord avoir une idée selon les données disponibles. Et ainsi naquit Nantes In Sports, nous utilisons les données des équipements sportifs pour organiser des activitées. Il vous suffit de créer un évènement, et les membres qui ont dans leurs préférences le sport ainsi que l'endroit que vous avez choisis, seront automatiquement averti par mail, qu'une activitée à été créée. </p>
           </div>
          <div class="cl">&nbsp;</div>
        </div>
       </div>
<jsp:include page="/member/sidebar.jsp"></jsp:include>        
<jsp:include page="/member/footer.jsp"></jsp:include>