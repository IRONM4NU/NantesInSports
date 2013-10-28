<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 
<%@ page import="com.google.appengine.api.users.*" %>
<%@ page import="java.util.*" %>
 
<% UserService userService = UserServiceFactory.getUserService(); %>
<%@ page import="nisq.Membre" %>

 
<!DOCTYPE html>
 
<html>
    <head>
        <title>Application App Engine</title>
        <meta charset="utf-8" />
        <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
   </head>
 
    <body>
        
        <p><img src="/stylesheets/sport.jpg" alt="Bienvenue" /> </p>
        
        <h1>Bienvenue dans NIS</h1>
        <p> Choisissez une activité à ajouter à votre compte </p>
<TABLE BORDER>
<TR>
<TD><a href="/member/ajoutactivity.jsp"><img src="/stylesheets/nis11.jpg" alt="Running" title="Running" /> </a></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis12.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis13.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis14.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis15.jpg" alt="perdu.cm" title="Perdu?" /></TD>
</TR>
<TR>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis21.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis22.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis23.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis24.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis25.jpg" alt="perdu.cm" title="Perdu?" /></TD>
</TR>
<TR>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis31.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis32.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis33.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis34.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis35.jpg" alt="perdu.cm" title="Perdu?" /></TD>
</TR>
<TR>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis41.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis42.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis43.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis44.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis45.jpg" alt="perdu.cm" title="Perdu?" /></TD>
</TR>
<TR>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis51.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis52.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis53.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis54.jpg" alt="perdu.cm" title="Perdu?" /></TD>
<TD><a href="http://www.perdu.com"><img src="/stylesheets/nis55.jpg" alt="perdu.cm" title="Perdu?" /></TD>
</TR>
</TABLE> 
        <% if (userService.getCurrentUser() == null) { %>
        
            <p><a href="<%= userService.createLoginURL("/") %>">Se connecter</a></p>
        <% }
        else { %>
            <p>Bonjour <%= userService.getCurrentUser().getNickname() %> </p>
             <%= request.getAttribute("listMembres") %>
            
            
            <p><a href="<%= userService.createLogoutURL("/") %>">Se déconnecter</a></p>
        <% } %>
     </body>
</html>