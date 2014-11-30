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
public class lastbidd extends HttpServlet {

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
            String sql = "SELECT MAX(idAUCTION) AS FIR FROM AUCTION WHERE STATUS=?";
            String sql2 = "SELECT * FROM AUCTION WHERE idAUCTION=?";
            int liveauction = 0;
            String itemid = "0.0";
            String startbid = "0.0";
            double shipping_cost = 0;
            double shipping_cost_additional = 0;
            db.pstm = db.con.prepareStatement(sql);
            db.pstm.setString(1, "open");
            db.rs = db.pstm.executeQuery();
            while (db.rs.next()) {
                liveauction = db.rs.getInt(1);
            }

            db.pstm = db.con.prepareStatement(sql2);
            db.pstm.setInt(1, liveauction);
            db.rs = db.pstm.executeQuery();
            while (db.rs.next()) {
                itemid = db.rs.getString("MAXBID");
                startbid = db.rs.getString("STARTBID");
                shipping_cost = db.rs.getDouble("SHIPPINGCOST");
            }
            db.closeConnection();
            double shipping = shipping_cost_additional + shipping_cost;
            String buffer = "<ul class='stats'>"
                    + " <li class='blue'><i class='icon-money'></i> <div class='details'><span >" + itemid + "$</span><span>Last Bid</span></div></li>"
                    + "<li class='green'><i class='icon-truck'></i><div class='details'><span>" + shipping + "$</span><span>Shipping Cost</span></div></li>"
                    + "<li class='orange'><i class='icon-money'></i><div class='details'><span>" + startbid + "$</span><span>Start Bid</span></div></li>"
                    + " </ul>";
            response.getWriter().println(buffer);

            /* TODO output your page here. You may use following sample code. */
        } catch (SQLException ex) {
            Logger.getLogger(lastbidd.class.getName()).log(Level.SEVERE, null, ex);
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
