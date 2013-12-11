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
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

	@SuppressWarnings("serial")
	public class EnvoiMail extends HttpServlet {
		
		  static {
		        ObjectifyService.register(Membre.class); // Fait connaître votre classe-entité à Objectify
		        ObjectifyService.register(Activity.class); // Fait connaître votre classe-entité à Objectify
		        ObjectifyService.register(Preference.class); // Fait connaître votre classe-entité à Objectify
		    }
		
		public void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws IOException {
				
			// Création de la date de la veille !!!!
				//SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
			
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
		        	//List<Activity> acts = ofy().load().type(Activity.class).list(); 
		           	List<Activity> acts = ofy().load().type(Activity.class).filter("dateCreation",dateVeille).list();           
		        	
		        	for(Activity activity : acts){     		
		        		String sport = activity.getSport();
		           		System.out.println(sport);
		        		String local = activity.getLocalisation();
		        		String date = activity.getDate();
		        		
		        		List<Membre> membres = ofy().load().type(Membre.class).list();
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
						             
						                String message = " Bonjour, une activitée : " + sport + " qui aura lieu a : " + local + "  le " + date + ", a ete creer sur Nantes In Sports ";
						               
						                Message msg = new MimeMessage(session);

						                msg.setFrom(new InternetAddress("galliotgreg@gmail.com", "Nantes in Sports"));
						               
						                System.out.println(membre.getMail());
						                System.out.println(membre.getNom());
						                msg.addRecipient(Message.RecipientType.TO,
						                                 new InternetAddress(membre.getMail(), membre.getNom()));
						                String subject = "Une proposition !!!";
						                msg.setSubject(subject);

						                msg.setText(message);
						              
						                Transport.send(msg);
						               System.out.println(message);
						            } catch (MessagingException e) {
						                e.printStackTrace();
						            }
			        		}	
			        			
			        			
			        	}//endfor
			        		
		        	}//endfor
		        	//System.out.println(dateVeille);
		        	dateVeille += " 23:59"; //sans l'ajout du champs heure la comparaison de chaîne pour la suppression ne fonctionne pas.
		        	//System.out.println(dateVeille);
		        	
		        	Iterable<Key<Activity>> clesActivity= ofy().load().type(Activity.class).filter("date <", dateVeille).keys();
        			ofy().delete().keys(clesActivity);// suppression des activitées qui on eu lieu la veille.
		        }//endif
		        
			}//endFonction   	
		        	
		}

