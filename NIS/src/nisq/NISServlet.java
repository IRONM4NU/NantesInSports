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
	    }
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
					
		    UserService userService = UserServiceFactory.getUserService();
	        User user = userService.getCurrentUser();

	        if (user != null) {
	        	
	        	
	        	/* Récupération et affichage des membres du sites
	        	List<Membre> membres = ofy().load().type(Membre.class).list();
	        	String listMembres = "";
	        	for(Membre membre : membres){
	        		listMembres +=  membre.getNom() + " ";
	        		
	        	}
	        
	        	resp.setContentType("text/plain");
	            resp.getWriter().println("Hello, " + user.getNickname() + listMembres);*/
	            
	          if(ofy().load().type(Membre.class).filter("id",user.getUserId()).list().isEmpty()) {
	           
	           // ajout d'un nouveau membre 
	           Membre m = new Membre(user.getNickname(),user.getUserId());
	           ofy().save().entity(m); // enregistrement du membre sur le datastore
	            	
	           //req.setAttribute("membres", listMembres);	
	            	
		            try {
		                Properties props = new Properties();
		                Session session = Session.getDefaultInstance(props, null);
		                 
		                String message = "  Merci de vous êtes inscrit. Prochainement vous pourrez organiser des activitées sportives sur Nantes.";
		                 
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
	          	}
	          else {
	            	
	          		}
		            //resp.sendRedirect("./member/nis.jsp");
	          try {
				this.getServletContext().getRequestDispatcher("/member/home.jsp").forward(req, resp);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        } else {
	            resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
	        }
	        
	    }
	}
