/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import controller.DBConnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author eMaM
 */
public class Unreadmssg {
    DBConnection db=new DBConnection();
    
    public int getUnreadMessage(int user){
        int count=0;
        try {
            
            db.connect();
            db.pstm=db.con.prepareStatement("SELECT COUNT(idMAILHEADER) AS TOTAL FROM MAILHEADER WHERE SEEN=? AND TOS=?");
            db.pstm.setString(1, "N");
            db.pstm.setInt(2, user);
            ResultSet rs=db.pstm.executeQuery();
            while(rs.next()){
                count=rs.getInt("TOTAL");
            }
            db.closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(Unreadmssg.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
