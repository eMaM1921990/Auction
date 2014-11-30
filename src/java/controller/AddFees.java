/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Fees;
import org.eclipse.jdt.internal.compiler.lookup.TypeIds;

/**
 *
 * @author eMaM
 */
public class AddFees extends HttpServlet {

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
        Fees f = new Fees();
        HttpSession session = request.getSession();
        beans.LoginBeans login;
        login = (beans.LoginBeans) session.getAttribute("login");
        String username = login.getUserName();
        int userid = login.getUserId();
        int type = login.getUserType();
        try {
            String message = f.Save(Double.parseDouble(request.getParameter("FEES")), userid);
            String amount=request.getParameter("FEES");
            if (message.contains("Successfully")) {
                response.sendRedirect(request.getContextPath()+"/CP/Finance/viewFees.jsp?msg=" + URLEncoder.encode(message, "UTF-8")+"&suc=block");
            } else {
                response.sendRedirect(request.getContextPath()+"/CP/Finance/viewFees.jsp?msg=" + URLEncoder.encode(message, "UTF-8")+"&err=block");
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
