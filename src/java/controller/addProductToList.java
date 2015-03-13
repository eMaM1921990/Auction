/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import beans.LoginBeans;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ProductList;
import model.Users;

/**
 *
 * @author emam
 */
public class addProductToList extends HttpServlet {

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
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session=request.getSession();
        LoginBeans u=(LoginBeans)session.getAttribute("login");
        ProductList p=new ProductList();
        try {
          
           String PRODUCTID=request.getParameter("idPRODUCT");
           String STARTDAY=request.getParameter("STARTDAY");
           String STARTTIM=request.getParameter("STARTTIM");
           String DESC=request.getParameter("DESC");
         
           String message=p.save(u.getUserId(), Integer.parseInt(PRODUCTID), STARTDAY, STARTTIM);
            if(message.equals("Successfully . Add Product to List")){
                response.sendRedirect(request.getContextPath()+"/CP/product/view.jsp?msg="+URLEncoder.encode(message, "UTF-8")+"&suc=block");
            }else{
                response.sendRedirect(request.getContextPath()+"/CP/product/addToList.jsp?msg="+URLEncoder.encode(message, "UTF-8")+"&err=block");
            }
        } finally {
            
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
