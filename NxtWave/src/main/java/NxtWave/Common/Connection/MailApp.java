package NxtWave.Common.Connection;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailApp {
    public static final String FROM_EMAIL = "ccbpians.dev@gmail.com";   // Your Gmail
    public static final String FROM_PASSWORD = "tcopkkedeipxlszt";   // App Password
    
    public static Session establishConnection() {
    	//Variable for gmail
		String host="smtp.gmail.com";
		//get the system properties
		Properties properties = System.getProperties();
		System.out.println("PROPERTIES "+properties);
        
		//setting important information to properties object		
		//host set
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");
		
		//Step 1: to get the session object..
		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {				
				return new PasswordAuthentication(FROM_EMAIL, FROM_PASSWORD);
			}
		});
		
		return session;
    }
    public static void sendHtmlEmail(String to, String subject, String htmlContent) throws AddressException {
        Session session = establishConnection();
        session.setDebug(false);
        
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(FROM_EMAIL);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject, "UTF-8");

            // HTML content
            message.setContent(htmlContent, "text/html; charset=utf-8");
            message.setSentDate(new Date());

            Transport.send(message);
            System.out.println("HTML email sent to: " + to);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static void sendActivationMail(String email) {
    	String subject = "NxtWave: Active your Account!";
		String htmlContent = "<!DOCTYPE html>"
				+ "<html lang=\"en\">"
				+ ""
				+ "<head>"
				+ "    <meta charset=\"UTF-8\">"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
				+ "    <title>Your NxtWave Account Activation</title>"
				+ "    <link href=\"https://fonts.googleapis.com/css2?family=Sofia+Sans:wght@400;600;700&display=swap\" rel=\"stylesheet\">"
				+ "    <style>"
				+ "        /* Base styles with Sofia Sans */"
				+ "        body {"
				+ "            font-family: 'Sofia Sans', Arial, sans-serif;"
				+ "            line-height: 1.6;"
				+ "            color: #333333;"
				+ "            margin: 0;"
				+ "            padding: 0;"
				+ "            background-color: #f4f4f4;"
				+ "        }"
				+ ""
				+ "        .container {"
				+ "            padding: 40px;"
				+ "            background: #ffffff;"
				+ "        }"
				+ ""
				+ "        .header {"
				+ "            text-align: center;"
				+ "            padding: 10px 0;"
				+ "            border-bottom: 1px solid #999;"
				+ "        }"
				+ ""
				+ "        .header img {"
				+ "            max-width: 150px;"
				+ "        }"
				+ ""
				+ "        .content {"
				+ "            padding: 20px;"
				+ "        }"
				+ ""
				+ "        .credentials-box {"
				+ "            display: flex;"
				+ "            flex-wrap: wrap;"
				+ "        }"
				+ ""
				+ "        .card {"
				+ "            background-color: white;"
				+ "            width: 100%;"
				+ "            max-width: 300px;"
				+ "            border-radius: 12px;"
				+ "            padding: 0px 20px;"
				+ "            margin: 8px;"
				+ "            font-size: 18px;"
				+ "            color: #334155;"
				+ "            display: flex;"
				+ "            justify-content: start;"
				+ "            border: 1px solid #e2e8f0;"
				+ "        }"
				+ ""
				+ "        .border-green {"
				+ "            border-left: 8px solid #65a30d;"
				+ "        }"
				+ ""
				+ "        .border-dark-green {"
				+ "            border-left: 8px solid #0d9488;"
				+ "        }"
				+ ""
				+ "        .border-dark-yellow {"
				+ "            border-left: 8px solid #ca8a04;"
				+ "        }"
				+ ""
				+ "        .border-orange {"
				+ "            border-left: 8px solid #ea580c;"
				+ "        }"
				+ ""
				+ "        .button {"
				+ "            display: inline-block;"
				+ "            padding: 12px 24px;"
				+ "            background-color: #0066cc;"
				+ "            color: #ffffff !important;"
				+ "            text-decoration: none;"
				+ "            border-radius: 4px;"
				+ "            text-align: center;"
				+ "            font-size: medium;"
				+ "            font-family: 'Sofia Sans', Arial, sans-serif;"
				+ "            font-style: italic;"
				+ "        }"
				+ ""
				+ "        .footer {"
				+ "            text-align: center;"
				+ "            padding: 10px;"
				+ "            font-size: 15px;"
				+ "            color: #555;"
				+ "            border-top: 1px solid #999;"
				+ "        }"
				+ ""
				+ "        @media only screen and (max-width: 600px) {"
				+ "            .container {"
				+ "                width: 100%;"
				+ "                margin: 0;"
				+ "                border-radius: 0;"
				+ "            }"
				+ "        }"
				+ "    </style>"
				+ "</head>"
				+ ""
				+ "<body>"
				+ "    <div class=\"container\">"
				+ "        <div class=\"content\">"
				+ "            <h2 style=\"font-weight: 600; color: #1b5a7a;\">Welcome to NxtWave!</h2>"
				+ "            <p>Dear <strong>John Doe</strong>,</p>"
				+ ""
				+ "            <p>We're pleased to inform you that your NxtWave account has been successfully activated. You now have full"
				+ "                access to our learning platform and resources.</p>"
				+ ""
				+ "            <h3 style=\"margin-top: 0; color: #1b5a7a; font-size: 25px;\">Your Account Credentials:</h3>"
				+ "            <div class=\"credentials-box\">"
				+ "                <div class=\"card border-green\">"
				+ "                    <p><strong>Name:</strong> John Doe</p>"
				+ "                </div>"
				+ "                <div class=\"card border-dark-green\">"
				+ "                    <p><strong>Contact:</strong> +91 98765 43210</p>"
				+ "                </div>"
				+ "                <div class=\"card border-orange\">"
				+ "                    <p><strong>Email:</strong> john.doe@example.com</p>"
				+ "                </div>"
				+ "                <div class=\"card border-dark-yellow\">"
				+ "                    <p><strong>Password:</strong> NxtWave@2024</p>"
				+ "                </div>"
				+ "            </div>"
				+ "            <p style=\"color: #d63384; font-size: 0.9em; font-weight: 600;\">⚠️ For security reasons, please change"
				+ "                this password immediately after your first login.</p>"
				+ ""
				+ "            <!-- Option 2: Form button (Less reliable in emails) -->"
				+ "            <form action=\"http://localhost:8086/NxtWave/activeAccount\" method=\"get\""
				+ "                style=\"display: inline;\">"
				+ "				   <input type=\"hidden\" name=\"UserId\" id=\"email\" value='" + email + "'>"
				+ "                <button type=\"submit\" class=\"button\""
				+ "                    style=\"border: none; cursor: pointer; font-family: Arial, sans-serif;\">"
				+ "                    Activate Now!"
				+ "                </button>"
				+ "            </form>"
				+ ""
				+ "            <!-- Fallback for clients that don't support buttons -->"
				+ "            <p style=\"font-size: 14px; color: #666666;\">"
				+ "                If the button doesn't work, copy and paste this link into your browser:<br>"
				+ "                http://localhost:8086/NxtWave/activeAccount?email=" + email
				+ "            </p>"
				+ "            <h3 style=\"color: #1b5a7a;\">Getting Started</h3>"
				+ "            <ol>"
				+ "                <li>Visit <a href=\"https://learn.nxtwave.com/login\""
				+ "                        style=\"color: #1b5a7a; text-decoration: none;\">NxtWave Learning Portal</a></li>"
				+ "                <li>Login using your email and the temporary password above</li>"
				+ "                <li>You'll be prompted to set a new secure password</li>"
				+ "                <li>Complete your profile to personalize your learning experience</li>"
				+ "            </ol>"
				+ ""
				+ "            <p style=\"background-color: #fff8e1; padding: 10px; border: solid 2px #ffeaa5; border-radius: 10px;\">"
				+ "                <strong>Need help?</strong> Our support team is available 24/7 at"
				+ "                <a href=\"mailto:support@nxtwave.com\""
				+ "                    style=\"color: #1b5a7a; text-decoration: none;\">support@nxtwave.com</a>"
				+ "                or call us at +91 40 1234 5678."
				+ "            </p>"
				+ ""
				+ "            <p>We're excited to have you onboard and look forward to supporting your learning journey!</p>"
				+ ""
				+ "            <p>Best regards,<br>"
				+ "                <strong>The NxtWave Team</strong><br>"
				+ "                <span style=\"color: #555;\">Empowering the next generation of tech professionals</span>"
				+ "            </p>"
				+ "        </div>"
				+ "        <div class=\"footer\">"
				+ "            <p>&copy; 2024 NxtWave Technologies. All rights reserved.</p>"
				+ "            <p>"
				+ "                <a href=\"https://nxtwave.com/privacy\" style=\"color: #555; text-decoration: none;\">Privacy Policy</a> |"
				+ "                <a href=\"https://nxtwave.com/terms\" style=\"color: #555; text-decoration: none;\">Terms of Service</a> |"
				+ "                <a href=\"https://nxtwave.com/contact\" style=\"color: #555; text-decoration: none;\">Contact Us</a>"
				+ "            </p>"
				+ "            <p style=\"font-size: 0.8em; color: #999;\">"
				+ "                This email was sent to john.doe@example.com because you registered for a NxtWave account.<br>"
				+ "                If you didn't create this account, please <a href=\"https://nxtwave.com/report\""
				+ "                    style=\"color: #555;\">report it immediately</a>."
				+ "            </p>"
				+ "        </div>"
				+ "    </div>"
				+ "</body>"
				+ ""
				+ "</html>";
		try {
			MailApp.sendHtmlEmail(email, subject, htmlContent);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
