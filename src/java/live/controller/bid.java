/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package live.controller;

import beans.LoginBeans;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author emam
 */
public class bid extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        DBConnection db = new DBConnection();
        HttpSession session=request.getSession();
        LoginBeans login=(LoginBeans)session.getAttribute("login");
        db.connect();

        try {
            /* TODO output your page here. You may use following sample code. */
            String bid = request.getParameter("bid");
            int auction = 0;
            int bids = 0;
            String sql = "SELECT MAX(idAUCTION) AS AUCTION,NOOFBIDS FROM AUCTION";
            String sql2="UPDATE AUCTION SET STARTTIME=STARTTIME+5 WHERE  idAUCTION=?";
            String sql3="UPDATE AUCTION SET MAXBID=?,NOOFBIDS=NOOFBIDS+1,USERBID=? WHERE  idAUCTION=?";
            String sql4="INSERT INTO AUCTIONDETAILS(AUCTIONID,USER_ID,USERBID) VALUES(?,?,?)";
            db.pstm = db.con.prepareStatement(sql);
            db.rs = db.pstm.executeQuery();
            while (db.rs.next()) {
                auction = db.rs.getInt("AUCTION");
                bids = db.rs.getInt("NOOFBIDS");
            }
            if(bids==1){
                db.pstm=db.con.prepareStatement(sql2);
                db.pstm.setInt(1, auction);
                db.pstm.executeUpdate();
            }
            
            db.pstm=db.con.prepareStatement(sql3);
            db.pstm.setInt(1, Integer.parseInt(bid));
            db.pstm.setInt(2, login.getUserId());
            db.pstm.setInt(3, auction);
            db.pstm.executeUpdate();
            
            db.pstm=db.con.prepareStatement(sql4);
            db.pstm.setInt(1, auction);
            db.pstm.setInt(2,login.getUserId());
            db.pstm.setString(3, bid);
            db.pstm.executeUpdate();
            
            db.closeConnection();
            response.getWriter().write(bid); 

        } catch (SQLException ex) {
            Logger.getLogger(bid.class.getName()).log(Level.SEVERE, null, ex);
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
