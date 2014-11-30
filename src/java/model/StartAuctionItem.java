/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import controller.DBConnection;
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
public class StartAuctionItem {
    DBConnection db=new DBConnection();
    
    public int StartAuction(String datetime,String tims){
        int id=0;
        try {
            System.out.println("Date"+datetime);
            System.out.println("Time"+tims);
            DateFormat  df=new SimpleDateFormat("dd-MM-yyyy");
            java.sql.Date datesql=new java.sql.Date(df.parse(datetime).getTime());
            try {
                db.connect();
                db.pstm=db.con.prepareStatement("SELECT PRODUCTID FROM USERLISTDETAILS WHERE STARTDAY=? AND STARTTIM=?");
                db.pstm.setDate(1, datesql);
                db.pstm.setString(2, tims);
                ResultSet rs=db.pstm.executeQuery();
                while(rs.next()){
                    id=rs.getInt(1);
                    System.out.println("Product ID"+rs.getInt(1));
                    db.pstm=db.con.prepareStatement("UPDATE PRODUCT SET PRODUCTSTATUS=? WHERE idPRODUCT=?");
                    db.pstm.setString(1, "Live");
                    db.pstm.setInt(2, rs.getInt(1));
                    db.pstm.executeUpdate();
                }
                db.closeConnection();
                
            } catch (SQLException ex) {
                Logger.getLogger(StartAuctionItem.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } catch (ParseException ex) {
            Logger.getLogger(StartAuctionItem.class.getName()).log(Level.SEVERE, null, ex);
        }
         return id;
    }
    
   
}
