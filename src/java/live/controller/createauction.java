/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package live.controller;

import controller.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author emam
 */
public class createauction extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        DBConnection db = new DBConnection();
        db.connect();
        try {
            int auctionOpenId=0;
            String sql = "SELECT * FROM PRODUCT WHERE PRODUCTSTATUS=?";
            String sql2="SELECT count(idAUCTION) as tot FROM AUCTION WHERE STATUS=?";
            String sql3="INSERT INTO AUCTION (PRODUCT_ID,STARTTIME,MAXBID,STARTBID,NOOFBIDS,STATUS,SHIPPINGCOST) VALUES (?,?,?,?,?,?,?)";
            db.pstm = db.con.prepareStatement(sql);
            db.pstm.setString(1, "Live");
            db.rs = db.pstm.executeQuery();
            db.rs.first();
            String itemid = db.rs.getString("idPRODUCT");
            String startbid = db.rs.getString("SELLPRICE");
            String shipping_cost = db.rs.getString("SHIPPINGCOST");
            
            db.pstm=db.con.prepareStatement(sql2);
            db.pstm.setString(1, "open");
            db.rs=db.pstm.executeQuery();
            while(db.rs.next()){
                auctionOpenId=db.rs.getInt(1);
            }
            
            if(auctionOpenId==0){
                db.pstm=db.con.prepareStatement(sql3);
                db.pstm.setString(1, itemid);
                db.pstm.setString(2, "30");
                db.pstm.setString(3, startbid);
                db.pstm.setString(4, startbid);
                db.pstm.setString(5, "0");
                db.pstm.setString(6, "open");
                db.pstm.setString(7, shipping_cost);
                db.pstm.executeUpdate();
            }
            
            db.closeConnection();
            
            

            /* TODO output your page here. You may use following sample code. */
        } catch (SQLException ex) {
            Logger.getLogger(createauction.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
