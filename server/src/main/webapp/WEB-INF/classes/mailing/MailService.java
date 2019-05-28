package mailing;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class MailService {
	final String username;
	final String password;
	Properties props;
	
	public static final String AIR_ AsmusS_EMAIL = "er Asmusprojectathens@gmail.com";
	
	
	public MailService() {
		username = "er Asmusathensproject@gmail.com";
		password = "Er AsmusAthens";
		props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
	}
	
	public void sendTo(String email, String subject, String messageInHTML) {
		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(AIR_ AsmusS_EMAIL));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(email));
			message.setSubject(subject);
			message.setContent(messageInHTML, "text/html");

			Transport.send(message);
			
			System.out.println("mail sent to "+ email );

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		
	}

	public static void main(String[] args) {
		
		MailService send = new MailService();
		send.sendTo("antoine.onquiert@gmail.com", "Testing object SendMail", "Dear Mail Crawler,"
				+ "\n\n this is a test!");

	}
}