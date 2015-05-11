/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package paypal;

import controller.DBConnection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author emam
 */
public class Order {
    
    DBConnection db=new DBConnection();
    public static String PAYMENTREQUEST_0_AMT;
    public static String L_PAYMENTREQUEST_0_NAME0;
    public static String L_PAYMENTREQUEST_0_DESC0;
    public static String L_PAYMENTREQUEST_0_AMT0;
    public static String L_PAYMENTREQUEST_0_QTY0;
    public static String PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID;
    public void getOrder(String auctionId){
        try {
            
            db.connect();
            db.pstm=db.con.prepareStatement("SELECT * FROM PAYPAL WHERE idAUCTION=?");
            db.pstm.setString(1, auctionId);
            db.rs=db.pstm.executeQuery();
            while(db.rs.next()){
                PAYMENTREQUEST_0_AMT=db.rs.getString("PAYMENTREQUEST_0_AMT");
                L_PAYMENTREQUEST_0_NAME0=db.rs.getString("L_PAYMENTREQUEST_0_NAME0");
                L_PAYMENTREQUEST_0_DESC0="Code:"+auctionId+"-"+db.rs.getString("L_PAYMENTREQUEST_0_DESC0");
                L_PAYMENTREQUEST_0_AMT0=db.rs.getString("PAYMENTREQUEST_0_AMT");
                L_PAYMENTREQUEST_0_QTY0="1";
                PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID=db.rs.getString("PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Order.class.getName()).log(Level.SEVERE, null, ex);
        }
        
       db.closeConnection();
    }
}
