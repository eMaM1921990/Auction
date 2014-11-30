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
public class Message {
    DBConnection db=new DBConnection();
    
    public String save(String content,String type){
        String message=null;
        try {
            
            db.connect();
            db.pstm=db.con.prepareStatement("INSERT INTO GLOBALMESSAGE (CONTENT,TYPE) VALUES (?,?)");
            db.pstm.setString(1, content);
            db.pstm.setString(2, type);
            db.pstm.executeUpdate();
            db.closeConnection();
            message="Successfully . save your message";
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
            message = "[" + Integer.toString(ex.getErrorCode()) + "] " + ex.getMessage();
        }
        return message;
    }
    
    public String Edit(String content,String type,int idGLOBALMESSAGE){
        String message=null;
        try {
            
            db.connect();
            db.pstm=db.con.prepareStatement("UPDATE GLOBALMESSAGE SET CONTENT=?,TYPE=? WHERE idGLOBALMESSAGE=?");
            db.pstm.setString(1, content);
            db.pstm.setString(2, type);
            db.pstm.setInt(3, idGLOBALMESSAGE);
            db.pstm.executeUpdate();
            db.closeConnection();
            message="Successfully .Update your message";
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
             message = "[" + Integer.toString(ex.getErrorCode()) + "] " + ex.getMessage();
        }
        return message;
        
        
    }
    
    public String Delete(int idGLOBALMESSAGE){
        String message=null;
        try {
            
            db.connect();
            db.pstm=db.con.prepareStatement("DELETE FROM GLOBALMESSAGE WHERE idGLOBALMESSAGE=?");
            db.pstm.setInt(1, idGLOBALMESSAGE);
            db.pstm.executeUpdate();
            db.closeConnection();
            message="Successfully .Delete your message";
        } catch (SQLException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
            message = "[" + Integer.toString(ex.getErrorCode()) + "] " + ex.getMessage();
        }
        return message;
    }
}
