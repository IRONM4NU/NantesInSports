package nisq;

import nisq.Membre;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;

import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.ReadPolicy.Consistency;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

	@SuppressWarnings("serial")
	public class ActivMail extends HttpServlet {
		
		  static {
		        ObjectifyService.register(Membre.class); // Fait connaître votre classe-entité à Objectify
		        ObjectifyService.register(Activity.class); // Fait connaître votre classe-entité à Objectify
		        ObjectifyService.register(Preference.class); // Fait connaître votre classe-entité à Objectify
		    }
		
		public void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws IOException {
			System.out.println("Mail");
			String sport = (String) req.getAttribute("sport");
			String localisation = (String) req.getAttribute("localisation");
			String date = (String) req.getAttribute("date");
			
			//Récupération des membres
    		List<Membre> membres = ofy().load().type(Membre.class).list();
    		if(!membres.isEmpty()){
    			for(Membre membre : membres){
        			System.out.println(membre.getNom());
        			// Récupère la liste(à un seul élément) des préférences du membre
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
	        		}

	        		if(envoiMail){
	        			try {
				                Properties props = new Properties();
				               
				                Session session = Session.getDefaultInstance(props, null);
				             
				                String message = " Bonjour, une activité : " + sport + " qui aura lieu à : " + localisation + "  le " + date + ", a été créer sur Nantes In Sports ";
				               
				                Message msg = new MimeMessage(session);

				                msg.setFrom(new InternetAddress("galliotgreg@gmail.com", "Nantes in Sports"));
				
				                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(adressMail));
				             
				                msg.setSubject("Une proposition !!!");

				                msg.setText(message);
				              
				                Transport.send(msg);
				               
				            } catch (MessagingException e) {
				            }
	        		}
    			}	
    		}
    		try {
				this.getServletContext().getRequestDispatcher( "/member/newactivity.jsp" ).forward( req, resp );
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}//endFonction   	
		        	
		}

