package nisq;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;

import nisq.Membre;
import nisq.Preference;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;

@SuppressWarnings("serial")
public class AjoutPref extends HttpServlet {
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
	        	// R�cup�re toutes les armes qui ont pour anc�tre mon objet personnage
	        	
	            
	        	try {
	        		Key<Membre> cleParent = Key.create(Membre.class, user.getNickname());
	        		Membre membre =  ofy().load().key(cleParent).now();
	        		boolean pref = ofy().load().type(Preference.class).ancestor(cleParent).list().isEmpty();
	        		
	        		String sport1 = request.getParameter( "sport1" );
		            String localisation1 = request.getParameter( "localisation1" );
		            
		            String sport2 = request.getParameter( "sport2" );
		            String localisation2 = request.getParameter( "localisation2" );
		            
		            String sport3 = request.getParameter( "sport3" );
		            String localisation3 = request.getParameter( "localisation3" );
	        		
	        		// Cr�ation des pr�f�rences
	        		if( !pref){ // mise � jour
	        			Iterable<Key<Preference>> clesPreference = ofy().load().type(Preference.class).ancestor(cleParent).keys();
	        			ofy().delete().keys(clesPreference);// suppression des anciennes prefs	
	        		}
	        		
	        		Preference p = new Preference(cleParent, sport1, localisation1, sport2, localisation2, sport3, localisation3);
			        ofy().save().entity(p).now(); // enregistrement des pr�f�rences dans le datastore
		                
	            	this.getServletContext().getRequestDispatcher( "/affichpref" ).forward( request, response );
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	       	    
	        /*    
	            // envoie du mail de confirmation
	            try {
	                Properties props = new Properties();
	                Session session = Session.getDefaultInstance(props, null);
	                 
	                String message = " Vous venez d'ajoutez l'activit� "+ req.getAttribute("title") +" � votre compte. A bient�t sur Nantes in Sports." ;
	                 
	                Message msg = new MimeMessage(session);
	                msg.setFrom(new InternetAddress("galliotgreg@gmail.com", "Nantes in Sports"));
	                msg.addRecipient(Message.RecipientType.TO,
	                                 new InternetAddress(user.getEmail(), user.getNickname()));
	                msg.setSubject("Ajout d'une activit� sur votre compte sur Nantes in Sports !");
	                msg.setText(message);
	                Transport.send(msg);
	            } catch (MessagingException e) {
	                e.printStackTrace();
	            }
	            resp.sendRedirect("./member/nis.jsp");
	        } else {
	            resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
	        }*/
	        }
	     }
	}
	
