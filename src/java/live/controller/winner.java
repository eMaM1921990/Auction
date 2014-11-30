/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package live.controller;

import controller.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Vector;
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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author emam
 */
public class winner extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
                System.out.println("INseid ");

        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        DBConnection db = new DBConnection();
        PrintWriter out = response.getWriter();
        System.out.println("INseid ");
        try {
            String result = null;
            String user = null;
            String email = null;
            final String authAddress = "support@livevirtualauctions.com";
            final String authPassword = "livevirtualauctions1089";
            final String smtpServer = "mail.livevirtualauctions.com";
            final String smtpPort = "25";
            String siteName = request.getServerName();
            int itemid = 0;
            String uservalid = null;
            double bid = 0;
            String sql = "SELECT USERBID,PRODUCT_ID,MAXBID  FROM AUCTION WHERE idAUCTION=(SELECT MAX(idAUCTION) FROM AUCTION WHERE STATUS=?)";
            db.connect();
            db.pstm = db.con.prepareStatement(sql);
            db.pstm.setString(1, "open");
            db.rs = db.pstm.executeQuery();
            while (db.rs.next()) {
                uservalid = db.rs.getString(1);
                itemid = db.rs.getInt(2);
                bid = db.rs.getInt(3);
            }
            if (uservalid != null) {
                String sql2 = "SELECT USERNAME,EMAIL FROM USER WHERE idUSER=(SELECT USERBID  FROM AUCTION where idAUCTION=(SELECT MAX(idAUCTION) FROM AUCTION WHERE STATUS=?))";
                db.pstm = db.con.prepareStatement(sql2);
                db.pstm.setString(1, "open");
                db.rs = db.pstm.executeQuery();
                while (db.rs.next()) {
                    user = db.rs.getString(1);
                    email = db.rs.getString(2);
                }

                // Recipient's email ID needs to be mentioned.
                String to = email;
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

                //////Loser mail
                String sql3 = "SELECT EMAIL From USER WHERE idUSER IN (SELECT USER_ID FROM AUCTIONDETAILS WHERE AUCTIONID=(SELECT MAX(idAUCTION) FROM AUCTION WHERE STATUS=?))";
                db.pstm = db.con.prepareStatement(sql3);
                db.pstm.setString(1, "open");
                db.rs = db.pstm.executeQuery();
                Vector<String> mailList = new Vector<String>();
                while (db.rs.next()) {
                    mailList.add(db.rs.getString(1));
                }
                mailList.remove(email);
                for (int i = 0; i < mailList.size(); i++) {

                    // Recipient's email ID needs to be mentioned.
                    String tos = mailList.get(i);
                    String subjects = "Your bid on Livevirtualauctions.com";
                    String messages = "We're sorry. \n \n Your bid was not the winner in your recent participation in  \n LiveVirtualAuctions.com. \n \n We have hundreds of items available at low prices. Please go back and find your \n favorite items. Remember, you don't have to pay anything to make bids, unless  \n your bid is the winner. \n \n Thanks for being part of LiveVirtualAuctions.com \n \n Administration";
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
                        addressTo[0] = new InternetAddress(tos);
                        msg.setRecipients(Message.RecipientType.TO, addressTo);

                        // Optional : You can also set your custom headers in the Email if you Want
                        msg.addHeader("site", siteName);

                        // Setting the Subject and Content Type
                        msg.setSubject(subjects);
                        msg.setContent(messages, "text/plain");
                        Transport.send(msg);
                    } catch (Exception e) {
                        e.printStackTrace(response.getWriter());
                    }

                }

                /////SENDING MAIL TO SELLER
                String sql4 = "SELECT EMAIL,idUSER FROM USER WHERE id=(SELECT PRODUCTCREATEDBY FROM PRODUCT WHERE idPRODUCT=?)";
                String seller_mail = null;
                String seller_id = null;
                db.pstm = db.con.prepareStatement(sql4);
                db.pstm.setInt(1, itemid);
                db.rs = db.pstm.executeQuery();
                while (db.rs.next()) {
                    seller_mail = db.rs.getString(1);
                    seller_id = db.rs.getString(2);
                }
                String toSeller = seller_mail;
                String Seller_subject = "Congratulation";
                String Seller_message = "Your item was sold. Please, contact the buyers in order to closed this sale fast and smooth. \n Go to your back office and check your Items Sold list. After that, go back and list another items.";
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
                    addressTo[0] = new InternetAddress(toSeller);
                    msg.setRecipients(Message.RecipientType.TO, addressTo);

                    // Optional : You can also set your custom headers in the Email if you Want
                    msg.addHeader("site", siteName);

                    // Setting the Subject and Content Type
                    msg.setSubject(Seller_subject);
                    msg.setContent(Seller_message, "text/plain");
                    Transport.send(msg);
                } catch (Exception e) {
                    e.printStackTrace(response.getWriter());
                }

                String sql5 = "UPDATE PRODUCT SET PRODUCTSTATUS='Not Live',QUANTITYONHAND=QUANTITYONHAND-1 WHERE idPRODUCT=?";
                db.pstm = db.con.prepareStatement(sql5);
                db.pstm.setInt(1, itemid);
                db.pstm.executeUpdate();

                String sql6 = "INSERT INTO AUCTIONWINNER (AUCTION_PRO,USER_AUCTION_W,WINNER,TOTAL) VALUES (?,?,?,?)";
                db.pstm = db.con.prepareStatement(sql6);
                db.pstm.setInt(1, itemid);
                db.pstm.setString(2, seller_id);
                db.pstm.setString(3, uservalid);
                db.pstm.setDouble(4, bid);
                db.pstm.executeUpdate();

                /* TODO output your page here. You may use following sample code. */
            } else {
                String sql7 = "SELECT * FROM PRODUCT WHERE PRODUCTSTATUS=? ";
                db.pstm = db.con.prepareStatement(sql7);
                db.pstm.setString(1, "Live");
                db.rs = db.pstm.executeQuery();
                
                        int items=0;
                 while(db.rs.next()){
                     db.rs.first();
                     items = db.rs.getInt("idPRODUCT");
                 }
                
                String sql8 = "UPDATE PRODUCT SET PRODUCTSTATUS=? WHERE idPRODUCT=?";
                db.pstm = db.con.prepareStatement(sql8);
                db.pstm.setString(1, "Not Live");
                db.pstm.setInt(2, items);
                db.pstm.executeUpdate();

            }

            String sql9 = "SELECT MAX(idAUCTION) AS AUCTION FROM AUCTION";
            int auction = 0;
            db.pstm = db.con.prepareStatement(sql9);
            db.rs = db.pstm.executeQuery();
            while (db.rs.next()) {
                auction = db.rs.getInt(1);
            }
            String sql10 = "UPDATE AUCTION SET STATUS='closed' WHERE  idAUCTION=?";
            db.pstm = db.con.prepareStatement(sql10);
            db.pstm.setInt(1, auction);
            db.pstm.executeUpdate();

            db.closeConnection();

            response.sendRedirect(request.getContextPath() + "/Live/Reload.jsp");

        } catch (SQLException ex) {
            Logger.getLogger(winner.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
