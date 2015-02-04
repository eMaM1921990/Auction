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
public class loadauctionitem extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        DBConnection db = new DBConnection();
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<style>\n"
                    + "    .center\n"
                    + "    {\n"
                    + "        margin-left:auto;\n"
                    + "        margin-right:auto;\n"
                    + "        width:70%;\n"
                    + "\n"
                    + "    }\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "    div.img\n"
                    + "    {\n"
                    + "        margin:5px;\n"
                    + "        padding: 5px;\n"
                    + "        border:1px solid #ffffff;\n"
                    + "        height:auto;\n"
                    + "        width:auto;\n"
                    + "        float:start;\n"
                    + "        text-align:center;\n"
                    + "        max-height:130px;\n"
                    + "        max-width: 230px;\n"
                    + "    }\n"
                    + "    div.img img\n"
                    + "    {\n"
                    + "        display:inline;\n"
                    + "        margin:5px;\n"
                    + "        border:1px solid #ffffff;\n"
                    + "    }\n"
                    + "    div.img a:hover img\n"
                    + "    {\n"
                    + "        border:1px solid #ffffff;\n"
                    + "    }\n"
                    + "    div.desc\n"
                    + "    {\n"
                    + "        text-align:center;\n"
                    + "        font-weight:normal;\n"
                    + "        width:auto;\n"
                    + "        margin:5px;\n"
                    + "    }\n"
                    + "\n"
                    + "</style>");
            db.connect();
            String buffer = null;
            String sql="SELECT * FROM PRODUCT WHERE PRODUCTSTATUS=?";
            db.pstm=db.con.prepareStatement(sql);
            db.pstm.setString(1, "Live");
            db.rs=db.pstm.executeQuery();
            
            while(db.rs.next()){
                db.rs.isFirst();
                buffer = "<center><div class='img'><img src='../" + db.rs.getString("IMAGEURL") + "' alt='' width='280px' height='200px'> <div class='desc'>" + db.rs.getString("NAME") + "</div></div></center> ";
            }
            
            db.closeConnection();
        response.getWriter().println(buffer);

        } catch (SQLException ex) {
            Logger.getLogger(loadauctionitem.class.getName()).log(Level.SEVERE, null, ex);
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
