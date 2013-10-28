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
         <h2>Activitée</h2>
         ${ mes }
        
       <p><a href="<%= userService.createLogoutURL("/") %>">Se déconnecter</a></p>
     </body>
</html>