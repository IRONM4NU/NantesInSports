<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 
<%@ page import="com.google.appengine.api.users.*" %>
<%@ page import="java.util.*" %>
<% UserService userService = UserServiceFactory.getUserService(); %>
<%@ page import="nisq.Membre" %>
<%@ page import="nisq.Activity" %>
<jsp:include page="header.jsp"></jsp:include>
 <div id="main">
    <div class="shell">
      <div id="content" class="left">
        <div class="box box-featured">
          <div class="box-image"> <a href="#"><img src="/stylesheets/nis.jpg" alt="Bienvenue" /></a> <span class="mark-featured notext">&nbsp;</span> </div>
          <div class="box-body">
            <h2>Vous êtes déjà inscrit à cette activité ! </h2>
           </div>
          <div class="cl">&nbsp;</div>
        </div>
	        </div>
			</div>
           </div>
        
        
<jsp:include page="sidebar.jsp"></jsp:include>        
<jsp:include page="footer.jsp"></jsp:include>
