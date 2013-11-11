<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 
<%@ page import="com.google.appengine.api.users.*" %>
<%@ page import="java.util.*" %>
<% UserService userService = UserServiceFactory.getUserService(); %>
<%@ page import="nisq.Membre" %>
<%@ page import="nisq.Activity" %>
<%@ page import="nisq.Preference" %>

<jsp:include page="header.jsp"></jsp:include>
<div id="main">
    <div class="shell">
    <div id="content" class="left">
          <div class="box-body">
            <h2>Vos Préférence</h2>
            <p class="text"> Sports 1 : ${ sport1 }</p>
            <p class="text"> Localisation 1 : ${ localisation1 }</p>
            <p class="text"> Sports 2 : ${ sport2 }</p>
            <p class="text"> Localisation 2 : ${ localisation2 }</p>
            <p class="text"> Sports 3 : ${ sport3 }</p>
            <p class="text"> Localisation 3 : ${ localisation3 }</p>
          
        	 <p class="text"> Veuillez mettre à jour vos préférences en cliquant <a href="/member/ajouterpref.jsp">ici</a> </p>
         
         
           </div>
          <div class="cl">&nbsp;</div>
        </div>
        </div>
<jsp:include page="sidebar.jsp"></jsp:include>        
<jsp:include page="footer.jsp"></jsp:include>