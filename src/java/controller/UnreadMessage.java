/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Unreadmssg;
import model.sendMessage;

/**
 *
 * @author eMaM
 */
public class UnreadMessage extends HttpServlet {

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
        Unreadmssg un=new Unreadmssg();
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            /* TODO output your page here. You may use following sample code. */
         sendMessage sm=new sendMessage();
        HttpSession session = request.getSession();
        beans.LoginBeans login;
        login = (beans.LoginBeans) session.getAttribute("login");
        String username = login.getUserName();
        int userid = login.getUserId();
        
        String output="<li><a href='../CP/collaboration/listmessage.jsp' >Inbox ("+un.getUnreadMessage(userid)+")</a></li></span></a></li>"
                + " <li><a href='Auction/MyAuction.jsp'>My Auctions</a></li>"
                + "<li><a href='Shipment.jsp'>Shipment</a></li>"
                + "<li><a href='contact.jsp'>Contact</a></li>"
                + "<li><a href='../Logout'>Logout</a></li>";
           // response.getWriter().println(un.getUnreadMessage(userid));
        if(userid!=3){
            output="<li><a href='../CP/index.jsp'>Control Panel</a></li>"+output;
        }
        response.getWriter().println(output);
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
