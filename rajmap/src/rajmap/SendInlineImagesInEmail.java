package rajmap;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
public class SendInlineImagesInEmail 
{
   public void SendMail(String to)throws Exception 
   {
      String from = "your_email@gmail.com";
      final String username = "your_email@gmail.com";//change accordingly
      final String password = "your_password";//change accordingly

      String host = "smtp.gmail.com";
 
      // Setup mail server
  
      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", "25");

      Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
            }
         });

      try {

         // Create a default MimeMessage object.
         Message message = new MimeMessage(session);

         // Set From: header field of the header.
         message.setFrom(new InternetAddress(from,"Rajasthan Tourism"));
			
         // Set To: header field of the header.
         message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));

         // Set Subject: header field
         message.setSubject("Booking Successful");
         
         // This mail has 2 part, the BODY and the embedded image
         MimeMultipart multipart = new MimeMultipart("related");

         // first part (the html)
         BodyPart messageBodyPart = new MimeBodyPart();
         String htmlText = "<H1>Rajasthan Tourism</H1><br><br>"
                 + "<p><strong>"
                 +"Padharo Sa !<br><br>"
                 + "Thank You for using our services. Please find the QR code below. It will be scanned at the location for verification!"
                 + "</strong></p><br><br>"
                 + "<img src=\"cid:image\">";
         
         
         messageBodyPart.setContent(htmlText, "text/html");
         // add it
         multipart.addBodyPart(messageBodyPart);
         // second part (the image)
         messageBodyPart = new MimeBodyPart();
         DataSource fds = new FileDataSource("F:\\Eclipse neon\\rajmap\\WebContent\\images\\qrcode.png");

         messageBodyPart.setDataHandler(new DataHandler(fds));
         messageBodyPart.setHeader("Content-ID", "<image>");
         // add image to the multipart
         multipart.addBodyPart(messageBodyPart);

         // put everything together
         message.setContent(multipart);
         // Send message
         Transport.send(message);
         System.out.println("Sent message successfully....");
      }
      catch (MessagingException e) 
      {
         throw new RuntimeException(e);
      }
   }
}