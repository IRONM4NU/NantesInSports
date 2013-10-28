<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 
<%@ page import="com.google.appengine.api.users.*" %>
<%@ page import="java.util.*" %>
 
<% UserService userService = UserServiceFactory.getUserService(); %>
<%@ page import="nisq.Membre" %>
<%@ page import="nisq.Activity" %>

 
<!DOCTYPE html>
 
<html>
    <head>
        <title>Application App Engine</title>
        <meta charset="utf-8" />
        <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
   </head>
 
    <body>
       <p><img src="/stylesheets/sport.jpg" alt="Bienvenue" /> </p>
       <div>
            <form method="get" action="/ajout">
                <fieldset>
                    <legend>Créer une Activitée :</legend>
     
                    <label for="sport">Activité :<span class="requis">*</span></label>
                    <input type="text" id="sport" name="sport" value="" />
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
       <p><a href="<%= userService.createLogoutURL("/") %>">Se déconnecter</a></p>
     </body>
</html>