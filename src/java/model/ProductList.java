/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import controller.DBConnection;
import java.sql.SQLException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author emam
 */
public class ProductList {

    DBConnection db = new DBConnection();

    public String save(int USERLISTID, int PRODUCTID, String STARTDAY, String STARTTIM) {
        String message = "";
        try {
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat displayFormat = new SimpleDateFormat("HH:mm:ss");
            SimpleDateFormat parseFormat = new SimpleDateFormat("hh:mm a");
            Date timdate = parseFormat.parse(STARTTIM);
            Date datetim = (Date) parseFormat.parse(STARTTIM);

            Date date = df.parse(STARTDAY);
            //  Date dat=new Date(STARTDAY);
            java.sql.Date dateauction = new java.sql.Date(date.getTime());
           // java.sql.Date timeauction = new java.sql.Date(datetim.getTime());

            db.connect();
            db.pstm = db.con.prepareStatement("INSERT INTO USERLISTDETAILS (USERLISTID,PRODUCTID,STARTDAY,STARTTIM) VALUES (?,?,?,?)");
            db.pstm.setInt(1, USERLISTID);
            db.pstm.setInt(2, PRODUCTID);
            db.pstm.setDate(3, dateauction);
            db.pstm.setString(4, parseFormat.format(datetim));
            db.pstm.executeUpdate();
            String eventname = "event" + PRODUCTID + date.getMinutes();
            System.out.println("CREATE EVENT event" + PRODUCTID + " ON schedule AT ('" + dateauction + " " + parseFormat.format(datetim) + "'+ INTERVAL 1 DAY) ON COMPLETION PRESERVE ENABLE DO update PRODUCT SET PRODUCTSTATUS='Live' WHERE idPRODUCT=" + PRODUCTID + ";");
            //  db.pstm.executeUpdate("CREATE EVENT "+eventname+" ON schedule AT ('"+dateauction+" "+formatter.format(datetim)+"'+ INTERVAL 0 DAY) ON COMPLETION PRESERVE ENABLE DO update PRODUCT SET PRODUCTSTATUS='Live' WHERE idPRODUCT="+PRODUCTID+";");
            db.pstm.executeUpdate("CREATE EVENT `" + eventname + "` ON SCHEDULE AT '" + dateauction + " " + displayFormat.format(timdate) + "' ON COMPLETION PRESERVE ENABLE DO update PRODUCT SET PRODUCTSTATUS='Live' WHERE idPRODUCT=" + PRODUCTID + " ");
            System.out.println("CREATE EVENT `" + eventname + "` ON SCHEDULE AT '" + dateauction + " " + displayFormat.format(timdate) + "' ON COMPLETION PRESERVE ENABLE DO update PRODUCT SET PRODUCTSTATUS='Live' WHERE idPRODUCT=" + PRODUCTID + " ");
            db.closeConnection();
            message = "Successfully . Add Product to List";
        } catch (SQLException ex) {
            Logger.getLogger(ProductList.class.getName()).log(Level.SEVERE, null, ex);
            message = "[" + Integer.toString(ex.getErrorCode()) + "] " + ex.getMessage();
        } catch (ParseException ex) {
            Logger.getLogger(ProductList.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }
}
