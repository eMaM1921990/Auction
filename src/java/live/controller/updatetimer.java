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
public class updatetimer extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    DBConnection db = new DBConnection();
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            db.connect();
            String sql="SELECT MAX(idAUCTION) AS AUCTION FROM AUCTION  WHERE STATUS=?";
            int auction=0;
            db.pstm=db.con.prepareStatement(sql);
            db.pstm.setString(1, "open");
            db.rs=db.pstm.executeQuery();
            while(db.rs.next()){
                auction=db.rs.getInt(1);
            }
            
            String sql2="UPDATE AUCTION SET STARTTIME=STARTTIME-1 WHERE  idAUCTION=?";
            db.pstm=db.con.prepareStatement(sql2);
            db.pstm.setInt(1, auction);
            db.pstm.executeUpdate();
            db.closeConnection();
          
        } catch (SQLException ex) {
            Logger.getLogger(updatetimer.class.getName()).log(Level.SEVERE, null, ex);
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
