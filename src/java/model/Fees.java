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
 * @author eMaM
 */
public class Fees {

    DBConnection db = new DBConnection();

    public String Save(Double amount, int user) {
        String message = null;
        try {

            db.connect();
            db.pstm = db.con.prepareStatement("INSERT INTO FEES (FEES,FEES_CREATEDBY) VALUES (?,?)");
            db.pstm.setDouble(1, amount);
            db.pstm.setInt(2, user);
            db.pstm.executeUpdate();
            db.closeConnection();
            message = "Successfully . . Add Fees amount " + amount + ".Thanks !";
        } catch (SQLException ex) {
            Logger.getLogger(Fees.class.getName()).log(Level.SEVERE, null, ex);
            message = "[" + Integer.toString(ex.getErrorCode()) + "] " + ex.getMessage();
        }
        return message;
    }

    public String edit(Double amount, int user, int FeesID) {
        String message = null;
        try {

            db.connect();
            db.pstm = db.con.prepareStatement("UPDATE FEES SET FEES=?,FEES_CREATEDBY=? WHERE idFEES=?");
            db.pstm.setDouble(1, amount);
            db.pstm.setInt(2, user);
            db.pstm.setInt(3, FeesID);
            db.pstm.executeUpdate();
            db.closeConnection();
            message = "Successfully . . Edit Fees amount " + amount + ". Thanks !";
        } catch (SQLException ex) {
            Logger.getLogger(Fees.class.getName()).log(Level.SEVERE, null, ex);
            message = "[" + Integer.toString(ex.getErrorCode()) + "] " + ex.getMessage();
        }
        return message;
    }

    public String Delete(int FeesID) {
        String message = null;
        try {

            db.connect();
            db.pstm = db.con.prepareStatement("DELETE FROM FEES WHERE idFEES=?");
            db.pstm.setInt(1, FeesID);
            db.pstm.executeUpdate();
            db.closeConnection();
            message = "Successfully . . Delete Fees. Thanks !";
        } catch (SQLException ex) {
            Logger.getLogger(Fees.class.getName()).log(Level.SEVERE, null, ex);
            message = "[" + Integer.toString(ex.getErrorCode()) + "] " + ex.getMessage();
        }
        return message;
    }

}
