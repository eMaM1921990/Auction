/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import controller.DBConnection;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author emam
 */
public class Product {

    public static long log=12345698667L;
    DBConnection db=new DBConnection();
    public String save(String NAME,int PRODUCTCAT,int QUANTITYONHAND,double SELLPRICE,double SHIPPINGCOST,String TRANSPORT,String DESC,String IMAGEURL,int PRODUCTCREATEDBY,String PRODUCTCREATEDDAT){
        String message=null;
        try {
            db.connect();
            db.pstm=db.con.prepareStatement("INSERT INTO PRODUCT (NAME,QUANTITYONHAND,SELLPRICE,SHIPPINGCOST,PRODUCTCREATEDBY,PRODUCTCREATEDDAT,PRODUCTCAT,IMAGEURL,TRANSPORT,DESCS) VALUES (?,?,?,?,?,?,?,?,?,?)");
            db.pstm.setString(1, NAME);
            db.pstm.setInt(2, QUANTITYONHAND);
            db.pstm.setDouble(3, SELLPRICE);
            db.pstm.setDouble(4, SHIPPINGCOST);
            db.pstm.setInt(5, PRODUCTCREATEDBY);
            
            db.pstm.setString(6, PRODUCTCREATEDDAT);
            db.pstm.setInt(7, PRODUCTCAT);
            db.pstm.setString(8, IMAGEURL);
            db.pstm.setString(9, TRANSPORT);
            db.pstm.setString(10, DESC);
            db.pstm.executeUpdate();
            db.closeConnection();
            message="Successfully . . Add Product "+NAME+". Thanks !";
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            message="["+Integer.toString(ex.getErrorCode())+"] "+ex.getMessage();
        }
        return message;
        
    }
    
    public String edit(String NAME,int PRODUCTCAT,int QUANTITYONHAND,double SELLPRICE,double SHIPPINGCOST,String IMAGEURL,int PRODUCTCREATEDBY,String PRODUCTCREATEDDAT,int productid,String TRANSPORT,String DESC){
        String message=null;
        try {
            db.connect();
            db.pstm=db.con.prepareStatement("UPDATE PRODUCT SET NAME=?,QUANTITYONHAND=?,SELLPRICE=?,SHIPPINGCOST=?,PRODUCTCREATEDBY=?,PRODUCTCREATEDDAT=?,PRODUCTCAT=?,IMAGEURL=?,TRANSPORT=?,DESCS=? WHERE idPRODUCT=?");
            db.pstm.setString(1, NAME);
            db.pstm.setInt(2, QUANTITYONHAND);
            db.pstm.setDouble(3, SELLPRICE);
            db.pstm.setDouble(4, SHIPPINGCOST);
            db.pstm.setInt(5, PRODUCTCREATEDBY);
            
            db.pstm.setString(6,  PRODUCTCREATEDDAT);
            db.pstm.setInt(7, PRODUCTCAT);
            db.pstm.setString(8, IMAGEURL);
            db.pstm.setString(9, TRANSPORT);
            db.pstm.setString(10, DESC);
            db.pstm.setInt(11, productid);
            db.pstm.executeUpdate();
            db.closeConnection();
            message="Successfully . . Edit Product "+NAME+". Thanks !";
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            message="["+Integer.toString(ex.getErrorCode())+"] "+ex.getMessage();
        }
        return message;
    }
    
     public String editWithNoImage(String NAME,int PRODUCTCAT,int QUANTITYONHAND,double SELLPRICE,double SHIPPINGCOST,String IMAGEURL,int PRODUCTCREATEDBY,String PRODUCTCREATEDDAT,int productid,String TRANSPORT,String DESC){
        String message=null;
        try {
            db.connect();
            db.pstm=db.con.prepareStatement("UPDATE PRODUCT SET NAME=?,QUANTITYONHAND=?,SELLPRICE=?,SHIPPINGCOST=?,PRODUCTCREATEDBY=?,PRODUCTCREATEDDAT=?,PRODUCTCAT=?,TRANSPORT=?,DESCS=? WHERE idPRODUCT=?");
            db.pstm.setString(1, NAME);
            db.pstm.setInt(2, QUANTITYONHAND);
            db.pstm.setDouble(3, SELLPRICE);
            db.pstm.setDouble(4, SHIPPINGCOST);
            db.pstm.setInt(5, PRODUCTCREATEDBY);
            
            db.pstm.setString(6,  PRODUCTCREATEDDAT);
            db.pstm.setInt(7, PRODUCTCAT);
           // db.pstm.setString(8, IMAGEURL);
            db.pstm.setString(8, TRANSPORT);
            db.pstm.setString(9, DESC);
            db.pstm.setInt(10, productid);
            db.pstm.executeUpdate();
            db.closeConnection();
            message="Successfully . . Edit Product "+NAME+". Thanks !";
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            message="["+Integer.toString(ex.getErrorCode())+"] "+ex.getMessage();
        }
        return message;
    }
 
    public String Delete(int idPRODUCT,String NAME){
        String message=null;
        try {
            db.connect();
            db.pstm=db.con.prepareStatement("DELETE FROM PRODUCT WHERE idPRODUCT=?");
            db.pstm.setInt(1, idPRODUCT);
            db.pstm.executeUpdate();
            db.closeConnection();
             message="Successfully . . Delete Product "+NAME+". Thanks !";
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            message="["+Integer.toString(ex.getErrorCode())+"] "+ex.getMessage();
        }
        return message;
    }
    
    public String setActive(int product,String status){
        String message=null;
        try {
            db.connect();
            db.pstm=db.con.prepareStatement("UPDATE PRODUCT SET ISACTIVE=? WHERE idPRODUCT=?");
            db.pstm.setString(1, status);
            db.pstm.setInt(2, product);
            db.pstm.executeUpdate();
            db.closeConnection();
            message="Successfully . . Update Product status to IsActive "+status+". Thanks !";
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            message="["+Integer.toString(ex.getErrorCode())+"] "+ex.getMessage();
        }
        
        return message;
    }
}
