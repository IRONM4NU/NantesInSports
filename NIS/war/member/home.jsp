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
            <h2>Bienvenue sur Nantes In Sports</h2>
            <p class="text">Vous aimez le sport ? Vous aimez faire des rencontres ? Nantes In Sports est fait pour vous !!! Enjoy.  </p>
           </div>
          <div class="cl">&nbsp;</div>
        </div>
      		
        
          <%  List<Activity> acts = (List<Activity>) request.getAttribute("acts");
            for (Activity act : acts) { %>
        
        	
	        <div class="box">
	        <div class="box-image"><img src="/stylesheets/<%= act.getSport() %>.jpg" alt="" /></a> </div>
	        <div class="box-body">
	          <p class="posted">Posté le <%= act.getDateCreation().substring(0, 10)%> </p>
	          <h2> <%= act.getSport() %> </h2>
	          <p class="text"> Localisation : <%= act.getLocalisation() %><br />
								Nombre de places restantes : <%= act.getPlacesRest() %> <br />
								Le : <%= act.getDate() %> <br />
								
	          </p> 
			</div>
			<%if(act.getPlacesRest() > 0){ %>
				<form action="/inscrit" method="get">
				<input type="hidden"  name="sport"  value="<%= act.getSport() %>">
				<input type="hidden"  name="localisation"  value="<%= act.getLocalisation() %>">
				<input type="hidden"  name="date"  value="<%= act.getDate() %>">
				<input type="submit"  value="S'inscrire" style="border: none;background : black;font-size:15px;color:#ffa200;">
				</form>
			<%} %>
			
	        <div class="cl">&nbsp;</div>
	        </div>
	        
       <% } %>
        
        
      		
        </div>
        
        
<jsp:include page="sidebar.jsp"></jsp:include>        
<jsp:include page="footer.jsp"></jsp:include>
