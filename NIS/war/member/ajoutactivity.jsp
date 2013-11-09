<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 
<%@ page import="com.google.appengine.api.users.*" %>
<%@ page import="java.util.*" %>
<% UserService userService = UserServiceFactory.getUserService(); %>
<%@ page import="nisq.Membre" %>
<%@ page import="nisq.Activity" %>
<jsp:include page="header.jsp"></jsp:include>

           <div class="box"> 
           <div class="box-body"> 
            <form method="get" action="/ajout">
              <legend><h2>Créer une Activitée :</h2></legend>
     			<fieldset >
                    <label for="sport">Activité :<span class="requis">*</span></label>
                    <input type="text" id="sport" name="sport" value=<%= request.getParameter("activity") %> />
                    <br />
                     
                    <label for="localisation">Localisation :<span class="requis">*</span></label>
                    <input type="text" id="localisation" name="localisation" value="" />
                    <br />
     
                    <label for="date">Date :<span class="requis">*</span></label>
                    <input type="text" id="date" name="date" value="" />
                    <br />
     
                    <label for="places">Nombres de places :<span class="requis">*</span></label>
                    <input type="text" id="places" name="places" value="" />
                    <br />
                </fieldset>
                <input type="submit" value="Valider"  />
            </form>
        </div>     
        </div>   
<jsp:include page="sidebar.jsp"></jsp:include>        
<jsp:include page="footer.jsp"></jsp:include>