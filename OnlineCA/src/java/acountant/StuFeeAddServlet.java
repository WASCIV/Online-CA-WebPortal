/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acountant;

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
public class StuFeeAddServlet extends HttpServlet {

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
        String aid = null;
        String aname = null;
        try {
            HttpSession session = request.getSession();
            aid = (String) session.getAttribute("aid");
            aname = (String) session.getAttribute("aname");
            // System.out.println(enroll);
            if (aid != null || aname != null) {
                //System.out.println("if  " + enroll);
                session.setAttribute("aid", aid);
                session.setAttribute("aname", aname);
            } else {
                // System.out.println("else  " + enroll);
                response.sendRedirect("index.jsp?error=Please Login");
            }
        } catch (Exception e) {
            System.out.println(e);

        }
        try {
            String sid = request.getParameter("sid");
            String fee = request.getParameter("fee");
            String status = request.getParameter("status").trim();
            String pdate = request.getParameter("pdate");
            String stts=null;
            DbConnection db = new DbConnection();
            if(status.equals("paid"))
            {
                stts="1";
            db.pstmt = db.con.prepareStatement("INSERT INTO stu_fee(sid,fee,paid,paid_date) VALUES (?,?,?,?);");
            }else{
             db.pstmt = db.con.prepareStatement("INSERT INTO stu_fee(sid,fee,paid,due_date) VALUES (?,?,?,?);");
             stts="0";
            }
            db.pstmt.setString(1, sid);
            db.pstmt.setString(2, fee);
            db.pstmt.setString(3, stts);
            db.pstmt.setString(4, pdate);
         
            int i = db.pstmt.executeUpdate();
            if (i > 0) {
                response.sendRedirect("acountantStuAdd.jsp?msg=Successfull !");
            } else {
                response.sendRedirect("acountantStuAdd.jsp?msg=Failed !");
            }
        } catch (NullPointerException ne) {
            System.out.println(ne);
            response.sendRedirect("acountantStuAdd.jsp?msg=Please Specify All Fields !");
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
