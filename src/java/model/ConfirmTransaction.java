/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import controller.DBConnection;
import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author emam
 */
public class ConfirmTransaction {
    DBConnection db = new DBConnection();
    SendInvoicesToSeller s=new SendInvoicesToSeller();

    public String SendInvoiceToInbox(String from,  int sentto,String trans) {
         String message = null;
        try {
           
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            java.util.Date dys = new java.util.Date();
            java.sql.Date date = new Date(dys.getTime());
            String sender=s.getSenderName(Integer.valueOf(from));
            String reciver_id=Integer.toString(sentto);
            db.connect();
            db.pstm = db.con.prepareStatement("INSERT INTO MAILHEADER (DAYS,SUBJECT,FROMS,TOS,DETAILS) VALUES (?,?,?,?,?)");
            db.pstm.setDate(1, date);
            db.pstm.setString(2, "Seller Billing Invoice Confirmed");
            db.pstm.setString(3, sender);
            db.pstm.setString(4, reciver_id);
            db.pstm.setString(5, "Confirm Payment Transaction # "+trans);
            db.pstm.executeUpdate();
            
            message="Payment confirmed";
        } catch (SQLException ex) {
            Logger.getLogger(SendInvoicesToSeller.class.getName()).log(Level.SEVERE, null, ex);
            message = "[" + Integer.toString(ex.getErrorCode()) + "] " + ex.getMessage();
        }

        return message;
    }
}
