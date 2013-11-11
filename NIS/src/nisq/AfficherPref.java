package nisq;

import nisq.Membre;
import nisq.Preference;

import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.lang.String;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;

import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class AfficherPref extends HttpServlet {

	
	static {
        ObjectifyService.register(Membre.class); // Fait connaître votre classe-entité à Objectify
        ObjectifyService.register(Activity.class);
        ObjectifyService.register(Preference.class);
    }
    
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws IOException {
					
		    UserService userService = UserServiceFactory.getUserService();
	        User user = userService.getCurrentUser();
	        Membre membre = ofy().load().type(Membre.class).id(userService.getCurrentUser().getUserId()).now();

	        if (user != null) {
	        		        	
	        	/* Récupération et affichage des prefernces du membres connecté*/
	        	List<Preference> preferences = ofy().load().type(Preference.class).ancestor(KeyFactory.createKey("Membre", user.getNickname())).list();
	        	String sport1 = preferences.get(0).getSport1();
	        	String localisation1 = preferences.get(0).getLocalisation1();
	        	String sport2 = preferences.get(0).getSport2();
	        	String localisation2 = preferences.get(0).getLocalisation2();
	        	String sport3 = preferences.get(0).getSport3();
	        	String localisation3 = preferences.get(0).getLocalisation3();
	        	
	        	req.setAttribute( "sport1", sport1 );
	        	req.setAttribute( "localisation1", localisation1 );
	        	req.setAttribute( "sport2", sport2 );
	        	req.setAttribute( "localisation2", localisation2 );
	        	req.setAttribute( "sport3", sport3 );
	        	req.setAttribute( "localisation3", localisation3 );
	        	       	
            	try {
					this.getServletContext().getRequestDispatcher( "/member/pref.jsp" ).forward( req, resp );
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        } 
	    }
	}
