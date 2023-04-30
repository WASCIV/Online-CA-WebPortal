/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import DB.DbConnection;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chandan
 */
public class AdminClientUpldServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String login = null;
        try {
            HttpSession session = request.getSession();
            login = (String) session.getAttribute("login");
            // System.out.println(enroll);
            if (login != null) {
                //System.out.println("if  " + enroll);

                session.setAttribute("login", login);
            } else {
                // System.out.println("else  " + enroll);
                response.sendRedirect("index.jsp?error=Please Login");
            }
        } catch (Exception e) {
            System.out.println(e);

        }

       String fileName=null;
        String []value = new String[3];
        String fileSavePath =getServletContext( ).getRealPath("/");
        File f = null;
        int i = 0;
        long s = 0;
//        int c = 0;
//        byte[] v1 = null;
//        byte[] v2 = null;
//        byte[] v3 = null;

        try {
            MultipartParser mps = new MultipartParser(request, 5 * 1024 * 1024);
            Part part;
            while ((part = mps.readNextPart()) != null) {
                String name = part.getName();
                if (part.isParam()) {

                    System.out.print(i);
                    ParamPart paramPart = (ParamPart) part;


                    value[i]= paramPart.getStringValue();
//

                    i++;


                } else if (part.isFile()) {
                    FilePart filePart = (FilePart) part;
                    fileName = filePart.getFileName();
                    System.out.println(fileName);
                    //   f = new File(fileName);
                    if (fileName != null) {
                        long fileSize = filePart.writeTo(
                                new java.io.File(fileSavePath));
                     //   s = filePart.writeTo(f);
                    }
                }
            }

            // FileInputStream fis = new FileInputStream(f);

            DbConnection db = new DbConnection();
            db.pstmt = db.con.prepareStatement("insert into cust_dwnld(cid,sub,dwnld) values (?,?,?); ");

            db.pstmt.setString(1, value[0]);
            db.pstmt.setString(2, value[1]);
            db.pstmt.setString(3, ("./"+fileName));

            int j = db.pstmt.executeUpdate();


            if (j > 0) {

                response.sendRedirect("./adminClientUpld.jsp?msg=Uploaded Successfully !");
            }



        } catch (Exception e) {
            System.out.println(e);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
