package nisq;

import java.io.IOException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Properties;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class AjoutActivServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		  UserService userService = UserServiceFactory.getUserService();
	        User user = userService.getCurrentUser();

	        if (user != null) {
	            resp.setContentType("text/plain");
	            resp.getWriter().println("Hello, " + user.getNickname());
	            try {
	                Properties props = new Properties();
	                Session session = Session.getDefaultInstance(props, null);
	                 
	                String message = " Vous venez d'ajoutez l'activité "+ req.getAttribute("src") +" à votre compte. A bientôt sur Nantes in Sports." ;
	                 
	                Message msg = new MimeMessage(session);
	                msg.setFrom(new InternetAddress("admin@nis.com", "Administrateur"));
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
	        }
	    }
	}
