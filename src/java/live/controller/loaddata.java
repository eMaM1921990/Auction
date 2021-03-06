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
public class loaddata extends HttpServlet {

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
           String buffer = "<table class='table table-nohead' ><tbody> ";
           String sql="SELECT * FROM AUCTIONDETAILS,USER,AUCTION WHERE AUCTIONID=idAUCTION AND USER_ID=idUSER AND AUCTIONID=(SELECT MAX(idAUCTION) FROM AUCTION WHERE STATUS=? ) ORDER BY idAUCTIONDETAILS DESC";
           db.connect();
           db.pstm=db.con.prepareStatement(sql);
           db.pstm.setString(1, "open");
           db.rs=db.pstm.executeQuery();
           while(db.rs.next()){
               buffer = buffer + "<tr><td><span class='label label-warning'><i class='icon-usd'></i></span> <a href='#' style='color: #139ff7'>" + db.rs.getString("USERNAME") + "</a> .. has placed bid at <a style='color: #E51400'>" + db.rs.getString("USERBID") + "$</a></td></tr>";
           }
           db.closeConnection();
           buffer = buffer + "</tbody></table>";
                response.getWriter().println(buffer);
        } catch (SQLException ex) {
            Logger.getLogger(loaddata.class.getName()).log(Level.SEVERE, null, ex);
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
