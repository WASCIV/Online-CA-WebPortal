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
 * @author tripathi
 */
public class ForgotPswdServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
        try {
            String utype = request.getParameter("utype").trim();
            String login = request.getParameter("login").trim();
            String dob = request.getParameter("dob").trim();
            String sql = "";
            if (utype.equals("clnt")) {
                sql = "select pswd from cust_mstr where login='" + login + "' and dob='" + dob + "'";
            } else if (utype.equals("stu")) {
                sql = "select pswd from stu_mstr where login='" + login + "' and dob='" + dob + "'";
            } else if (utype.equals("emp")) {
                sql = "select pswd from emp_mstr where login='" + login + "' and dob='" + dob + "'";
            } else if (utype.equals("acnt")) {
                sql = "select pswd from acount_mstr where login='" + login + "' and dob='" + dob + "'";
            } else if (utype.equals("to")) {
                sql = "select pswd from to_mstr where login='" + login + "' and dob='" + dob + "'";
            }
            DbConnection db = new DbConnection();
            db.rst = db.stmt.executeQuery(sql);
            if (db.rst.next()) {
                response.sendRedirect("ForgotPswd.jsp?pswd=" + db.rst.getString(1) + "");
            } else {
                response.sendRedirect("ForgotPswd.jsp?frgterr=1");
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
