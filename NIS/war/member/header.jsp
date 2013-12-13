<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.appengine.api.users.*" %>
<%@ page import="java.util.*" %>
 
<% UserService userService = UserServiceFactory.getUserService(); %>
<%@ page import="nisq.Membre" %>
<%@ page import="nisq.Activity" %>
<%@ page import="nisq.Preference" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Nantes In Sports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/ui-darkness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="/css/images/favicon.ico" />
<link rel="stylesheet" href="/css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="/js/fancybox/jquery.fancybox-1.3.1.css" type="text/css" media="all" />
<!--[if IE 6]><script src="/js/png-fix.js" type="text/javascript" charset="utf-8"></script><![endif]-->
<script src="/js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/fancybox/jquery.fancybox-1.3.1.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/fancybox/jquery.mousewheel-3.0.2.pack.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/jquery.easing.1.3.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/js-func.js" type="text/javascript" charset="utf-8"></script>

</head>
<body>
<div id="wrapper">
  <div id="header">
    <div class="header-bg">
      <div class="shell">
        <div id="navigation">
          <ul>
            <li><a href="/nis" >Home</a></li>
            <li><a href="/about.jsp">About</a></li>
            <li><a href="/affichpref">Préférences</a></li>
           <!--<li><a href="/mail">Mail</a></li>  -->
          </ul>
          <div class="cl">&nbsp;</div>
        </div>
         <% if (userService.getCurrentUser() == null) { %>
        
          	<a class = "subscribe" href="<%= userService.createLoginURL("/") %>">Connexion</a>
        <% }
        else { %>   
             <a class = "deconnection" href="<%= userService.createLogoutURL("/indexNis.html") %>">Déconnexion</a>
        <% } %>
        <div class="cl">&nbsp;</div>
        <h1 id="logo" class="notext"><a href="#">Buzz</a></h1>
        <div class="cl">&nbsp;</div>
        <div id="sub-nav">
          <ul>
            <li><a href="/nis" >Accueil</a></li>
            <li><a href="/member/ajoutactivity.jsp" >Créer une activité</a></li>
            <li class="last"><a href="/member/ajouterpref.jsp">Mettre à jour mes préférences</a></li>
          </ul>
        </div>
