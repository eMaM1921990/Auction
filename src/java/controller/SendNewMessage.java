/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.sendMessage;

/**
 *
 * @author eMaM
 */
public class SendNewMessage extends HttpServlet {

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
         request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        sendMessage sm=new sendMessage();
        HttpSession session = request.getSession();
        beans.LoginBeans login;
        login = (beans.LoginBeans) session.getAttribute("login");
        String username = login.getUserName();
        int userid = login.getUserId();
        int type = login.getUserType();
        try {
            String message="";
            if("0".equals(request.getParameter("Tos"))){
                String sendto=request.getParameter("s").substring(request.getParameter("s").lastIndexOf(","), request.getParameter("s").length());
                String[] tokens = request.getParameter("s").split(",");
                for(int i=0;i<tokens.length;i++){
                    System.out.println("Token"+tokens[i]);
                    message=sm.SendMessage(username, tokens[i], request.getParameter("Subject"),request.getParameter("CONTENT"));
                }
                
            }else{
                 message=sm.SendMessage(username, request.getParameter("Tos"), request.getParameter("Subject"),request.getParameter("CONTENT"));
            }
            /* TODO output your page here. You may use following sample code. */
          
            if(message.equals("Message Sent")){
                
             response.sendRedirect(request.getContextPath()+"/CP/collaboration/listmessage.jsp?success="+URLEncoder.encode(message, "UTF-8")+"&suc=block");
           }else {
               response.sendRedirect(request.getContextPath()+"/CP/collaboration/listmessage.jsp?error="+URLEncoder.encode(message, "UTF-8")+"&err=block");
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
