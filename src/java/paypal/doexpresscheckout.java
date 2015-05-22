/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paypal;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Auction;

/**
 *
 * @author emam
 */
public class doexpresscheckout extends HttpServlet {

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
        Auction a = new Auction();
        String token = request.getParameter("token");
        String PayerID = request.getParameter("PayerID");
        String amount = request.getParameter("AMT");
        DoExpressCheckout do_express = new DoExpressCheckout();
        do_express.doexpress(token, PayerID, amount);
        
        if ("Success".equals(do_express.param.get("ACK"))) {
            if (!request.getParameter("p").equals("s")) {
                a.payforauction(Integer.valueOf(request.getParameter("p")));
            }

            response.sendRedirect(request.getContextPath() + "/FO/PaymentSuccess.jsp?ID=" + URLEncoder.encode(do_express.param.get("PAYMENTINFO_0_TRANSACTIONID"), "UTF-8"));
        } else if ("Failure".equals(do_express.param.get("ACK"))) {
            response.sendRedirect(request.getContextPath() + "/FO/PaymentError.jsp?L_ERRORCODE0=" + URLEncoder.encode(do_express.param.get("L_ERRORCODE0"), "UTF-8") + "&L_SHORTMESSAGE0=" + URLEncoder.encode(do_express.param.get("L_SHORTMESSAGE0"), "UTF-8") + "&L_LONGMESSAGE0=" + URLEncoder.encode(do_express.param.get("L_LONGMESSAGE0"), "UTF-8") + "&L_SEVERITYCODE0=" + URLEncoder.encode(do_express.param.get("L_SEVERITYCODE0"), "UTF-8"));
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
