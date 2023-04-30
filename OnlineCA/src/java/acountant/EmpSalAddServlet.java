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
public class EmpSalAddServlet extends HttpServlet {
   
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
                HttpSession session= request.getSession();
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
            String empid=request.getParameter("empid");
            String basic=request.getParameter("basic");
            String ta=request.getParameter("ta");
            String da=request.getParameter("da");
            String other=request.getParameter("other");

            String total=request.getParameter("total");
            String month=request.getParameter("month");
            String idate=request.getParameter("idate");
          DbConnection db = new DbConnection();
          db.pstmt= db.con.prepareStatement("INSERT INTO emp_sal(empid,basic,ta,da,other,total,smonth,issue_date) VALUES (?,?,?,?, ?,?,?,?);");
          db.pstmt.setString(1, empid);
          db.pstmt.setString(2, basic);
          db.pstmt.setString(3, ta);
          db.pstmt.setString(4, da);
          db.pstmt.setString(5, other);
          db.pstmt.setString(6, total);
          db.pstmt.setString(7, month);
          db.pstmt.setString(8, idate);
          int i=db.pstmt.executeUpdate();
          if(i>0)
          {
              response.sendRedirect("acountantEmpSalAdd.jsp?msg=Successfull !");
          }else{
              response.sendRedirect("acountantEmpSalAdd.jsp?msg=Failed !");
          }
        }catch(NullPointerException ne) {
            System.out.println(ne);
            response.sendRedirect("acountantEmpSalAdd.jsp?msg=Please Specify All Fields !");
        }
        
        catch (Exception e) {
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
