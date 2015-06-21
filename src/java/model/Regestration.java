/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import controller.DBConnection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author emam
 */
public class Regestration {
    DBConnection db=new DBConnection();
    
    public String saveNewUser(String USERNAME,String PASSWORD,int USERTYPE,String FISRTNAME,String LASTNAME,String EMAIL,String PAYPAL,String STATUS){
        String message=null;
        try {
            db.connect();
            db.pstm=db.con.prepareStatement("INSERT INTO USER (USERNAME,PASSWORD,USERTYPE,FISRTNAME,LASTNAME,EMAIL,PAYPAL,STATUS) VALUES (?,?,?,?,?,?,?,?)");
            db.pstm.setString(1, USERNAME);
            db.pstm.setString(2, PASSWORD);
            db.pstm.setInt(3, USERTYPE);
            db.pstm.setString(4, FISRTNAME);
            db.pstm.setString(5, LASTNAME);
          
            db.pstm.setString(6, EMAIL);
            db.pstm.setString(7, PAYPAL);
            db.pstm.setString(8, STATUS);
            
            db.pstm.executeUpdate();
            db.closeConnection();
            message="Successfully Created your new account : "+USERNAME+" , Press button to able start bidding \n\n Thanks!.";
           
        } catch (SQLException ex) {
            Logger.getLogger(Regestration.class.getName()).log(Level.SEVERE, null, ex);
            message="["+Integer.toString(ex.getErrorCode())+"] \n"+ex.getMessage();
        }
        
         return message;
    }
    
    
   public void updateuser(String USERNAME,String PASSWORD,int USERTYPE,String FISRTNAME,String LASTNAME,String EMAIL,String PAYPAL,String STATUS,int userid){
        try {
            db.connect();
            db.pstm=db.con.prepareStatement("UPDATE USER SET USERNAME=?,PASSWORD=?,USERTYPE=?,FISRTNAME=?,LASTNAME=?,EMAIL=?,PAYPAL=?,STATUS=? WHERE idUSER=?");
            db.pstm.setString(1, USERNAME);
            db.pstm.setString(2, PASSWORD);
            db.pstm.setInt(3, USERTYPE);
            db.pstm.setString(4, FISRTNAME);
            db.pstm.setString(5, LASTNAME);
            db.pstm.setString(6, EMAIL);
            db.pstm.setString(7, PAYPAL);
            db.pstm.setString(8, STATUS);
            db.pstm.setInt(9, userid);
            db.pstm.executeUpdate();
            db.closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(Regestration.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
}
