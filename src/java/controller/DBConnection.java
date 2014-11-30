package controller;

/*
 * DBConnection.java
 *
 * Created on 22 ������, 2003, 01:22 �
 */
/**
 *
 * @author  Ehab Emara
 */

import java.sql.*;

import java.util.*;

public class DBConnection {

    public Connection con;
    public Statement stmt;
    public ResultSet rs;
    public String driverName = "com.mysql.jdbc.Driver";
   
    public String url ="jdbc:mysql://localhost:3306/icanor_autcion";
 
    public String user ="root";//"icanor";
    public String password ="0122308791";//"livevirtualauctions1089";
    public PreparedStatement pstm;
    int colcount;

    /** Creates a new instance of DBConnection
     *driver sun.jdbc.odbc.JdbcOdbcDriver
     *url jdbc:odbc:student
     */
       public void connect() {

        try {
            Class.forName(driverName).newInstance();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
        } catch (InstantiationException ex) {
            ex.printStackTrace();
        }

        try {
            con = DriverManager.getConnection(url,user,password);
        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }

        try {

            stmt = con.createStatement();

        } catch (Exception sqlex) {
            sqlex.printStackTrace();
        }


    }
    
    

    public void excuteUpdate(String sqlStmt) {
        try {

            stmt.executeUpdate(sqlStmt);
        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }
    }

    public ResultSet excuteQuery(String selectStmt) {

        try {
            rs = stmt.executeQuery(selectStmt);
           
        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }
        return rs;
        
    }
    /* returns data as a vector of vector to be displayed in a JTable
     **/

    public Vector getData() {

        Vector display = new Vector();
        try {
            colcount = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                Vector row = new Vector();
                for (int i = 1; i <= colcount; i++) {
                    row.addElement(rs.getString(i));
                }
                display.addElement(row);
            }
        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }

        return display;
    }

    public void closeConnection() {
        try {
            con.close();
            stmt.close();
        
        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }
    }
    
    public void closeResult(){
        try {
           
          
            rs.close();
        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }
    }
    
    public void CloseStatment(){
        try {
           
            stmt.close();
            
        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }
    }
    
}
