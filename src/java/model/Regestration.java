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
    
    public String saveNewUser(String USERNAME,String PASSWORD,int USERTYPE,String FISRTNAME,String LASTNAME,String POSTALCODE,String ADDRESS1,String ADDRESS2,String EMAIL,String PHONE,String PAYPAL,String COUNTRY,String CITY,String STATUS){
        String message=null;
        try {
            db.connect();
            db.pstm=db.con.prepareStatement("INSERT INTO USER (USERNAME,PASSWORD,USERTYPE,FISRTNAME,LASTNAME,POSTALCODE,ADDRESS1,ADDRESS2,EMAIL,PHONE,PAYPAL,COUNTRY,CITY,STATUS) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            db.pstm.setString(1, USERNAME);
            db.pstm.setString(2, PASSWORD);
            db.pstm.setInt(3, USERTYPE);
            db.pstm.setString(4, FISRTNAME);
            db.pstm.setString(5, LASTNAME);
            db.pstm.setString(6, POSTALCODE);
            db.pstm.setString(7, ADDRESS1);
            db.pstm.setString(8, ADDRESS2);
            db.pstm.setString(9, EMAIL);
            db.pstm.setString(10, PHONE);
            db.pstm.setString(11, PAYPAL);
            db.pstm.setString(12, COUNTRY);
            db.pstm.setString(13, CITY);
            db.pstm.setString(14, STATUS);
            
            db.pstm.executeUpdate();
            db.closeConnection();
            message="Successfully Created your new account : "+USERNAME+" , Press button to able start bidding \n\n Thanks!.";
           
        } catch (SQLException ex) {
            Logger.getLogger(Regestration.class.getName()).log(Level.SEVERE, null, ex);
            message="["+Integer.toString(ex.getErrorCode())+"] \n"+ex.getMessage();
        }
        
         return message;
    }
    
    
   public void updateuser(String USERNAME,String PASSWORD,int USERTYPE,String FISRTNAME,String LASTNAME,String POSTALCODE,String ADDRESS1,String ADDRESS2,String EMAIL,String PHONE,String PAYPAL,String COUNTRY,String CITY,String STATUS,int userid){
        try {
            db.connect();
            db.pstm=db.con.prepareStatement("UPDATE USER SET USERNAME=?,PASSWORD=?,USERTYPE=?,FISRTNAME=?,LASTNAME=?,POSTALCODE=?,ADDRESS1=?,ADDRESS2=?,EMAIL=?,PHONE=?,PAYPAL=?,COUNTRY=?,CITY=?,STATUS=? WHERE idUSER=?");
            db.pstm.setString(1, USERNAME);
            db.pstm.setString(2, PASSWORD);
            db.pstm.setInt(3, USERTYPE);
            db.pstm.setString(4, FISRTNAME);
            db.pstm.setString(5, LASTNAME);
            db.pstm.setString(6, POSTALCODE);
            db.pstm.setString(7, ADDRESS1);
            db.pstm.setString(8, ADDRESS2);
            db.pstm.setString(9, EMAIL);
            db.pstm.setString(10, PHONE);
            db.pstm.setString(11, PAYPAL);
            db.pstm.setString(12, COUNTRY);
            db.pstm.setString(13, CITY);
            db.pstm.setString(14, STATUS);
            db.pstm.setInt(15, userid);
            db.pstm.executeUpdate();
            db.closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(Regestration.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
}
