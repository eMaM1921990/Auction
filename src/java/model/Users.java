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
public class Users {
    DBConnection db=new DBConnection();
    public String update(int idUSER,String STATUS){
        String message;
        try {
            String edit_status=null;
            if(STATUS.equals("active")){
                edit_status="Non-active";
            }else {
                edit_status="active";
            }
            db.connect();
            db.pstm=db.con.prepareStatement("UPDATE USER SET STATUS=? WHERE idUSER=?");
            db.pstm.setString(1, edit_status);
            db.pstm.setInt(2, idUSER);
            db.pstm.executeUpdate();
            db.closeConnection();
            message="Successfully Change User Status";
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            message="["+Integer.toString(ex.getErrorCode())+"] "+ex.getMessage();
        }
        return message;
    }
    
    public String deleteUser(int idUSER){
        String message=null;
        try {
            db.connect();
            db.pstm=db.con.prepareStatement("DELETE FROM USER WHERE idUSER=?");
            db.pstm.setInt(1, idUSER);
            db.pstm.executeUpdate();
            db.pstm.close();
            db.closeConnection();
            message="Successfully deleted user";
        } catch (SQLException ex) {
            db.closeConnection();
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            message="["+Integer.toString(ex.getErrorCode())+"] "+ex.getMessage();
        }
        return message;
    }
}
