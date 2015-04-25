/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author emam
 */
public class editProduct extends HttpServlet {

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
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload fileUpload = new ServletFileUpload(factory);
        Vector<String> v = new Vector<String>();

        java.util.Date dts = new java.util.Date();
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        HttpSession session = request.getSession();
        beans.LoginBeans login;
        login = (beans.LoginBeans) session.getAttribute("login");
        String username = login.getUserName();
        int userid = login.getUserId();
        int type = login.getUserType();
        Product p = new Product();
        int img_flag = 0;
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            try {
                List listItems = fileUpload.parseRequest(request);
                FileItem fileItem = null;
                for (Object o : listItems) {
                    fileItem = (FileItem) o;
                    if (fileItem.isFormField()) {
                        String fieldvalue = fileItem.getString();
                        v.add(fieldvalue);
                        System.out.println("val " + fieldvalue);
                    } else {
                        try {
                            if (!fileItem.getName().isEmpty()) {
                                img_flag += 1;
                                fileItem.write(new File(getServletContext().getRealPath("/CP/globalimage") + "/" + fileItem.getName()));
                                v.add("CP/globalimage" + "/" + fileItem.getName());
                            } else {

                                v.add("CP/globalimage/default-image.png");
                                System.out.println("Here");
                            }

                        } catch (Exception ex) {
                            Logger.getLogger(editProduct.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
            } catch (FileUploadException ex) {
                Logger.getLogger(editProduct.class.getName()).log(Level.SEVERE, null, ex);
            }

            String message = null;

            /// Image One 
            if (v.get(7).equals("CP/globalimage/default-image.png")) {
                v.set(7, p.getImgOne(Integer.valueOf(v.get(0))));
            }

            //// Image Two 
            if (v.get(8).equals("CP/globalimage/default-image.png")) {
                v.set(8, p.getImgTwo(Integer.valueOf(v.get(0))));
            }

            // imgae three 
            if (v.get(9).equals("CP/globalimage/default-image.png")) {
                v.set(9, p.getImgThree(Integer.valueOf(v.get(0))));
            }

            // img four 
            if (v.get(10).equals("CP/globalimage/default-image.png")) {
                v.set(10, p.getImgThree(Integer.valueOf(v.get(0))));
            }

            //     if (img_flag > 0) {
            message = p.edit(v.elementAt(1), Integer.parseInt(v.elementAt(2)), Integer.parseInt(v.elementAt(3)), Double.parseDouble(v.elementAt(4)), Double.parseDouble(v.elementAt(5)), v.elementAt(7), v.elementAt(8), v.elementAt(9), v.elementAt(10), userid, df.format(dts), Integer.parseInt(v.elementAt(0)), v.elementAt(6), v.elementAt(11));
      //      } else {
            //       message = p.editWithNoImage(v.elementAt(1), Integer.parseInt(v.elementAt(2)), Integer.parseInt(v.elementAt(3)), Double.parseDouble(v.elementAt(4)), Double.parseDouble(v.elementAt(5)), v.elementAt(7), userid, df.format(dts), Integer.parseInt(v.elementAt(0)), v.elementAt(6), v.elementAt(11));
            //    }

            if (message.equals("Successfully . . Edit Product " + v.elementAt(1) + ". Thanks !")) {
                response.sendRedirect(request.getContextPath() + "/CP/product/view.jsp?msg=" + URLEncoder.encode(message, "UTF-8") + "&suc=block");
            } else {
                response.sendRedirect(request.getContextPath() + "/CP/product/edit.jsp?msg=" + URLEncoder.encode(message, "UTF-8") + "&err=block");
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
