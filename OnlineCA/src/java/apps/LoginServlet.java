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
import javax.servlet.http.HttpSession;

/**
 *
 * @author chandan
 */
public class LoginServlet extends HttpServlet {

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
            String usrlogin = request.getParameter("login").trim();
            String pswd = request.getParameter("pswd").trim();
            String utype = request.getParameter("utype").trim();
            System.out.println(usrlogin);
            DbConnection dc = new DbConnection();
            if (utype.equals("stu")) {
                dc.rst = dc.stmt.executeQuery("SELECT  sid,sname FROM stu_mstr WHERE login='" + usrlogin + "' and pswd= '" + pswd + "' ");
                if (dc.rst.next()) {
                    //String enroll = dc.rst.getString(1);
                   // dc.rst = dc.stmt.executeQuery("SELECT  sname FROM stu_mstr WHERE enrol_no= '" + enroll + "'  ");
                    //dc.rst.next();
                    HttpSession session = request.getSession();
                    session.setAttribute("sid", dc.rst.getString(1));
                    session.setAttribute("sname", dc.rst.getString(2));
                    response.sendRedirect("stuHome.jsp");
                } else {
                    response.sendRedirect("index.jsp?error=Invalid Login/Password");
                }
            }
            if (utype.equals("client")) {
                dc.rst = dc.stmt.executeQuery("SELECT  cid,cname FROM cust_mstr WHERE login='" + usrlogin + "' and pswd='" + pswd + "'");
                if (dc.rst.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("cid", dc.rst.getString(1));
                    session.setAttribute("cname", dc.rst.getString(2));
                    response.sendRedirect("clientHome.jsp");
                } else {
                    response.sendRedirect("index.jsp?error=Invalid Login ID/Password !");
                }
            }
            if (utype.equals("admin")) {
                dc.rst = dc.stmt.executeQuery("SELECT  login FROM admin WHERE login='" + usrlogin + "' and pswd='" + pswd + "'");
                if (dc.rst.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("login", dc.rst.getString(1));
                    response.sendRedirect("adminHome.jsp");
                } else {
                    response.sendRedirect("index.jsp?error=Invalid User Name/Password !");
                }
            }
             if (utype.equals("emp")) {
                dc.rst = dc.stmt.executeQuery("SELECT  empid,ename FROM emp_mstr WHERE login='" + usrlogin + "' and pswd='" + pswd + "'");
                if (dc.rst.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("empid", dc.rst.getString(1));
                    session.setAttribute("ename", dc.rst.getString(2));
                    response.sendRedirect("empHome.jsp");
                } else {
                    response.sendRedirect("index.jsp?error=Invalid Login ID/Password !");
                }
            }
             if (utype.equals("to")) {
                 System.out.println("dsfhjsdfh");
                dc.rst = dc.stmt.executeQuery("SELECT  toid,toname FROM to_mstr WHERE login='" + usrlogin + "' and pswd='" + pswd + "'");
                if (dc.rst.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("toid", dc.rst.getString(1));
                    session.setAttribute("toname", dc.rst.getString(2));
                    response.sendRedirect("toHome.jsp");
                } else {
                    response.sendRedirect("index.jsp?error=Invalid Login ID/Password !");
                }
            }
            if (utype.equals("actnt")) {
                dc.rst = dc.stmt.executeQuery("SELECT  aid,aname FROM acount_mstr WHERE login='" + usrlogin + "' and pswd='" + pswd + "'");
                if (dc.rst.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("aid", dc.rst.getString(1));
                    session.setAttribute("aname", dc.rst.getString(2));
                    response.sendRedirect("acountantHome.jsp");
                } else {
                    response.sendRedirect("index.jsp?error=Invalid Login ID/Password !");
                }
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
