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
                    <label for="sport1">Activité 1:<span class="requis">*</span></label>
                    <!--<input type="text" id="sport1" name="sport1" value="" />--> 
                    <SELECT id="sport1" name="sport1" >
							<OPTION value="Piscine">Piscine</OPTION> 
							<OPTION value="Basket">Basket</OPTION> 
							<OPTION value="Tennis">Tennis</OPTION> 
							<OPTION value="Skate">Skate</OPTION> 
							<OPTION value="Football">Football</OPTION> 
							<OPTION value="Running">Running</OPTION> 
							<OPTION value="Pétanque">Pétanque</OPTION> 
							<OPTION value="Baseball">Baseball</OPTION> 
							<OPTION value="Rugby">Rugby</OPTION>
					</SELECT>
                    <br />
                     
                    <label for="localisation">Localisation 1:<span class="requis">*</span></label>
                    <!--<input type="text" id="localisation1" name="localisation1" value="" /> -->
                    <SELECT id="localisation1" name="localisation1" >                  	
						 <OPTION value="Stade Marcel Saupin">Stade Marcel Saupin</OPTION> 
						 <OPTION value="Stade de la Beaujoire Louis Fonteneau">Stade de la Beaujoire Louis Fonteneau</OPTION> 
						 <OPTION value="Plaine de Jeux Colinière">Plaine de Jeux Colinière</OPTION> 
						 <OPTION value="Plaine de Jeux Basses Landes">Plaine de Jeux Basses Landes</OPTION> 
						 <OPTION value="Vélodrome Stade Petit Breton">Vélodrome Stade Petit Breton</OPTION> 
						 <OPTION value="Plaine de Jeux Durantière">Plaine de Jeux Durantière</OPTION> 
						 <OPTION value="Piscine du Petit Port">Piscine du Petit Port</OPTION> 
						 <OPTION value="Piscine Durantière">Piscine Durantière</OPTION> 
						 <OPTION value="Piscine Dervallières">Piscine Dervallières</OPTION> 
						 <OPTION value="Piscine Léo Lagrange Ile Gloriette">Piscine Léo Lagrange Ile Gloriette</OPTION> 
						 <OPTION value="Plaine de Jeux de la Beaujoire">Plaine de Jeux de la Beaujoire</OPTION> 
						 <OPTION value="Stade La Halvêque">Stade La Halvêque</OPTION> 
						 <OPTION value="Plateau Sportif du Port Boyer">Plateau Sportif du Port Boyer</OPTION> 
						 <OPTION value="Stade Annexe Louis Fonteneau">Stade Annexe Louis Fonteneau</OPTION> 
						 <OPTION value="Espace de Proximité La Grande Noue">Espace de Proximité La Grande Noue</OPTION> 
						 <OPTION value="Stade Caserne Quartier Mellinet">Stade Caserne Quartier Mellinet</OPTION> 
						 <OPTION value="Stade Gendarmerie Mobile">Stade Gendarmerie Mobile</OPTION> 
						 <OPTION value="Espace Sportif de Proximité du Clos Toreau">Espace Sportif de Proximité du Clos Toreau</OPTION> 
						 <OPTION value="Stade de la Gilarderie">Stade de la Gilarderie</OPTION> 
						 <OPTION value="Plaine de Jeux des Bourdonnières">Plaine de Jeux des Bourdonnières</OPTION> 
						 <OPTION value="Stade Lycée La Chauvinière">Stade Lycée La Chauvinière</OPTION> 
						 <OPTION value="Plaine de Jeux du Petit Port">Plaine de Jeux du Petit Port</OPTION> 
						 <OPTION value="Stade Launay Violette">Stade Launay Violette</OPTION> 
						 <OPTION value="Stade Ecole Centrale">Stade Ecole Centrale</OPTION> 
						 <OPTION value="Stade Procé">Stade Procé</OPTION> 
						 <OPTION value="Stade Annexe de Procé">Stade Annexe de Procé</OPTION> 
						 <OPTION value="Plaine de Jeux Bernardière">Plaine de Jeux Bernardière</OPTION> 
						 <OPTION value="Plaine de Jeux Lycée Albert Camus">Plaine de Jeux Lycée Albert Camus</OPTION> 
						 <OPTION value="Stade Lycée Carcouët">Stade Lycée Carcouët</OPTION> 
						 <OPTION value="Plaine de Jeux des Dervallières">Plaine de Jeux des Dervallières</OPTION> 
						 <OPTION value="Stade Pascal-Laporte">Stade Pascal-Laporte</OPTION> 
						 <OPTION value="Piscine Jules Verne Haluchère">Piscine Jules Verne Haluchère</OPTION> 
						 <OPTION value="Stade Jean Jacques Audubon">Stade Jean Jacques Audubon</OPTION> 
						 <OPTION value="Plaine de Jeux l'Eraudière">Plaine de Jeux l'Eraudière</OPTION> 
						 <OPTION value="Equipement Sportif de Proximité La Halvêque">Equipement Sportif de Proximité La Halvêque</OPTION> 
						 <OPTION value="Plaine de Jeux Marrière">Plaine de Jeux Marrière</OPTION> 
						 <OPTION value="Plaine de Jeux Sévres">Plaine de Jeux Sévres</OPTION> 
						 <OPTION value="Plaines de jeux Gaston Turpin">Plaines de jeux Gaston Turpin</OPTION> 
						 <OPTION value="Stade de la Gilarderie">Stade de la Gilarderie</OPTION> 
						 <OPTION value="Stade l'Amande">Stade l'Amande</OPTION> 
						 <OPTION value="Stade Michel Lecointre Beaulieu">Stade Michel Lecointre Beaulieu</OPTION> 
						 <OPTION value="Stade Pin Sec">Stade Pin Sec</OPTION> 
						 <OPTION value="Plaine de Jeux Grand Blottereau">Plaine de Jeux Grand Blottereau</OPTION> 
						 <OPTION value="Stade de la Roche">Stade de la Roche</OPTION> 
						 <OPTION value="Plaine de Jeux Géraudière Santos Dumont">Plaine de Jeux Géraudière Santos Dumont</OPTION> 
						 <OPTION value="Hippodrome du Petit Port">Hippodrome du Petit Port</OPTION> 
						 <OPTION value="Stade des Dervallières">Stade des Dervallières</OPTION> 
						 <OPTION value="Stade Mangin Beaulieu">Stade Mangin Beaulieu</OPTION> 
						 <OPTION value="Circuits Rustiques d'Activités Plein Air - Blottereau">Circuits Rustiques d'Activités Plein Air - Blottereau</OPTION> 
						 <OPTION value="Circuits Rustiques d'Activités Plein Air - Ile de Nantes">Circuits Rustiques d'Activités Plein Air - Ile de Nantes</OPTION> 
						 <OPTION value="Plateau Sportif Bourgeonnière">Plateau Sportif Bourgeonnière</OPTION> 
						 <OPTION value="Skatepark Le Hangar">Skatepark Le Hangar</OPTION> 
						 <OPTION value="Piscine Petite Amazonie">Piscine Petite Amazonie</OPTION> 
						 <OPTION value="Skate Park Ricordeau">Skate Park Ricordeau</OPTION> 
						 <OPTION value="Boulodrome Noë Lambert">Boulodrome Noë Lambert</OPTION> 
						 <OPTION value="Boulodrome du Breil">Boulodrome du Breil</OPTION> 
						 <OPTION value="Skate Schuman">Skate Schuman</OPTION> 
						 <OPTION value="Plaine de Jeux St-Joseph de Porterie">Plaine de Jeux St-Joseph de Porterie</OPTION> 
						 <OPTION value="Plaine de Jeux du Lycée de la Colinière">Plaine de Jeux du Lycée de la Colinière</OPTION> 
						 <OPTION value="Halle de Tennis de la Marrière">Halle de Tennis de la Marrière</OPTION> 
						 <OPTION value="Plaine de Jeux de la Noë Lambert">Plaine de Jeux de la Noë Lambert</OPTION> 
						 <OPTION value="Boulodrome du Bèle">Boulodrome du Bèle</OPTION> 
					</SELECT>
                    <br />
                    
                    <label for="sport">Activité 2:<span class="requis">*</span></label>
                    <!--<input type="text" id="sport2" name="sport2" value="" />-->
                    <SELECT id="sport2" name="sport2" >
							<OPTION value="Piscine">Piscine</OPTION> 
							<OPTION value="Basket">Basket</OPTION> 
							<OPTION value="Tennis">Tennis</OPTION> 
							<OPTION value="Skate">Skate</OPTION> 
							<OPTION value="Football">Football</OPTION> 
							<OPTION value="Running">Running</OPTION> 
							<OPTION value="Pétanque">Pétanque</OPTION> 
							<OPTION value="Baseball">Baseball</OPTION> 
							<OPTION value="Rugby">Rugby</OPTION>
					</SELECT> 
                    <br />
                     
                    <label for="localisation">Localisation 2:<span class="requis">*</span></label>
                    <!-- <input type="text" id="localisation2" name="localisation2" value="" />-->
                    <SELECT id="localisation2" name="localisation2" >                  	
						 <OPTION value="Stade Marcel Saupin">Stade Marcel Saupin</OPTION> 
						 <OPTION value="Stade de la Beaujoire Louis Fonteneau">Stade de la Beaujoire Louis Fonteneau</OPTION> 
						 <OPTION value="Plaine de Jeux Colinière">Plaine de Jeux Colinière</OPTION> 
						 <OPTION value="Plaine de Jeux Basses Landes">Plaine de Jeux Basses Landes</OPTION> 
						 <OPTION value="Vélodrome Stade Petit Breton">Vélodrome Stade Petit Breton</OPTION> 
						 <OPTION value="Plaine de Jeux Durantière">Plaine de Jeux Durantière</OPTION> 
						 <OPTION value="Piscine du Petit Port">Piscine du Petit Port</OPTION> 
						 <OPTION value="Piscine Durantière">Piscine Durantière</OPTION> 
						 <OPTION value="Piscine Dervallières">Piscine Dervallières</OPTION> 
						 <OPTION value="Piscine Léo Lagrange Ile Gloriette">Piscine Léo Lagrange Ile Gloriette</OPTION> 
						 <OPTION value="Plaine de Jeux de la Beaujoire">Plaine de Jeux de la Beaujoire</OPTION> 
						 <OPTION value="Stade La Halvêque">Stade La Halvêque</OPTION> 
						 <OPTION value="Plateau Sportif du Port Boyer">Plateau Sportif du Port Boyer</OPTION> 
						 <OPTION value="Stade Annexe Louis Fonteneau">Stade Annexe Louis Fonteneau</OPTION> 
						 <OPTION value="Espace de Proximité La Grande Noue">Espace de Proximité La Grande Noue</OPTION> 
						 <OPTION value="Stade Caserne Quartier Mellinet">Stade Caserne Quartier Mellinet</OPTION> 
						 <OPTION value="Stade Gendarmerie Mobile">Stade Gendarmerie Mobile</OPTION> 
						 <OPTION value="Espace Sportif de Proximité du Clos Toreau">Espace Sportif de Proximité du Clos Toreau</OPTION> 
						 <OPTION value="Stade de la Gilarderie">Stade de la Gilarderie</OPTION> 
						 <OPTION value="Plaine de Jeux des Bourdonnières">Plaine de Jeux des Bourdonnières</OPTION> 
						 <OPTION value="Stade Lycée La Chauvinière">Stade Lycée La Chauvinière</OPTION> 
						 <OPTION value="Plaine de Jeux du Petit Port">Plaine de Jeux du Petit Port</OPTION> 
						 <OPTION value="Stade Launay Violette">Stade Launay Violette</OPTION> 
						 <OPTION value="Stade Ecole Centrale">Stade Ecole Centrale</OPTION> 
						 <OPTION value="Stade Procé">Stade Procé</OPTION> 
						 <OPTION value="Stade Annexe de Procé">Stade Annexe de Procé</OPTION> 
						 <OPTION value="Plaine de Jeux Bernardière">Plaine de Jeux Bernardière</OPTION> 
						 <OPTION value="Plaine de Jeux Lycée Albert Camus">Plaine de Jeux Lycée Albert Camus</OPTION> 
						 <OPTION value="Stade Lycée Carcouët">Stade Lycée Carcouët</OPTION> 
						 <OPTION value="Plaine de Jeux des Dervallières">Plaine de Jeux des Dervallières</OPTION> 
						 <OPTION value="Stade Pascal-Laporte">Stade Pascal-Laporte</OPTION> 
						 <OPTION value="Piscine Jules Verne Haluchère">Piscine Jules Verne Haluchère</OPTION> 
						 <OPTION value="Stade Jean Jacques Audubon">Stade Jean Jacques Audubon</OPTION> 
						 <OPTION value="Plaine de Jeux l'Eraudière">Plaine de Jeux l'Eraudière</OPTION> 
						 <OPTION value="Equipement Sportif de Proximité La Halvêque">Equipement Sportif de Proximité La Halvêque</OPTION> 
						 <OPTION value="Plaine de Jeux Marrière">Plaine de Jeux Marrière</OPTION> 
						 <OPTION value="Plaine de Jeux Sévres">Plaine de Jeux Sévres</OPTION> 
						 <OPTION value="Plaines de jeux Gaston Turpin">Plaines de jeux Gaston Turpin</OPTION> 
						 <OPTION value="Stade de la Gilarderie">Stade de la Gilarderie</OPTION> 
						 <OPTION value="Stade l'Amande">Stade l'Amande</OPTION> 
						 <OPTION value="Stade Michel Lecointre Beaulieu">Stade Michel Lecointre Beaulieu</OPTION> 
						 <OPTION value="Stade Pin Sec">Stade Pin Sec</OPTION> 
						 <OPTION value="Plaine de Jeux Grand Blottereau">Plaine de Jeux Grand Blottereau</OPTION> 
						 <OPTION value="Stade de la Roche">Stade de la Roche</OPTION> 
						 <OPTION value="Plaine de Jeux Géraudière Santos Dumont">Plaine de Jeux Géraudière Santos Dumont</OPTION> 
						 <OPTION value="Hippodrome du Petit Port">Hippodrome du Petit Port</OPTION> 
						 <OPTION value="Stade des Dervallières">Stade des Dervallières</OPTION> 
						 <OPTION value="Stade Mangin Beaulieu">Stade Mangin Beaulieu</OPTION> 
						 <OPTION value="Circuits Rustiques d'Activités Plein Air - Blottereau">Circuits Rustiques d'Activités Plein Air - Blottereau</OPTION> 
						 <OPTION value="Circuits Rustiques d'Activités Plein Air - Ile de Nantes">Circuits Rustiques d'Activités Plein Air - Ile de Nantes</OPTION> 
						 <OPTION value="Plateau Sportif Bourgeonnière">Plateau Sportif Bourgeonnière</OPTION> 
						 <OPTION value="Skatepark Le Hangar">Skatepark Le Hangar</OPTION> 
						 <OPTION value="Piscine Petite Amazonie">Piscine Petite Amazonie</OPTION> 
						 <OPTION value="Skate Park Ricordeau">Skate Park Ricordeau</OPTION> 
						 <OPTION value="Boulodrome Noë Lambert">Boulodrome Noë Lambert</OPTION> 
						 <OPTION value="Boulodrome du Breil">Boulodrome du Breil</OPTION> 
						 <OPTION value="Skate Schuman">Skate Schuman</OPTION> 
						 <OPTION value="Plaine de Jeux St-Joseph de Porterie">Plaine de Jeux St-Joseph de Porterie</OPTION> 
						 <OPTION value="Plaine de Jeux du Lycée de la Colinière">Plaine de Jeux du Lycée de la Colinière</OPTION> 
						 <OPTION value="Halle de Tennis de la Marrière">Halle de Tennis de la Marrière</OPTION> 
						 <OPTION value="Plaine de Jeux de la Noë Lambert">Plaine de Jeux de la Noë Lambert</OPTION> 
						 <OPTION value="Boulodrome du Bèle">Boulodrome du Bèle</OPTION> 
					</SELECT>
                    <br />
                    
                    <label for="sport">Activité 3:<span class="requis">*</span></label>
                    <!--<input type="text" id="sport3" name="sport3" value="" />-->
                    <SELECT id="sport3" name="sport3" >
							<OPTION value="Piscine">Piscine</OPTION> 
							<OPTION value="Basket">Basket</OPTION> 
							<OPTION value="Tennis">Tennis</OPTION> 
							<OPTION value="Skate">Skate</OPTION> 
							<OPTION value="Football">Football</OPTION> 
							<OPTION value="Running">Running</OPTION> 
							<OPTION value="Pétanque">Pétanque</OPTION> 
							<OPTION value="Baseball">Baseball</OPTION> 
							<OPTION value="Rugby">Rugby</OPTION>
					</SELECT><br />
                     
                    <label for="localisation">Localisation 3:<span class="requis">*</span></label>
                    <!--<input type="text" id="localisation3" name="localisation3" value="" />-->
                    <SELECT id="localisation3" name="localisation3" >                  	
						 <OPTION value="Stade Marcel Saupin">Stade Marcel Saupin</OPTION> 
						 <OPTION value="Stade de la Beaujoire Louis Fonteneau">Stade de la Beaujoire Louis Fonteneau</OPTION> 
						 <OPTION value="Plaine de Jeux Colinière">Plaine de Jeux Colinière</OPTION> 
						 <OPTION value="Plaine de Jeux Basses Landes">Plaine de Jeux Basses Landes</OPTION> 
						 <OPTION value="Vélodrome Stade Petit Breton">Vélodrome Stade Petit Breton</OPTION> 
						 <OPTION value="Plaine de Jeux Durantière">Plaine de Jeux Durantière</OPTION> 
						 <OPTION value="Piscine du Petit Port">Piscine du Petit Port</OPTION> 
						 <OPTION value="Piscine Durantière">Piscine Durantière</OPTION> 
						 <OPTION value="Piscine Dervallières">Piscine Dervallières</OPTION> 
						 <OPTION value="Piscine Léo Lagrange Ile Gloriette">Piscine Léo Lagrange Ile Gloriette</OPTION> 
						 <OPTION value="Plaine de Jeux de la Beaujoire">Plaine de Jeux de la Beaujoire</OPTION> 
						 <OPTION value="Stade La Halvêque">Stade La Halvêque</OPTION> 
						 <OPTION value="Plateau Sportif du Port Boyer">Plateau Sportif du Port Boyer</OPTION> 
						 <OPTION value="Stade Annexe Louis Fonteneau">Stade Annexe Louis Fonteneau</OPTION> 
						 <OPTION value="Espace de Proximité La Grande Noue">Espace de Proximité La Grande Noue</OPTION> 
						 <OPTION value="Stade Caserne Quartier Mellinet">Stade Caserne Quartier Mellinet</OPTION> 
						 <OPTION value="Stade Gendarmerie Mobile">Stade Gendarmerie Mobile</OPTION> 
						 <OPTION value="Espace Sportif de Proximité du Clos Toreau">Espace Sportif de Proximité du Clos Toreau</OPTION> 
						 <OPTION value="Stade de la Gilarderie">Stade de la Gilarderie</OPTION> 
						 <OPTION value="Plaine de Jeux des Bourdonnières">Plaine de Jeux des Bourdonnières</OPTION> 
						 <OPTION value="Stade Lycée La Chauvinière">Stade Lycée La Chauvinière</OPTION> 
						 <OPTION value="Plaine de Jeux du Petit Port">Plaine de Jeux du Petit Port</OPTION> 
						 <OPTION value="Stade Launay Violette">Stade Launay Violette</OPTION> 
						 <OPTION value="Stade Ecole Centrale">Stade Ecole Centrale</OPTION> 
						 <OPTION value="Stade Procé">Stade Procé</OPTION> 
						 <OPTION value="Stade Annexe de Procé">Stade Annexe de Procé</OPTION> 
						 <OPTION value="Plaine de Jeux Bernardière">Plaine de Jeux Bernardière</OPTION> 
						 <OPTION value="Plaine de Jeux Lycée Albert Camus">Plaine de Jeux Lycée Albert Camus</OPTION> 
						 <OPTION value="Stade Lycée Carcouët">Stade Lycée Carcouët</OPTION> 
						 <OPTION value="Plaine de Jeux des Dervallières">Plaine de Jeux des Dervallières</OPTION> 
						 <OPTION value="Stade Pascal-Laporte">Stade Pascal-Laporte</OPTION> 
						 <OPTION value="Piscine Jules Verne Haluchère">Piscine Jules Verne Haluchère</OPTION> 
						 <OPTION value="Stade Jean Jacques Audubon">Stade Jean Jacques Audubon</OPTION> 
						 <OPTION value="Plaine de Jeux l'Eraudière">Plaine de Jeux l'Eraudière</OPTION> 
						 <OPTION value="Equipement Sportif de Proximité La Halvêque">Equipement Sportif de Proximité La Halvêque</OPTION> 
						 <OPTION value="Plaine de Jeux Marrière">Plaine de Jeux Marrière</OPTION> 
						 <OPTION value="Plaine de Jeux Sévres">Plaine de Jeux Sévres</OPTION> 
						 <OPTION value="Plaines de jeux Gaston Turpin">Plaines de jeux Gaston Turpin</OPTION> 
						 <OPTION value="Stade de la Gilarderie">Stade de la Gilarderie</OPTION> 
						 <OPTION value="Stade l'Amande">Stade l'Amande</OPTION> 
						 <OPTION value="Stade Michel Lecointre Beaulieu">Stade Michel Lecointre Beaulieu</OPTION> 
						 <OPTION value="Stade Pin Sec">Stade Pin Sec</OPTION> 
						 <OPTION value="Plaine de Jeux Grand Blottereau">Plaine de Jeux Grand Blottereau</OPTION> 
						 <OPTION value="Stade de la Roche">Stade de la Roche</OPTION> 
						 <OPTION value="Plaine de Jeux Géraudière Santos Dumont">Plaine de Jeux Géraudière Santos Dumont</OPTION> 
						 <OPTION value="Hippodrome du Petit Port">Hippodrome du Petit Port</OPTION> 
						 <OPTION value="Stade des Dervallières">Stade des Dervallières</OPTION> 
						 <OPTION value="Stade Mangin Beaulieu">Stade Mangin Beaulieu</OPTION> 
						 <OPTION value="Circuits Rustiques d'Activités Plein Air - Blottereau">Circuits Rustiques d'Activités Plein Air - Blottereau</OPTION> 
						 <OPTION value="Circuits Rustiques d'Activités Plein Air - Ile de Nantes">Circuits Rustiques d'Activités Plein Air - Ile de Nantes</OPTION> 
						 <OPTION value="Plateau Sportif Bourgeonnière">Plateau Sportif Bourgeonnière</OPTION> 
						 <OPTION value="Skatepark Le Hangar">Skatepark Le Hangar</OPTION> 
						 <OPTION value="Piscine Petite Amazonie">Piscine Petite Amazonie</OPTION> 
						 <OPTION value="Skate Park Ricordeau">Skate Park Ricordeau</OPTION> 
						 <OPTION value="Boulodrome Noë Lambert">Boulodrome Noë Lambert</OPTION> 
						 <OPTION value="Boulodrome du Breil">Boulodrome du Breil</OPTION> 
						 <OPTION value="Skate Schuman">Skate Schuman</OPTION> 
						 <OPTION value="Plaine de Jeux St-Joseph de Porterie">Plaine de Jeux St-Joseph de Porterie</OPTION> 
						 <OPTION value="Plaine de Jeux du Lycée de la Colinière">Plaine de Jeux du Lycée de la Colinière</OPTION> 
						 <OPTION value="Halle de Tennis de la Marrière">Halle de Tennis de la Marrière</OPTION> 
						 <OPTION value="Plaine de Jeux de la Noë Lambert">Plaine de Jeux de la Noë Lambert</OPTION> 
						 <OPTION value="Boulodrome du Bèle">Boulodrome du Bèle</OPTION> 
					</SELECT>
                    <br />
     
                </fieldset>
                <input type="submit" value="Valider"  />
            </form>
        </div>     
        </div>   
        
<jsp:include page="sidebar.jsp"></jsp:include>        
<jsp:include page="footer.jsp"></jsp:include>