<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 
<%@ page import="com.google.appengine.api.users.*" %>
<%@ page import="java.util.*" %>
<% UserService userService = UserServiceFactory.getUserService(); %>
<%@ page import="nisq.Membre" %>
<%@ page import="nisq.Activity" %>
<%@ page import="nisq.Preference" %>

<jsp:include page="header.jsp"></jsp:include>

           <div class="box"> 
           <div class="box-body"> 
            <form method="get" action="/ajoutpref">
              <legend><h2>Mettre à jour vos préférence :</h2></legend>
     			<fieldset >
                    <label for="sport">Activité 1:<span class="requis">*</span></label>
                    <input type="text" id="sport1" name="sport1" value="" /> 
                    <br />
                     
                    <label for="localisation">Localisation 1:<span class="requis">*</span></label>
                    <input type="text" id="localisation1" name="localisation1" value="" />
                    <br />
                    
                    <label for="sport">Activité 2:<span class="requis">*</span></label>
                    <input type="text" id="sport2" name="sport2" value="" /> 
                    <br />
                     
                    <label for="localisation">Localisation 2:<span class="requis">*</span></label>
                    <input type="text" id="localisation2" name="localisation2" value="" />
                    <br />
                    
                    <label for="sport">Activité 3:<span class="requis">*</span></label>
                    <input type="text" id="sport3" name="sport3" value="" />
                    <br />
                     
                    <label for="localisation">Localisation 3:<span class="requis">*</span></label>
                    <input type="text" id="localisation3" name="localisation3" value="" />
                    <br />
     
                </fieldset>
                <input type="submit" value="Valider"  />
            </form>
        </div>     
        </div>   
        
<jsp:include page="sidebar.jsp"></jsp:include>        
<jsp:include page="footer.jsp"></jsp:include>