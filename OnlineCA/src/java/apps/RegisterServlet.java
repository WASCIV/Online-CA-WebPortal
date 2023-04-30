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
public class RegisterServlet extends HttpServlet {

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
            String utype = request.getParameter("utype");
            String name = request.getParameter("name");
            String fname = request.getParameter("fname");
            String dob = request.getParameter("dob");
            String adrs = request.getParameter("adrs");
            String mob = request.getParameter("mob");
            String emial = request.getParameter("email");
            String login = request.getParameter("login");
            String pswd = request.getParameter("pswd");
            System.out.println(utype);
            DbConnection db = new DbConnection();
            if (utype.equals("stu")) {
                 System.out.println(utype);
                db.pstmt = db.con.prepareStatement("INSERT INTO stu_mstr(sname,sfname,address,dob,phone,email,login,pswd,doj) VALUES (?,?,?,?,?,?,?,?,curdate()); ");
            } else {
                db.pstmt = db.con.prepareStatement("INSERT INTO cust_mstr(cname,cfname,address,dob,phone,email,login,pswd,doj) VALUES (?,?,?,?,?,?,?,?,curdate()); ");
            }
            db.pstmt.setString(1,name );
            db.pstmt.setString(2,fname );
            db.pstmt.setString(3,adrs );
            db.pstmt.setString(4,dob );
            db.pstmt.setString(5,mob );
            db.pstmt.setString(6,emial );
            db.pstmt.setString(7,login );
            db.pstmt.setString(8,pswd );
            int i= db.pstmt.executeUpdate();
            if(i>0){
                response.sendRedirect("registration.jsp?msg=Rregisterd Succefully !");
            }else{
                response.sendRedirect("registration.jsp?msg=Failed !");
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
