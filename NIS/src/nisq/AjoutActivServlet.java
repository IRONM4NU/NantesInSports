package nisq;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;

import nisq.Membre;

import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;

@SuppressWarnings("serial")
public class AjoutActivServlet extends HttpServlet {
	static {
        ObjectifyService.register(Membre.class); // Fait conna�tre votre classe-entit� � Objectify
        ObjectifyService.register(Activity.class);
        ObjectifyService.register(Preference.class);
    }
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		    UserService userService = UserServiceFactory.getUserService();
	        User user = userService.getCurrentUser();
	        
	        // R�cup�ration et affichage des activit�es du sites
        	List<Activity> activitys = ofy().load().type(Activity.class).list();
        	String listActivity = "";
        	for(Activity activity : activitys){
        		listActivity +=  activity.getSport() + " ";
        		
        	}
        	//response.setContentType("text/plain");
            //response.getWriter().println("Hello, " + user.getNickname() + listActivity);

	        if (user != null) {
	            
	        	try {
	        		Key<Membre> cleParent = Key.create(Membre.class, user.getNickname());
	        		Membre member =  ofy().load().key(cleParent).now();
	        		
	        		// DateFormat format = new SimpleDateFormat("dd/MM/yyyy"); // change le format de la date !!!
	        		 
	        		DateFormat format = new SimpleDateFormat("yyyy/MM/dd");
	        		
	        		String sport = request.getParameter( "sport" );
		            String localisation = request.getParameter( "localisation" );
		            String date = request.getParameter( "date" );
		            String dateCreation = format.format(new Date());
		            List<Key<Membre>> participant = new LinkedList<Key<Membre>>();
		            participant.add(cleParent);
		            int placesRest = Integer.parseInt(request.getParameter("placesRest"));

		            if(ofy().load().type(Activity.class).filter("date",date).filter("localisation", localisation).list().isEmpty()) {
			            Activity a = new Activity(cleParent, sport, localisation, dateCreation, date, participant , placesRest);
			            ofy().save().entity(a).now(); // enregistrement de l'activit� dans le datastore
		            }    
		            String mes = sport + " " + localisation + " " + date + " " +  placesRest + " .";
		            
		            request.setAttribute( "mes", mes );
		            request.setAttribute( "sport", sport);
		            request.setAttribute( "localisation", localisation );
		            request.setAttribute( "date", date );
		                         
		          //R�cup�ration des membres
	        		/*List<Membre> membres = ofy().load().type(Membre.class).list();
	        		if(!membres.isEmpty()){
	        			for(Membre membre : membres){
		        			System.out.println(membre.getNom());
		        			// R�cup�re la liste(� un seul �l�ment) des pr�f�rences du membre
		        			List<Preference> preferences = ofy().load().type(Preference.class).ancestor(KeyFactory.createKey("Membre", membre.getNom())).list();    		
		        			
			        		String sportM1 = preferences.get(0).getSport1();
			        		String sportM2 = preferences.get(0).getSport2();
			        		String sportM3 = preferences.get(0).getSport3();
			        		
			        		String localM1 = preferences.get(0).getLocalisation1();
			        		String localM2 = preferences.get(0).getLocalisation2();
			        		String localM3 = preferences.get(0).getLocalisation3();
			        		
			        		
			        		String adressMail = membre.getMail();
			        		
			        		boolean envoiMail =false;
			        		
			        		
			        		if(sport.equals(sportM1)){
			        			if(localisation.equals(localM1)){
			        				envoiMail = true;
			        			}
			        		}
			        		if(sport.equals(sportM2)){
			           			if(localisation.equals(localM2)){
			        				envoiMail = true;
			        			}
			        		}
			        		if(sport.equals(sportM3)){
			        			if(localisation.equals(localM3)){
			        				envoiMail = true;
			        			}
			        		}*/

			        		//if(envoiMail){
			        			/*try {
						                Properties props = new Properties();
						               
						                Session session = Session.getDefaultInstance(props, null);
						             
						                String message = " Bonjour, une activit�e : " + sport + " qui aura lieu � : " + localisation + "  le " + date + ", a �t� cr�er sur Nantes In Sports ";
						               
						                Message msg = new MimeMessage(session);

						                msg.setFrom(new InternetAddress("galliotgreg@gmail.com", "Nantes in Sports"));
						
						                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(adressMail));
						             
						                msg.setSubject("Une nouvelle activit�e qui peut vous int�resser !!!");

						                msg.setText(message);
						              
						                Transport.send(msg);
						               
						            } catch (MessagingException e) {
						            }*/
			        		//}
	        			//}	
	        		//}
	            	//this.getServletContext().getRequestDispatcher( "/member/newactivity.jsp" ).forward( request, response );
		            this.getServletContext().getRequestDispatcher( "/activmail" ).forward( request, response );
				} catch (ServletException /*| MessagingException*/ e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
					System.out.println(e.toString());
				}	       	    

	        }
	     }
	}
	
