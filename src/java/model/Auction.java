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
public class Auction {
    DBConnection db=new DBConnection();
    
    public String payforauction(int id){
                String message = null;

                System.out.println("Updated Id"+id);
        try {
            db.connect();
            db.pstm=db.con.prepareStatement("UPDATE AUCTIONWINNER SET BUYPAID=? WHERE AUCTION_ID_W=? ");
            db.pstm.setString(1, "Y");
            db.pstm.setInt(2, id);
            db.pstm.executeUpdate();
            db.closeConnection();
            message = "Successfully . . your payment in confirmed.Thanks !";
        } catch (SQLException ex) {
            Logger.getLogger(Auction.class.getName()).log(Level.SEVERE, null, ex);
            message = "[" + Integer.toString(ex.getErrorCode()) + "] " + ex.getMessage();
        }
        
        return message;
    }
}
