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
            <form method="get" action="/ajout">
              <legend><h2>Créer une Activitée :</h2></legend>
     			<fieldset >
                    <label for="sport">Activité :</label>
                   <!-- <input type="text" id="sport" name="sport" value="" /> -->
                    <SELECT id="sport" name="sport" >
							<OPTION value="Piscine">Piscine</OPTION> 
							<OPTION value="Basket">Basket</OPTION> 
							<OPTION value="Tennis">Tennis</OPTION> 
							<OPTION value="Skate">Skate</OPTION> 
							<OPTION value="Football">Football</OPTION> 
							<OPTION value="Running">Running</OPTION> 
							<OPTION value="Petanque">Pétanque</OPTION> 
							<OPTION value="Baseball">Baseball</OPTION> 
							<OPTION value="Rugby">Rugby</OPTION>
					</SELECT>
                    <br />
                     
                    <label for="localisation">Localisation :</label>
                    <!--<input type="text" id="localisation1" name="localisation1" value="" /> -->
                    <SELECT id="localisation" name="localisation" >                  	
						 <OPTION value="Stade Marcel Saupin">Stade Marcel Saupin</OPTION> 
						 <OPTION value="Stade de la Beaujoire Louis Fonteneau">Stade de la Beaujoire Louis Fonteneau</OPTION> 
						 <OPTION value="Plaine de Jeux Coliniere">Plaine de Jeux Colinière</OPTION> 
						 <OPTION value="Plaine de Jeux Basses Landes">Plaine de Jeux Basses Landes</OPTION> 
						 <OPTION value="Velodrome Stade Petit Breton">Vélodrome Stade Petit Breton</OPTION> 
						 <OPTION value="Plaine de Jeux Durantiere">Plaine de Jeux Durantière</OPTION> 
						 <OPTION value="Piscine du Petit Port">Piscine du Petit Port</OPTION> 
						 <OPTION value="Piscine Durantiere">Piscine Durantière</OPTION> 
						 <OPTION value="Piscine Dervallieres">Piscine Dervallières</OPTION> 
						 <OPTION value="Piscine Leo Lagrange Ile Gloriette">Piscine Leo Lagrange Ile Gloriette</OPTION> 
						 <OPTION value="Plaine de Jeux de la Beaujoire">Plaine de Jeux de la Beaujoire</OPTION> 
						 <OPTION value="Stade La Halvêque">Stade La Halvêque</OPTION> 
						 <OPTION value="Plateau Sportif du Port Boyer">Plateau Sportif du Port Boyer</OPTION> 
						 <OPTION value="Stade Annexe Louis Fonteneau">Stade Annexe Louis Fonteneau</OPTION> 
						 <OPTION value="Espace de Proximite La Grande Noue">Espace de Proximité La Grande Noue</OPTION> 
						 <OPTION value="Stade Caserne Quartier Mellinet">Stade Caserne Quartier Mellinet</OPTION> 
						 <OPTION value="Stade Gendarmerie Mobile">Stade Gendarmerie Mobile</OPTION> 
						 <OPTION value="Espace Sportif de Proximite du Clos Toreau">Espace Sportif de Proximité du Clos Toreau</OPTION> 
						 <OPTION value="Stade de la Gilarderie">Stade de la Gilarderie</OPTION> 
						 <OPTION value="Plaine de Jeux des Bourdonnieres">Plaine de Jeux des Bourdonnières</OPTION> 
						 <OPTION value="Stade Lycee La Chauviniere">Stade Lycée La Chauvinière</OPTION> 
						 <OPTION value="Plaine de Jeux du Petit Port">Plaine de Jeux du Petit Port</OPTION> 
						 <OPTION value="Stade Launay Violette">Stade Launay Violette</OPTION> 
						 <OPTION value="Stade Ecole Centrale">Stade Ecole Centrale</OPTION> 
						 <OPTION value="Stade Proce">Stade Procé</OPTION> 
						 <OPTION value="Stade Annexe de Proce">Stade Annexe de Procé</OPTION> 
						 <OPTION value="Plaine de Jeux Bernardiere">Plaine de Jeux Bernardière</OPTION> 
						 <OPTION value="Plaine de Jeux Lycee Albert Camus">Plaine de Jeux Lycée Albert Camus</OPTION> 
						 <OPTION value="Stade Lycee Carcouet">Stade Lycée Carcouët</OPTION> 
						 <OPTION value="Plaine de Jeux des Dervallieres">Plaine de Jeux des Dervallières</OPTION> 
						 <OPTION value="Stade Pascal-Laporte">Stade Pascal-Laporte</OPTION> 
						 <OPTION value="Piscine Jules Verne Haluchere">Piscine Jules Verne Haluchère</OPTION> 
						 <OPTION value="Stade Jean Jacques Audubon">Stade Jean Jacques Audubon</OPTION> 
						 <OPTION value="Plaine de Jeux l'Eraudiere">Plaine de Jeux l'Eraudière</OPTION> 
						 <OPTION value="Equipement Sportif de Proximite La Halvêque">Equipement Sportif de Proximité La Halvêque</OPTION> 
						 <OPTION value="Plaine de Jeux Marriere">Plaine de Jeux Marrière</OPTION> 
						 <OPTION value="Plaine de Jeux Sevres">Plaine de Jeux Sévres</OPTION> 
						 <OPTION value="Plaines de jeux Gaston Turpin">Plaines de jeux Gaston Turpin</OPTION> 
						 <OPTION value="Stade de la Gilarderie">Stade de la Gilarderie</OPTION> 
						 <OPTION value="Stade l'Amande">Stade l'Amande</OPTION> 
						 <OPTION value="Stade Michel Lecointre Beaulieu">Stade Michel Lecointre Beaulieu</OPTION> 
						 <OPTION value="Stade Pin Sec">Stade Pin Sec</OPTION> 
						 <OPTION value="Plaine de Jeux Grand Blottereau">Plaine de Jeux Grand Blottereau</OPTION> 
						 <OPTION value="Stade de la Roche">Stade de la Roche</OPTION> 
						 <OPTION value="Plaine de Jeux Geraudiere Santos Dumont">Plaine de Jeux Géraudière Santos Dumont</OPTION> 
						 <OPTION value="Hippodrome du Petit Port">Hippodrome du Petit Port</OPTION> 
						 <OPTION value="Stade des Dervallieres">Stade des Dervallières</OPTION> 
						 <OPTION value="Stade Mangin Beaulieu">Stade Mangin Beaulieu</OPTION> 
						 <OPTION value="Circuits Rustiques d'Activites Plein Air - Blottereau">Circuits Rustiques d'Activités Plein Air - Blottereau</OPTION> 
						 <OPTION value="Circuits Rustiques d'Activites Plein Air - Ile de Nantes">Circuits Rustiques d'Activités Plein Air - Ile de Nantes</OPTION> 
						 <OPTION value="Plateau Sportif Bourgeonniere">Plateau Sportif Bourgeonnière</OPTION> 
						 <OPTION value="Skatepark Le Hangar">Skatepark Le Hangar</OPTION> 
						 <OPTION value="Piscine Petite Amazonie">Piscine Petite Amazonie</OPTION> 
						 <OPTION value="Skate Park Ricordeau">Skate Park Ricordeau</OPTION> 
						 <OPTION value="Boulodrome Noe Lambert">Boulodrome Noë Lambert</OPTION> 
						 <OPTION value="Boulodrome du Breil">Boulodrome du Breil</OPTION> 
						 <OPTION value="Skate Schuman">Skate Schuman</OPTION> 
						 <OPTION value="Plaine de Jeux St-Joseph de Porterie">Plaine de Jeux St-Joseph de Porterie</OPTION> 
						 <OPTION value="Plaine de Jeux du Lycee de la Coliniere">Plaine de Jeux du Lycée de la Colinière</OPTION> 
						 <OPTION value="Halle de Tennis de la Marriere">Halle de Tennis de la Marrière</OPTION> 
						 <OPTION value="Plaine de Jeux de la Noe Lambert">Plaine de Jeux de la Noë Lambert</OPTION> 
						 <OPTION value="Boulodrome du Bele">Boulodrome du Bèle</OPTION> 
					</SELECT>
                    <br />
     
                    <label for="date">Date :</label>
                    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    				<script src="/js/jquery-ui-1.10.3.custom.min.js"></script>
    				<script src="/js/jquery.ui.datepicker-fr.js"></script>
    				<script src="/js/jquery-ui-timepicker-addon.js"></script>
    				
                    <input type="text" id="date" name="date" value="" class = "datepicker" />
    				<script type="text/javascript">
				        jQuery(function($)
				        {
				           $.datepicker.setDefaults( $.datepicker.regional['fr']);	
				           
				           $('#date').datetimepicker({
				        	   dateFormat : 'dd/mm/yy',
				        	   minDate : 0
				           });
				        });
				    </script>
				    </div>
                    <br />
                   
                    <label for="placesRest">Nombres de places restantes :</label>
                    <!-- <input type="text" id="placesRest" name="placesRest" value="" /> -->
                    <SELECT id="placesRest" name="placesRest" >
                    	<OPTION value="1">1</OPTION> 
							 <OPTION value="2">2</OPTION> 
							 <OPTION value="3">3</OPTION> 
							 <OPTION value="4">4</OPTION> 
							 <OPTION value="5">5</OPTION> 
							 <OPTION value="6">6</OPTION> 
							 <OPTION value="7">7</OPTION> 
							 <OPTION value="8">8</OPTION> 
							 <OPTION value="9">9</OPTION> 
							 <OPTION value="10">10</OPTION> 
							 <OPTION value="11">11</OPTION> 
							 <OPTION value="12">12</OPTION> 
							 <OPTION value="13">13</OPTION> 
							 <OPTION value="14">14</OPTION> 
							 <OPTION value="15">15</OPTION> 
							 <OPTION value="16">16</OPTION> 
							 <OPTION value="17">17</OPTION> 
							 <OPTION value="18">18</OPTION> 
							 <OPTION value="19">19</OPTION> 
							 <OPTION value="20">20</OPTION> 
							 <OPTION value="21">21</OPTION> 
							 <OPTION value="22">22</OPTION> 
							 <OPTION value="23">23</OPTION> 
							 <OPTION value="24">24</OPTION> 
							 <OPTION value="25">25</OPTION> 
							 <OPTION value="26">26</OPTION> 
							 <OPTION value="27">27</OPTION> 
							 <OPTION value="28">28</OPTION> 
							 <OPTION value="29">29</OPTION> 
							 <OPTION value="30">30</OPTION> 
                    </SELECT>
                    <br />
                </fieldset>
                <input type="submit" value="Valider" style="border: none;background : black;font-size:15px;color:#ffa200;" />
            </form>
        </div>     
     
        
<jsp:include page="sidebar.jsp"></jsp:include>        
<jsp:include page="footer.jsp"></jsp:include>