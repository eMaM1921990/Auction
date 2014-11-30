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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author eMaM
 */
public class sendMessage {
    DBConnection db=new DBConnection();
    DateFormat df=new SimpleDateFormat("dd-MM-yyyy");
    java.util.Date dta=new java.util.Date();
    public String ReplayMessage(String Froms,String tos,String subject,String details){
        String message=null;
        try {
            java.sql.Date dat=new Date(df.parse(df.format(dta)).getTime());
            int id=getReceiverId(tos);
            db.connect();
            db.pstm=db.con.prepareStatement("INSERT INTO MAILHEADER (DAYS,SUBJECT,FROMS,TOS,DETAILS) VALUES (?,?,?,?,?)");
            db.pstm.setDate(1, dat);
            db.pstm.setString(2, "RE: "+subject);
            db.pstm.setString(3, Froms);
            db.pstm.setInt(4, id);
            db.pstm.setString(5, details);
            db.pstm.executeUpdate();
            message="Message Sent";
        } catch (ParseException ex) {
            Logger.getLogger(sendMessage.class.getName()).log(Level.SEVERE, null, ex);
             message=ex.getMessage();
        } catch (SQLException ex) {
            Logger.getLogger(sendMessage.class.getName()).log(Level.SEVERE, null, ex);
             message="["+Integer.toString(ex.getErrorCode())+"] "+ex.getMessage();
        }
        return message;
    }
    
    int getReceiverId(String name){
         int id=0;
        try {
           
            db.connect();
            db.pstm=db.con.prepareStatement("SELECT idUSER FROM USER WHERE USERNAME=?");
            db.pstm.setString(1, name);
            ResultSet rs=db.pstm.executeQuery();
            while(rs.next()){
                id=rs.getInt("idUSER");
            }
            db.closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(sendMessage.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
        
    }
    
    
    
    public String SendMessage(String Froms,String tos,String subject,String details){
        String message=null;
        try {
            java.sql.Date dat=new Date(df.parse(df.format(dta)).getTime());
            int id=getReceiverId(tos);
            db.connect();
            db.pstm=db.con.prepareStatement("INSERT INTO MAILHEADER (DAYS,SUBJECT,FROMS,TOS,DETAILS) VALUES (?,?,?,?,?)");
            db.pstm.setDate(1, dat);
            db.pstm.setString(2, subject);
            db.pstm.setString(3, Froms);
            db.pstm.setInt(4, id);
            db.pstm.setString(5, details);
            db.pstm.executeUpdate();
            message="Message Sent";
        } catch (ParseException ex) {
            Logger.getLogger(sendMessage.class.getName()).log(Level.SEVERE, null, ex);
             message=ex.getMessage();
        } catch (SQLException ex) {
            Logger.getLogger(sendMessage.class.getName()).log(Level.SEVERE, null, ex);
             message="["+Integer.toString(ex.getErrorCode())+"] "+ex.getMessage();
        }
        return message;
    }
    
    
    public String deleteMessage(int id){
        String message=null;
        try {
            db.connect();
            db.pstm=db.con.prepareStatement("DELETE FROM MAILHEADER WHERE idMAILHEADER=?");
            db.pstm.setInt(1, id);
            db.pstm.executeUpdate();
            db.closeConnection();
            message="Message Deleted";
        } catch (SQLException ex) {
            Logger.getLogger(sendMessage.class.getName()).log(Level.SEVERE, null, ex);
            message="["+Integer.toString(ex.getErrorCode())+"] "+ex.getMessage();
        }
        return message;
                
    }
}
