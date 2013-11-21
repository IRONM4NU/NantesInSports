package nisq;

import nisq.Membre;

import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.*;

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

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class NISServlet extends HttpServlet {
	
	  static {
	        ObjectifyService.register(Membre.class); // Fait connaître votre classe-entité à Objectify
	        ObjectifyService.register(Activity.class); // Fait connaître votre classe-entité à Objectify
	        ObjectifyService.register(Preference.class); 
	    }
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
					
		    UserService userService = UserServiceFactory.getUserService();
	        User user = userService.getCurrentUser();
	        
	        // Si le membre est connecté (compte google)
	        if (user != null) {
	          // Si il s'agit de sa première connexion	        
	          if(ofy().load().type(Membre.class).filter("id",user.getUserId()).list().isEmpty()) {
	           
	           // ajout d'un nouveau membre 
	           Membre m = new Membre(user.getNickname(),user.getUserId(),user.getEmail());
	           ofy().save().entity(m); // enregistrement du membre sur le datastore	
	            	
		            try {
		            	// envoi d'un mail de bienvenue
		                Properties props = new Properties();
		                Session session = Session.getDefaultInstance(props, null);
		                 
		                String message = "  Merci de vous êtes inscrit. Maintenant vous pouvez organiser des activitées sportives sur Nantes.";
		                 
		                Message msg = new MimeMessage(session);
		                msg.setFrom(new InternetAddress("galliotgreg@gmail.com", "Nantes in Sports"));
		                msg.addRecipient(Message.RecipientType.TO,
		                                 new InternetAddress(user.getEmail(), user.getNickname()));
		                msg.setSubject("Bienvenue sur Nantes in Sports !");
		                msg.setText(message);
		                Transport.send(msg);
		            } catch (MessagingException e) {
		                e.printStackTrace();
		            }
		            try {
						this.getServletContext().getRequestDispatcher("/member/ajouterpref.jsp").forward(req, resp);
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	          } else {
	        	  
	        	  	// Récupération des activitées qui auront lieu le plus rapidement
		        	List<Activity> acts = ofy().load().type(Activity.class).order("date").limit(5).list();
		        	req.setAttribute( "acts", acts );       		
	        	  
	        	  try {
	  					this.getServletContext().getRequestDispatcher("/member/home.jsp").forward(req, resp);
	  				} catch (ServletException e) {
	  				
	  					e.printStackTrace();
	  				}
	          }
	        } else {
	            resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
	        }
	        
	    }
	}
