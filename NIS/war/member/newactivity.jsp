<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 
<%@ page import="com.google.appengine.api.users.*" %>
<%@ page import="java.util.*" %>
<% UserService userService = UserServiceFactory.getUserService(); %>
<%@ page import="nisq.Membre" %>
<%@ page import="nisq.Activity" %>
<jsp:include page="header.jsp"></jsp:include>
<div class="box"> 
   <div class="box-body"> 
      <h2>Activité</h2>
         ${ mes }
   </div>     
</div>   
<jsp:include page="sidebar.jsp"></jsp:include>        
<jsp:include page="footer.jsp"></jsp:include>
