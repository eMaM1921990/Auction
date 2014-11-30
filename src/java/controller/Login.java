/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import beans.LoginBeans;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author eMaM
 */
public class Login extends HttpServlet {

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
            DBConnection db=new DBConnection();
        try {
        
            String name=request.getParameter("user");
            String password=request.getParameter("pass");
            db.connect();
            db.pstm=db.con.prepareStatement("SELECT COUNT(idUSER) AS TOTAL,idUSER,USERNAME,USERTYPE FROM USER WHERE USERNAME=? AND PASSWORD=?");
            db.pstm.setString(1, name);
            db.pstm.setString(2, password);
            ResultSet rs=db.pstm.executeQuery();
            int userid=0;
            String username=null;
            int type=0;
            int count=0;
            while(rs.next()){
                count=rs.getInt(1);
                userid=rs.getInt(2);
                username=rs.getString(3);
                type=rs.getInt(4);
            }
           
            db.closeConnection();
            if(count==0){
                response.sendRedirect(request.getContextPath()+"/FO/Portal.jsp?message=valid");
            }else {
                HttpSession session=request.getSession();
                LoginBeans login=new LoginBeans();
                login.setUserId(userid);
                login.setUserName(username);
                login.setUserType(type);
                session.setAttribute("login", login);
                db.connect();
                db.pstm=db.con.prepareStatement("UPDATE USER SET LASTLOGIN=? WHERE idUSER=?");
                db.pstm.setString(1, new Date().toString());
                db.pstm.setInt(2, userid);
                db.pstm.executeUpdate();
                db.closeConnection();
                response.sendRedirect(request.getContextPath()+"/FO/Portal.jsp");
            }
           
          
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
