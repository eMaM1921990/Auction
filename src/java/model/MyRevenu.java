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
public class MyRevenu {
    
    DBConnection db=new DBConnection();
    String Revenu(String datone,String dattwo){
        StringBuilder data=new StringBuilder();
        try {
            db.connect();
            DateFormat df=new SimpleDateFormat();
            java.sql.Date sqldatefrom=new java.sql.Date(df.parse(datone).getTime());
            java.sql.Date sqldateto=new java.sql.Date(df.parse(dattwo).getTime());
            db.pstm=db.con.prepareStatement("SELECT DATEAUCTION,FEES FROM AUCTIONWINNER,AUCTION WHERE DATEAUCTION BETWEEN ? AND ?");
            db.pstm.setDate(1, sqldatefrom);
            db.pstm.setDate(2, sqldateto);
            ResultSet rs=db.pstm.executeQuery();
            while(rs.next()){
                data.append("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td></tr>");
            }
            db.closeConnection();
        } catch (ParseException ex) {
            Logger.getLogger(MyRevenu.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MyRevenu.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return data.toString();
    }
}
