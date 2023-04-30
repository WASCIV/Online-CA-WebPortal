/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package admin;

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
public class AddActntServlet extends HttpServlet {
   
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

        try {
            String ename = request.getParameter("ename");
            String efname = request.getParameter("efname");
            String edob = request.getParameter("edob");
            String eadrs = request.getParameter("eadrs");
            String ephone = request.getParameter("ephone");
            String eemail = request.getParameter("eemail");
            String edoj = request.getParameter("edoj");

            String elogin = request.getParameter("elogin");
            String pswd = request.getParameter("pswd");
            DbConnection db = new DbConnection();
            db.pstmt = db.con.prepareStatement("INSERT INTO acount_mstr(aname,afname,dob,address,phone,email,doj,login, pswd) VALUES (?,?,?,?,?,?,?,?,?);");
            db.pstmt.setString(1, ename);
            db.pstmt.setString(2, efname);
            db.pstmt.setString(3, edob);
            db.pstmt.setString(4, eadrs);
            db.pstmt.setString(5, ephone);
             db.pstmt.setString(6, eemail);
             db.pstmt.setString(7, edoj);



            db.pstmt.setString(8, elogin);
            db.pstmt.setString(9, pswd);
            int j = db.pstmt.executeUpdate();
            if (j > 0) {
                response.sendRedirect("adminAddActnt.jsp?msg=Added Successfully !");
            } else {
                response.sendRedirect("adminAddActnt.jsp?msg=Failed !");
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
