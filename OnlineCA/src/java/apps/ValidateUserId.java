/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package apps;

import DB.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chandan
 */
public class ValidateUserId extends HttpServlet {

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
        try {
            System.out.println("hi");
            String usrlogin = request.getParameter("usrlogin").trim();
             System.out.println(usrlogin);
            String utype=request.getParameter("utype").trim();

           System.out.println(usrlogin+utype);
            DbConnection dc = new DbConnection();
            if(utype.equals("stu")){
                dc.rst = dc.stmt.executeQuery("SELECT  login FROM stu_mstr WHERE login='"+usrlogin+"'");
            }else{
            dc.rst = dc.stmt.executeQuery("SELECT  login FROM cust_mstr WHERE login='"+usrlogin+"'");
            }
            if (dc.rst.next()) {
                out.print("0");
            } else {
                out.print("1");
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
