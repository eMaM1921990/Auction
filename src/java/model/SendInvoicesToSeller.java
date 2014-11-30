/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


import controller.DBConnection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
/**
 *
 * @author eMaM
 */
public class SendInvoicesToSeller {

    DBConnection db = new DBConnection();

    public String SendInvoiceToInbox(String username, String amount, String dateform, String dateto, int sentfrom) {
         String message = null;
        try {
           
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            java.util.Date dys = new java.util.Date();
            java.sql.Date date = new Date(dys.getTime());
            String sender=getSenderName(sentfrom);
            int reciver_id=getRevceiverId(username);
            db.connect();
            db.pstm = db.con.prepareStatement("INSERT INTO (DAYS,SUBJECT,FROMS,TOS,DETAILS) VALUES (?,?,?,?,?)");
            db.pstm.setDate(1, date);
            db.pstm.setString(2, "Seller Billing Invoice");
            db.pstm.setString(3, sender);
            db.pstm.setInt(4, reciver_id);
            db.pstm.setString(5, "Amount :"+amount+"\n"+" From Date :"+dateform+" \n "+"To Date :"+dateto +"\n" +"Check your Mail Please"+"\n"+sender+"\n"+"System Adminstrator");
            db.pstm.executeUpdate();
            sendEmailForInvoice(username, amount, dateform, dateto, sentfrom);
            message="Invoice Sent";
        } catch (SQLException ex) {
            Logger.getLogger(SendInvoicesToSeller.class.getName()).log(Level.SEVERE, null, ex);
            message = "[" + Integer.toString(ex.getErrorCode()) + "] " + ex.getMessage();
        }

        return message;
    }

    String getSenderName(int sentfrom) {
        String name = null;
        try {
            db.connect();
            db.pstm = db.con.prepareStatement("SELECT USERNAME FROM USER WHERE idUSER=?");
            db.pstm.setInt(1, sentfrom);
            ResultSet rs = db.pstm.executeQuery();
            while (rs.next()) {
                name = rs.getString(1);
            }
            db.closeConnection();

        } catch (SQLException ex) {
            Logger.getLogger(SendInvoicesToSeller.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }
    
    int getRevceiverId(String name){
         int Id = 0;
        try {
            db.connect();
            db.pstm = db.con.prepareStatement("SELECT idUSER FROM USER WHERE USERNAME=?");
            db.pstm.setString(1, name);
            ResultSet rs = db.pstm.executeQuery();
            while (rs.next()) {
                Id = rs.getInt(1);
            }
            db.closeConnection();

        } catch (SQLException ex) {
            Logger.getLogger(SendInvoicesToSeller.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Id;
    }

    String getRecieverFullName(String username) {
        String name = null;
        try {

            db.connect();
            db.pstm = db.con.prepareStatement("SELECT FISRTNAME,LASTNAME FROM USER WHERE USERNAME=?");
            db.pstm.setString(1, username);
            ResultSet rs = db.pstm.executeQuery();
            while (rs.next()) {
                name = rs.getString(1).concat(" " + rs.getString(2));
            }
            db.closeConnection();

        } catch (SQLException ex) {
            Logger.getLogger(SendInvoicesToSeller.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }

    String getReciverAddress(String username) {
        String address = null;
        try {

            db.connect();
            db.pstm = db.con.prepareStatement("SELECT ADDRESS1 FROM USER WHERE USERNAME=?");
            db.pstm.setString(1, username);
            ResultSet rs = db.pstm.executeQuery();
            while (rs.next()) {
                address = rs.getString(1);
            }
            db.closeConnection();

        } catch (SQLException ex) {
            Logger.getLogger(SendInvoicesToSeller.class.getName()).log(Level.SEVERE, null, ex);
        }
        return address;
    }

    String getRecievrZIP(String username) {
        String Zip = null;
        try {

            db.connect();
            db.pstm = db.con.prepareStatement("SELECT POSTALCODE FROM USER WHERE USERNAME=?");
            db.pstm.setString(1, username);
            ResultSet rs = db.pstm.executeQuery();
            while (rs.next()) {
                Zip = rs.getString(1);
            }
            db.closeConnection();

        } catch (SQLException ex) {
            Logger.getLogger(SendInvoicesToSeller.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Zip;
    }

    String getReciverPhone(String username) {
        String Phone = null;
        try {

            db.connect();
            db.pstm = db.con.prepareStatement("SELECT PHONE FROM USER WHERE USERNAME=?");
            db.pstm.setString(1, username);
            ResultSet rs = db.pstm.executeQuery();
            while (rs.next()) {
                Phone = rs.getString(1);
            }
            db.closeConnection();

        } catch (SQLException ex) {
            Logger.getLogger(SendInvoicesToSeller.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Phone;
    }

    String RecieverMail(String username) {
        String email = null;
        try {

            db.connect();
            db.pstm = db.con.prepareStatement("SELECT EMAIL FROM USER WHERE USERNAME=?");
            db.pstm.setString(1, username);
            ResultSet rs = db.pstm.executeQuery();
            while (rs.next()) {
                email = rs.getString(1);
            }
            db.closeConnection();

        } catch (SQLException ex) {
            Logger.getLogger(SendInvoicesToSeller.class.getName()).log(Level.SEVERE, null, ex);
        }
        return email;
    }
    
    void sendEmailForInvoice(String username, String amount, String dateform, String dateto, int sentfrom){
        try {
            final String authAddress = "support@livevirtualauctions.com";
            final String authPassword = "1089icanor";
            final String smtpServer = "mail.livevirtualauctions.com";
            final String smtpPort = "25";            
            String to = RecieverMail(username);
            String sender=getSenderName(sentfrom);
            String subject = "Live Virtual Auction|Billing Invoice";
            String message = "Dear "+username+"\n Amount :"+amount+"\n"+" From Date :"+dateform+" \n "+"To Date :"+dateto +"\n" +"Check your Mail Please"+"\n"+sender+"\n"+"System Adminstrator";
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
            Message msg = new MimeMessage(sessionMail);
            
            // set the from and to address
            InternetAddress addressFrom = new InternetAddress(authAddress);
            msg.setFrom(addressFrom);
            InternetAddress[] addressTo = new InternetAddress[1];
            addressTo[0] = new InternetAddress(to);
            msg.setRecipients(Message.RecipientType.TO, addressTo);
            
            
           
            
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
    
    
    public String SendConfirmationForPayment(String username, String amount, String dateform, String dateto, int sentfrom){
          String message = null;
        try {
           
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            java.util.Date dys = new java.util.Date();
            java.sql.Date date = new Date(dys.getTime());
            String sender=getSenderName(sentfrom);
            int reciver_id=getRevceiverId(username);
            db.connect();
            db.pstm = db.con.prepareStatement("INSERT INTO (DAYS,SUBJECT,FROMS,TOS,DETAILS) VALUES (?,?,?,?,?)");
            db.pstm.setDate(1, date);
            db.pstm.setString(2, "Confirmation Seller Billing Invoice");
            db.pstm.setString(3, sender);
            db.pstm.setInt(4, reciver_id);
            db.pstm.setString(5, "Amount :"+amount+"\n"+" From Date :"+dateform+" \n "+"To Date :"+dateto +"\n" +"Check your Mail Please"+"\n"+sender+"\n"+"System Adminstrator");
            db.pstm.executeUpdate();
            sendConfirmmail(username, amount, dateform, dateto, sentfrom);
            message="Payment Confirmation Sent";
        } catch (SQLException ex) {
            Logger.getLogger(SendInvoicesToSeller.class.getName()).log(Level.SEVERE, null, ex);
            message = "[" + Integer.toString(ex.getErrorCode()) + "] " + ex.getMessage();
        }

        return message;
    }
    
    void sendConfirmmail(String username, String amount, String dateform, String dateto, int sentfrom){
          try {
            final String authAddress = "support@livevirtualauctions.com";
            final String authPassword = "1089icanor";
            final String smtpServer = "mail.livevirtualauctions.com";
            final String smtpPort = "25";            
            String to = RecieverMail(username);
            String sender=getSenderName(sentfrom);
            String subject = "Live Virtual Auction|Billing Invoice";
            String message = "Dear "+username+"\n Amount :"+amount+"\n"+" From Date :"+dateform+" \n "+"To Date :"+dateto +"\n" +"Check your Mail Please"+"\n"+sender+"\n"+"System Adminstrator";
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
            Message msg = new MimeMessage(sessionMail);
            
            // set the from and to address
            InternetAddress addressFrom = new InternetAddress(authAddress);
            msg.setFrom(addressFrom);
            InternetAddress[] addressTo = new InternetAddress[1];
            addressTo[0] = new InternetAddress(to);
            msg.setRecipients(Message.RecipientType.TO, addressTo);
            
            
           
            
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
