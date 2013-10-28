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

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;

@SuppressWarnings("serial")
public class AjoutActivServlet extends HttpServlet {
	static {
        ObjectifyService.register(Membre.class); // Fait connaître votre classe-entité à Objectify
        ObjectifyService.register(Activity.class);
    }
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		    UserService userService = UserServiceFactory.getUserService();
	        User user = userService.getCurrentUser();
	        
	        // Récupération et affichage des activitées du sites
        	List<Activity> activitys = ofy().load().type(Activity.class).list();
        	String listActivity = "";
        	for(Activity activity : activitys){
        		listActivity +=  activity.getSport() + " ";
        		
        	}
        	response.setContentType("text/plain");
            response.getWriter().println("Hello, " + user.getNickname() + listActivity);

	        if (user != null) {
	            
	        	try {
	        		Key<Membre> cleParent = Key.create(Membre.class, user.getNickname());
	        		Membre membre =  ofy().load().key(cleParent).now();
	        		
	        		String sport = request.getParameter( "sport" );
		            String localisation = request.getParameter( "localisation" );
		            String date = request.getParameter( "date" );
		            int places = Integer.parseInt(request.getParameter("places"));

		            if(ofy().load().type(Activity.class).filter("date",date).filter("localisation", localisation).list().isEmpty()) {
			            Activity a = new Activity(cleParent, sport, localisation, date, places );
			            ofy().save().entity(a); // enregistrement de l'activité dans le datastore
		            }    
		            String mes = sport + " " + localisation + " " + date + " " +  places + " .";
		            
		            request.setAttribute( "mes", mes );
		            
	            	this.getServletContext().getRequestDispatcher( "/member/newactivity.jsp" ).forward( request, response );
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	       	    
	        /*    
	            // envoie du mail de confirmation
	            try {
	                Properties props = new Properties();
	                Session session = Session.getDefaultInstance(props, null);
	                 
	                String message = " Vous venez d'ajoutez l'activité "+ req.getAttribute("title") +" à votre compte. A bientôt sur Nantes in Sports." ;
	                 
	                Message msg = new MimeMessage(session);
	                msg.setFrom(new InternetAddress("galliotgreg@gmail.com", "Nantes in Sports"));
	                msg.addRecipient(Message.RecipientType.TO,
	                                 new InternetAddress(user.getEmail(), user.getNickname()));
	                msg.setSubject("Ajout d'une activité sur votre compte sur Nantes in Sports !");
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
	
