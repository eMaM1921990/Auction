/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package paypal;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
public class SellerInvoicePayment extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            PaypalProp p=new PaypalProp();
            p.read();
            setExpressCheckout express=new setExpressCheckout();
            express.setExpress(request.getParameter("amount"),
                    "LiveVirtualAuction Fees Payment", 
                    "Payment Fees", 
                    request.getParameter("amount"), 
                    "1", p.RECIVER, "s");
            
            if(setExpressCheckout.param.get("ACK").equals("Success")){
                    
                   response.sendRedirect(p.EXPRESS_CHECKOUT_URL+setExpressCheckout.param.get("TOKEN"));
                    
                }else{
                    response.sendRedirect(request.getContextPath()+"/FO/PaymentError.jsp?L_ERRORCODE0="+URLEncoder.encode(setExpressCheckout.param.get("L_ERRORCODE0"), "UTF-8")+"&L_SHORTMESSAGE0="+URLEncoder.encode(setExpressCheckout.param.get("L_SHORTMESSAGE0"), "UTF-8")+"&L_LONGMESSAGE0="+URLEncoder.encode(setExpressCheckout.param.get("L_LONGMESSAGE0"), "UTF-8")+"&L_SEVERITYCODE0="+URLEncoder.encode(setExpressCheckout.param.get("L_SEVERITYCODE0"),"UTF-8"));
                }
        } catch (Exception ex) {
            Logger.getLogger(SellerInvoicePayment.class.getName()).log(Level.SEVERE, null, ex);
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
