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

import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

	@SuppressWarnings("serial")
	public class EnvoiMail extends HttpServlet {
		
		  static {
		        ObjectifyService.register(Membre.class); // Fait conna�tre votre classe-entit� � Objectify
		        ObjectifyService.register(Activity.class); // Fait conna�tre votre classe-entit� � Objectify
		        ObjectifyService.register(Preference.class); // Fait conna�tre votre classe-entit� � Objectify
		    }
		
		public void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws IOException {
				
			// Cr�ation de la date de la veille !!!!
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
		        	
		        	// R�cup�ration des activity cr�er la veille
		           	List<Activity> acts = ofy().load().type(Activity.class).filter("dateCreation",dateVeille).list();           
		        	for(Activity activity : acts){     		
		        		String sport = activity.getSport();
		        		String local = activity.getLocalisation();
		        		String date = activity.getDate();
		        		
		        		List<Membre> membres = ofy().load().type(Membre.class).list();
		        		for(Membre membre : membres){
		        			// R�cup�re la liste(� un seul �l�ment) des pr�f�rences du membre
		        			List<Preference> preferences = ofy().load().type(Preference.class).ancestor(KeyFactory.createKey("Membre", membre.getNom())).list();    		
		        			
			        		String sportM1 = preferences.get(0).getSport1();
			        		String sportM2 = preferences.get(0).getSport2();
			        		String sportM3 = preferences.get(0).getSport3();
			        		
			        		String localM1 = preferences.get(0).getLocalisation1();
			        		String localM2 = preferences.get(0).getLocalisation2();
			        		String localM3 = preferences.get(0).getLocalisation3();

			        		boolean envoiMail =false;
			        		
			        		if(sport.equals(sportM1)){
			        			if(local.equals(localM1)){
			        				envoiMail = true;
			        			}
			        		}
			        		if(sport.equals(sportM2)){
			           			if(local.equals(localM1)){
			        				envoiMail = true;
			        			}
			        		}
			        		if(sport.equals(sportM3)){
			        			if(local.equals(localM1)){
			        				envoiMail = true;
			        			}
			        		}

			        		if(envoiMail){
			        			 try {
						                Properties props = new Properties();
						               
						                Session session = Session.getDefaultInstance(props, null);
						             
						                String message = " Bonjour, une activit�e : " + sport + " qui aura lieu � : " + local + "  le " + date + ", a �t� cr�er sur Nantes In Sports ";
						               
						                Message msg = new MimeMessage(session);

						                msg.setFrom(new InternetAddress("galliotgreg@gmail.com", "Nantes in Sports"));
						               
						                System.out.println(membre.getMail());
						                System.out.println(membre.getNom());
						                msg.addRecipient(Message.RecipientType.TO,
						                                 new InternetAddress(membre.getMail(), membre.getNom()));
						                String subject = "Une nouvelle activit�e qui peut vous int�resser !!!";
						                msg.setSubject(subject);

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

