/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import live.controller.winner;

/**
 *
 * @author emam
 */
public class SendMail {

    public void setMail() {
        final String authAddress = "support@livevirtualauctions.com";
        final String authPassword = "1089icanor";
        final String smtpServer = "mail.livevirtualauctions.com";
        final String smtpPort = "26";
        String siteName = "TESTING";
        // Recipient's email ID needs to be mentioned.
        String to = "eng.ahmed_2222@hotmail.com";
        String subject = "Congratulation, you are the winner";
        String message = "Congratulations. Your bid was the winner in the last auction in LiveVirtualAuctions.com. \n \n Please contact the seller as soon as possible in order to pay the item and shipping cost. The \n seller will contact you as soon as the payment is verified. \n \n We have hundreds of items available at low prices. Please go back and find your favorite  \n items. Remember, you don't have to pay anything to make bids, unless your bid is the winner.\n \n Thanks for being part of LiveVirtualAuctions.com \n \n Administration";
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", smtpServer);
            props.put("mail.smtp.port", smtpPort);
            props.put("mail.smtp.auth", "true");

            // create some properties and get the default Session
            Session sessionMail = Session.getInstance(props, new Authenticator() {

                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(authAddress, authPassword);
                }
            });

            sessionMail.setDebug(true);

            // create a message
            Message msg = new MimeMessage(sessionMail);

            // set the from and to address
            InternetAddress addressFrom = new InternetAddress(authAddress);
            msg.setFrom(addressFrom);

            InternetAddress[] addressTo = new InternetAddress[1];
            addressTo[0] = new InternetAddress(to);
            msg.setRecipients(Message.RecipientType.TO, addressTo);

            // Optional : You can also set your custom headers in the Email if you Want
            msg.addHeader("site", siteName);

            // Setting the Subject and Content Type
            msg.setSubject(subject);
            msg.setContent(message, "text/plain");
            Transport.send(msg);
        } catch (AddressException ex) {
            Logger.getLogger(winner.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(winner.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String args[]) {
        SendMail m = new SendMail();
        m.setMail();
    }
}
