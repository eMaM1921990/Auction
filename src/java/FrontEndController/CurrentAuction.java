/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FrontEndController;

import controller.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author eMaM
 */
public class CurrentAuction extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        db.connect();
        try {
           
            String buffer ="";
                  
            db.pstm = db.con.prepareStatement("SELECT * FROM PRODUCT WHERE PRODUCTSTATUS != ?");
            db.pstm.setString(1, "Not Live");
            ResultSet rs = db.pstm.executeQuery();
            while (rs.next()) {
                String src = request.getContextPath() + rs.getString("IMAGEURL");
                String alt = rs.getString("NAME");
                String price = rs.getString("SELLPRICE");
          
                buffer=
"										<!-- Carousel Item -->\n" +
"										<div><div class=\"product\">\n" +
"											\n" +
"											<div class=\"product-image\">\n" +
"												<span class=\"product-tag\">Live</span>\n" +
"												<img src='"+src+"' alt='"+alt+"'>\n" +
"												<a href=\"#\" class=\"product-hover\">\n" +
"													<i class=\"icons icon-eye-1\"></i> Quick View\n" +
"												</a>\n" +
"											</div>\n" +
"											\n" +
"											<div class=\"product-info\">\n" +
"												<h5><a href=\"#\">"+alt+"</a></h5>\n" +
"												<span class=\"price\">"+price+"</span>\n" +
"												<div class=\"rating readonly-rating\" data-score=\"4\"></div>\n" +
"											</div>\n" +
"											\n" +
"											<div class=\"product-actions\">\n" +
"												<span class=\"add-to-cart\">\n" +
"													<span class=\"action-wrapper\">\n" +
"														<i class=\"icons icon-basket-2\"></i>\n" +
"														<span class=\"action-name\">Add to cart</span>\n" +
"													</span >\n" +
"												</span>\n" +
"												<span class=\"add-to-favorites\">\n" +
"													<span class=\"action-wrapper\">\n" +
"														<i class=\"icons icon-heart-empty\"></i>\n" +
"														<span class=\"action-name\">Add to wishlist</span>\n" +
"													</span>\n" +
"												</span>\n" +
"												<span class=\"add-to-compare\">\n" +
"													<span class=\"action-wrapper\">\n" +
"														<i class=\"icons icon-docs\"></i>\n" +
"														<span class=\"action-name\">Add to Compare</span>\n" +
"													</span>\n" +
"												</span>\n" +
"											</div>\n" +
"											\n" +
"										</div>\n" +
"										<!-- /Carousel Item -->\n" +
"									</div>";
                
            }
            //buffer=buffer;
            System.out.println(buffer);
            
            response.getWriter().println(buffer);
            db.closeConnection();
            /* TODO output your page here. You may use following sample code. */

        } catch (SQLException ex) {
            Logger.getLogger(CurrentAuction.class.getName()).log(Level.SEVERE, null, ex);
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
