/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package FrontEndController;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Regestration;

/**
 *
 * @author emam
 */
public class Registration extends HttpServlet {

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
        model.Regestration reg=new Regestration();
        try {
           String message=reg.saveNewUser(request.getParameter("USERNAME"),request.getParameter("PASSWORD"), Integer.parseInt(request.getParameter("USERTYPE")), request.getParameter("FISRTNAME"), request.getParameter("LASTNAME"), request.getParameter("POSTALCODE"), request.getParameter("ADDRESS1"), request.getParameter("ADDRESS2"), request.getParameter("EMAIL"), request.getParameter("PHONE"), request.getParameter("PAYPAL"), request.getParameter("COUNTRY"), request.getParameter("CITY"), "active");
           if(message.equals("Successfully Created your new account : "+request.getParameter("USERNAME")+" , Press button to able start bidding \n\n Thanks!.")){
               response.sendRedirect(request.getContextPath()+"/FO/Success.jsp?msg="+URLEncoder.encode(message, "UTF-8"));
           }else {
               response.sendRedirect(request.getContextPath()+"/FO/Registration.jsp?msg="+URLEncoder.encode(message, "UTF-8"));
           }
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
