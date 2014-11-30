/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import controller.DBConnection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author emam
 */
public class List {
    DBConnection db=new DBConnection();
    Date date=new Date();
    DateFormat df=new SimpleDateFormat("dd-MM-yyyy");
    public String save(int USERLIST,String LISTNAME){
        String message="";
        try {
            
            db.connect();
            db.pstm=db.con.prepareStatement("INSERT INTO USERLIST(USERLIST,LISTNAME,CREATEDDATE) VALUES (?,?,?)");
            db.pstm.setInt(1, USERLIST);
            db.pstm.setString(2, LISTNAME);
            db.pstm.setString(3, df.format(date));
            db.pstm.executeUpdate();
            db.closeConnection();
            message="Successfully Save New List "+LISTNAME+" Thanks!.";
        } catch (SQLException ex) {
            Logger.getLogger(List.class.getName()).log(Level.SEVERE, null, ex);
            message="["+Integer.toString(ex.getErrorCode())+"] \n"+ex.getMessage();
        }
        return message;
    }
    
    public String edit(String LISTNAME,int idLIST){
        String message="";
        try {
            
            db.connect();
            db.pstm=db.con.prepareStatement("UPDATE USERLIST SET LISTNAME=? WHERE idUSERLIST=?");
            
            db.pstm.setString(1, LISTNAME);
            db.pstm.setInt(2, idLIST);
            db.pstm.executeUpdate();
            db.closeConnection();
            message="Successfully . . Edit List "+LISTNAME+". Thanks !";
        } catch (SQLException ex) {
            Logger.getLogger(List.class.getName()).log(Level.SEVERE, null, ex);
             message="["+Integer.toString(ex.getErrorCode())+"] \n"+ex.getMessage();
        }
        return message;
    }
    
   public String Delete(String LISTNAME,int idLIST){
         String message="";
        try {
           
            db.connect();
            db.pstm=db.con.prepareStatement("DELETE FROM USERLIST WHERE idUSERLIST=?");
            db.pstm.setInt(1, idLIST);
            db.pstm.executeUpdate();
            db.closeConnection();
            message="Successfully . . Delete List "+LISTNAME+". Thanks !";
        } catch (SQLException ex) {
            Logger.getLogger(List.class.getName()).log(Level.SEVERE, null, ex);
            message="["+Integer.toString(ex.getErrorCode())+"]\n"+ex.getMessage();
        }
         return message;
    }
}
