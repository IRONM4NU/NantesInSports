package nisq;

import nisq.Membre;

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

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

	@SuppressWarnings("serial")
	public class EnvoiMail extends HttpServlet {
		
		  static {
		        ObjectifyService.register(Membre.class); // Fait connaître votre classe-entité à Objectify
		    }
		
		public void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws IOException {
				
			// Création de la date de la veille !!!!
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				//Initialisation de la date J
				String dateJour = formatter.format(new Date());
				//Initialisation du Calendar
				Calendar cal = Calendar.getInstance();
				//Recuperation de la date J-1
				cal.add(Calendar.DAY_OF_MONTH, -1);
				//Formattage de la date J-1
				String dateVeille = formatter.format(cal.getTime());
			
			    UserService userService = UserServiceFactory.getUserService();
		        User user = userService.getCurrentUser();

		        if (user != null) {
		        	// Récupération des activity créer la veille
		        	List<Activity> acts = ofy().load().type(Activity.class).filter("dateCreation =",dateVeille).list();
		        	for(Activity activity : acts){     		
		        		String sport = activity.getSport();
		        		String local = activity.getLocalisation();
		        		String date = activity.getDate();
		        	
		        		//Récupération des membres
		        		List<Membre> membres = ofy().load().type(Membre.class).list();
		        		for(Membre membre : membres){
			        		
			        		String sportM1 = membre.getPreference().getSport1();
			        		String sportM2 = membre.getPreference().getSport2();
			        		String sportM3 = membre.getPreference().getSport3();
			        		
			        		String localM1 = membre.getPreference().getLocalisation1();
			        		String localM2 = membre.getPreference().getLocalisation2();
			        		String localM3 = membre.getPreference().getLocalisation3();
			        		
			        		boolean envoiMail = false;
			        		
			        		if(sport == sportM1){
			        			if(local == localM1){
			        				envoiMail = true;
			        			}
			        		}
			        		if(sport == sportM2){
			        			if(local == localM2){
			        				envoiMail = true;
			        			}
			        		}
			        		if(sport == sportM3){
			        			if(local == localM3){
			        				envoiMail = true;
			        			}
			        		}
			        		if(envoiMail){
			        			 try {
						                Properties props = new Properties();
						                Session session = Session.getDefaultInstance(props, null);
						                 
						                String message = " Bonjour, une activitée : " + sport + " qui aura lieu à : " + local + "  le " + date + ", a été créer sur Nantes In Sports ";
						                 
						                Message msg = new MimeMessage(session);
						                msg.setFrom(new InternetAddress("galliotgreg@gmail.com", "Nantes in Sports"));
						                msg.addRecipient(Message.RecipientType.TO,
						                                 new InternetAddress(user.getEmail(), user.getNickname()));
						                msg.setSubject("Une nouvelle activitée qui peut vous intéresser !!!");
						                msg.setText(message);
						                Transport.send(msg);
						            } catch (MessagingException e) {
						                e.printStackTrace();
						            }
			        		}	
			        			
			        			
			        	}//endfor
			        		
		        	}//endfor
		        }//endif
			}//endFonction   	
		        	
		}

