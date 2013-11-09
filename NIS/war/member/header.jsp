<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.appengine.api.users.*" %>
<%@ page import="java.util.*" %>
 
<% UserService userService = UserServiceFactory.getUserService(); %>
<%@ page import="nisq.Membre" %>
<%@ page import="nisq.Activity" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Nantes In Sports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="/css/images/favicon.ico" />
<link rel="stylesheet" href="/css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="/js/fancybox/jquery.fancybox-1.3.1.css" type="text/css" media="all" />
<!--[if IE 6]><script src="/js/png-fix.js" type="text/javascript" charset="utf-8"></script><![endif]-->
<script src="/js/jquery-1.4.2.js" type="text/javascript" charset="utf-8"></script>
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
            <li><a href="/home.jsp" class="active">Home</a></li>
            <li><a href="about.html">About</a></li>
            <li><a href="#">Archives</a></li>
            <li class="last"><a href="#">Site map</a></li>
          </ul>
          <div class="cl">&nbsp;</div>
        </div>
         <% if (userService.getCurrentUser() == null) { %>
        
          	<a class = "subscribe" href="<%= userService.createLogoutURL("/") %>">Connection</a>
        <% }
        else { %>   
             <a class = "deconnection" href="<%= userService.createLogoutURL("/") %>">Déconnection</a>
        <% } %>
        <div class="cl">&nbsp;</div>
        <h1 id="logo" class="notext"><a href="#">Buzz</a></h1>
        <div class="cl">&nbsp;</div>
        <div id="sub-nav">
          <ul>
            <li><a href="#" class="active">Latest news</a></li>
            <li><a href="#">Daily photos</a></li>
            <li><a href="#">Fashion</a></li>
            <li><a href="#">Best Dressed</a></li>
            <li><a href="#">Most Wanted</a></li>
            <li><a href="#">Features</a></li>
            <li><a href="#">Accessories</a></li>
            <li class="last"><a href="#">Style Guides</a></li>
          </ul>
        </div>

         

