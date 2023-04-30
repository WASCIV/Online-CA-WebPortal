/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emp;

import DB.DbConnection;
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
public class EmpLeaveServlet extends HttpServlet {

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
        String empid = null;
        String ename = null;
        try {
            HttpSession session = request.getSession();
            empid = (String) session.getAttribute("empid");
            ename = (String) session.getAttribute("ename");
            // System.out.println(enroll);
            if (empid != null || ename != null) {
                //System.out.println("if  " + enroll);
                session.setAttribute("empid", empid);
                session.setAttribute("cname", ename);
            } else {
                // System.out.println("else  " + enroll);
                response.sendRedirect("index.jsp?error=Please Login");
            }
        } catch (Exception e) {
            System.out.println(e);

        }
        try {
            String fdate = request.getParameter("fromdate");
            String tdate = request.getParameter("todate");
            String days = request.getParameter("days");
            DbConnection db = new DbConnection();
            int pleave = 0;
            int tleave = 30;
            db.rst = db.stmt.executeQuery("select total_days from emp_leave where empid='" + empid + "' and allowed=1");
            if (db.rst.next()) {
                pleave = db.rst.getInt(1);
            }
            if ((tleave - pleave) >= 0) {


                db.pstmt = db.con.prepareStatement("INSERT INTO emp_leave (empid,from_date, to_date,total_days) VALUES (?,?,?,?);");
                db.pstmt.setString(1, empid);
                db.pstmt.setString(2, fdate);
                db.pstmt.setString(3, tdate);
                db.pstmt.setString(4, days);
                int j = db.pstmt.executeUpdate();
                if (j > 0) {
                    response.sendRedirect("empLeave.jsp?msg=Successfull !");
                } else {
                    response.sendRedirect("empLeave.jsp?msg=Failed !");
                }
            }else{
                response.sendRedirect("empLeave.jsp?msg=You Can't apply for more leave !");
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
