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
public class Inscrit extends HttpServlet {
	static {
        ObjectifyService.register(Membre.class); // Fait connaître votre classe-entité à Objectify
        ObjectifyService.register(Activity.class);
        ObjectifyService.register(Preference.class);
    }
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		    UserService userService = UserServiceFactory.getUserService();
	        User user = userService.getCurrentUser();	
        	
	        if (user != null) {
	        	String sport = request.getParameter( "sport" );
			    String localisation = request.getParameter( "localisation" );
			    String date = request.getParameter( "date" );
			    
			    
			    // Récupération et affichage des activitées du sites
				List<Activity> activitys = ofy().load().type(Activity.class).filter("sport", sport).filter("localisation", localisation).filter("date", date).list();
				if ( ! activitys.isEmpty() && activitys.size()==1){
					
					try {
		        		Key<Membre> cle = Key.create(Membre.class, user.getNickname());
		        		Membre member =  ofy().load().key(cle).now();
		        		
		        		List<Key<Membre>> parts =activitys.get(0).getParticipant();
		        		parts.add(cle); // ajout du membre à l'activitée
		        				        		
		        		String dateCreation = activitys.get(0).getDateCreation();
		        		Key<Membre> key = activitys.get(0).getParent();
		        		int placesRest = activitys.get(0).getPlacesRest() -1;
		        		
		        		Activity act = new Activity(
		        	    		 key,
		        	    		 sport,
		        	    		 localisation, 
		        	    		 dateCreation,
		        	    		 date,
		        	    		 parts,
		        	    		 placesRest	);
		        	
		        		String id = user.getUserId();

		        		String mail =user.getEmail();
		        		String nom =user.getNickname();

		        		Membre mem = new Membre(nom,id,mail);

		        		ofy().delete().entities(activitys).now();

		        		ofy().save().entity(act).now();
		        		
		        		try {
			                Properties props = new Properties();
			               
			                Session session = Session.getDefaultInstance(props, null);
			             
			                String message = " Bonjour, vous venez de vous inscrire pour faire : " + sport + " qui aura lieu à : " + localisation + "  le " + date + ", à bientôt sur Nantes In Sports ";
			                String subject = "Vous vous êtes inscrit à une activitée !!!";
			                
			                Message msg = new MimeMessage(session);

			                msg.setFrom(new InternetAddress("galliotgreg@gmail.com", "Nantes in Sports"));
			               
			                msg.addRecipient(Message.RecipientType.TO,
			                                 new InternetAddress(user.getEmail(), user.getNickname()));
			             
			                msg.setSubject(subject);

			                msg.setText(message);
			              
			                Transport.send(msg);
			               
			            } catch (MessagingException e) {
			                e.printStackTrace();
			            }
			             		            
		            	this.getServletContext().getRequestDispatcher( "/nis" ).forward( request, response );
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}	
					
				}
	               	        
	     }
	}
	
}