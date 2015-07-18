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
import java.sql.Date;

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
public class addProduct extends HttpServlet {

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
        //Date format for image upload
        SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyyssSSS");
        //Date date=new Date(Long.parseLong(df.format(dts).toString()));
        Product p = new Product();
        HttpSession session = request.getSession();
        beans.LoginBeans login;
        login = (beans.LoginBeans) session.getAttribute("login");
        String username = login.getUserName();
        int userid = login.getUserId();
        int type = login.getUserType();
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
                    } else {
                        try {
                                String img_name = fileItem.getName();
                                
                                if (fileItem.getName().trim().length() > 0) {
                                    img_name = img_name.substring(0, img_name.indexOf(".")) + "_" + sdf.format(new java.util.Date()) + img_name.substring(img_name.indexOf("."));
                                    fileItem.write(new File(getServletContext().getRealPath("/CP/globalimage") + "/" + img_name));
                                    v.add("CP/globalimage/" + img_name);
                                } else {
                                    v.add("CP/globalimage/default-image.png");
                                }

                           

                            System.out.println(new File(getServletContext().getRealPath("/CP/globalimage/") + fileItem.getName()));
                        } catch (Exception ex) {
                            Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
            } catch (FileUploadException ex) {
                Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
            }
           // String result=p.edit(v.elementAt(0), QUANTITYONHAND, SELLPRICE, SHIPPINGCOST, PRODUCTCREATEDBY, null, null, PRODUCTCAT, idPRODUCT, null)

            /* TODO output your page here. You may use following sample code. */
            /// Dont Forget Created By Session
            String message = p.save(v.elementAt(0), Integer.parseInt(v.elementAt(1)), Integer.parseInt(v.elementAt(2)), Double.parseDouble(v.elementAt(3)), Double.parseDouble(v.elementAt(4)), v.elementAt(5), v.elementAt(10), v.elementAt(6), v.elementAt(7), v.elementAt(8), v.elementAt(9), userid, df.format(dts));
            if (message.equals("Successfully . . Add Product " + v.elementAt(0) + ". Thanks !")) {
                response.sendRedirect(request.getContextPath() + "/CP/product/add.jsp?msg=" + URLEncoder.encode(message, "UTF-8") + "&suc=block");
            } else {
                response.sendRedirect(request.getContextPath() + "/CP/product/add.jsp?msg=" + URLEncoder.encode(message, "UTF-8") + "&err=block");
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
