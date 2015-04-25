/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import controller.DBConnection;
import controller.mailprop;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.apache.catalina.util.MD5Encoder;

/**
 *
 * @author emam
 */
public class ResetPassword {
    DBConnection db=new DBConnection();
      private SecureRandom random = new SecureRandom();
      mailprop prop=new mailprop();

   private  String Resetpassword() {
    return new BigInteger(50, random).toString(32);
  }

  
   public String updateUserPassword(String mail){
       String message=null;
        try {
            db.connect();
            String passwords=Resetpassword();
            db.pstm=db.con.prepareStatement("UPDATE USER SET PASSWORD=? WHERE EMAIL=?");
            db.pstm.setString(1, passwords);
            db.pstm.setString(2, mail);
            db.pstm.executeUpdate();
            db.closeConnection();
            sendMailResestingPassword(mail, passwords);
            message="Password Reset";
        } catch (SQLException ex) {
            message = "[" + Integer.toString(ex.getErrorCode()) + "] " + ex.getMessage();
            Logger.getLogger(ResetPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return message;
   }
  
   
   public String userFullName(String mail){
       String name=null;
       try {
            
            db.connect();
            db.pstm=db.con.prepareStatement("SELECT FISRTNAME,LASTNAME FROM USER WHERE EMAIL=?");
            db.pstm.setString(1, mail);
            ResultSet rs=db.pstm.executeQuery();
            while (rs.next()) {
                name=rs.getString(1)+" "+rs.getString(2);
                
            }
            db.closeConnection();
            
        } catch (SQLException ex) {
            Logger.getLogger(ResetPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return name;
   }
   
   void sendMailResestingPassword(String mail,String password){
          try {
              
           final String authAddress = "support@livevirtualauctions.com";
            final String authPassword = "aBSlzwI4TSik";
            final String smtpServer = "mail.livevirtualauctions.com";
            final String smtpPort = "26";
            String to = mail;
            String sender=authAddress;
            String subject = "Live Virtual Auction|Security Department";
            String message = "Dear "+userFullName(mail)+"\n your password :"+password+"\n\n"+"System Adminstrator";
            Properties props = new Properties();
            props.put("mail.smtp.host", smtpServer);
            props.put("mail.smtp.port", smtpPort);
            props.put("mail.smtp.auth", "true");
            Session sessionMail = Session.getInstance(props, new Authenticator() {
                
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(authAddress, authPassword);
                }
            });
            
            sessionMail.setDebug(true);
            
            // create a message
            javax.mail.Message msg = new MimeMessage(sessionMail);
            
            // set the from and to address
            InternetAddress addressFrom = new InternetAddress(authAddress);
            msg.setFrom(addressFrom);
            InternetAddress[] addressTo = new InternetAddress[1];
            addressTo[0] = new InternetAddress(to);
            msg.setRecipients(javax.mail.Message.RecipientType.TO, addressTo);
            
            
           
            
            // Setting the Subject and Content Type
            msg.setSubject(subject);
            msg.setContent(message, "text/html");
            Transport.send(msg);
        } catch (AddressException ex) {
            Logger.getLogger(SendInvoicesToSeller.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(SendInvoicesToSeller.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
}
