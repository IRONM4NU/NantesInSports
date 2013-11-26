package nisq;

import nisq.Membre;

import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class RechercheActiv extends HttpServlet {
	
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
	        	String sport = req.getParameter( "sport" );
	            String localisation = req.getParameter( "localisation" );
	            
	            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	            //Initialisation de la date J
				String dateJour = formatter.format(new Date());
				//ajout de l'heure
				java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("HH:mm");
				String texte_date = sdf.format(new Date());
				dateJour+= " "+texte_date;
	            
	        	  	// Récupération des activitées qui auront lieu le plus rapidement
		        	// List<Activity> acts = ofy().load().type(Activity.class).filter("sport", sport).filter("localisation", localisation).filter("date >", dateJour).order("date").limit(20).list();
				List<Activity> acts = ofy().load().type(Activity.class).filter("sport", sport).filter("localisation", localisation).order("date").limit(20).list();
				
		        	if( ! acts.isEmpty()){
		        		req.setAttribute( "acts", acts );       		
			        	  
			        	  try {
			  					this.getServletContext().getRequestDispatcher("/member/resRech.jsp").forward(req, resp);
			  				} catch (ServletException e) {
			  				
			  					e.printStackTrace();
			  				}
		        	} else {
		        		String mess = "Aucune activitée, n'hésitez pas à créer une.";
		        		req.setAttribute("mess", mess);
		        		try {
		  					this.getServletContext().getRequestDispatcher("/member/resSansRech.jsp").forward(req, resp);
		  				} catch (ServletException e) {
		  				
		  					e.printStackTrace();
		  				}
		        	}
		        	

	    }
	}
}
	
