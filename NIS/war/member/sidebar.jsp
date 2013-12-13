<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div id="sidebar" class="right">
	<%
		int i =(int) (Math.random() * 8 ); 
		String author ="";
		String citation ="";
		switch (i) 
		{ 
		case 0: author = "Mohammed Ali"; citation ="On ne devient pas champion dans un gymnase. On devient champion grâce à ce qu'on ressent ; un désir, un rêve, une vision. On doit avoir du talent et de la technique. Mais le talent doit être plus fort que la technique."; break; 
		case 1:  author = "Ayrton Senna"; citation ="Idéalement nous sommes ce que nous pensons. Dans la réalité, nous sommes ce que nous accomplissons."; break; 
		case 2:  author = "Michael Jordan"; citation ="Si vous rentrez dans un mur, n'abandonnez pas. Trouvez un moyen de l'escalader, le traverser, ou travaillez autour."; break; 
		case 3:  author = "Eric Cantona"; citation ="Les Anglais ont inventé le foot, les Français l'ont organisé, les Italiens le mettent en scène."; break; 
		case 4:  author = "Mohammed Ali"; citation ="Qui a la même vision du monde à vingt ans qu'à cinquante, a perdu trente ans de sa vie."; break; 
		case 5:  author = "Magic Johnson"; citation ="Zidane, c'est moi et Michael Jordan réunis."; break; 
		case 6: author ="Diego Maradona"; citation ="Arriver dans la surface et ne pas pouvoir tirer au but, c'est comme danser avec sa soeur.";break;
		case 7: author ="Usain Bolt" ; citation ="Je suis une légende vivante"; break;
		}
	%>



       <div class="box">
          <h2 class="title"><a href="/member/recherche.jsp" > Recherche Activité</a></h2>
          <div class="widget-item">
            <p> Envie de faire du sport ?<br /> Faites une recherche sur les activités que les membres proposent.</p>
          </div>
        </div>
         
        <div class="box">
          <h2 class="title">Citation Sportive!</h2>
          <div class="follow-item">
            <p><span class="author"><%= author %></span>: <%= citation %></p>
          </div>
        </div>
      </div>
      <div class="cl">&nbsp;</div>
    </div>
  </div>