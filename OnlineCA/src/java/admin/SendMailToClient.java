/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import DB.DbConnection;
import apps.SMTPAuthenticator;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;
import javax.mail.AuthenticationFailedException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author chandan
 */
public class SendMailToClient extends HttpServlet {

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
        String from = "admin";
        String to = request.getParameter("to");
        String subject = request.getParameter("sub");
        String message = request.getParameter("msg");
        String cqid = request.getParameter("cqid");
        String login = "gmail";
        String password = "";
        System.out.println(to);
        System.out.println(subject);
        try {
            Properties props = new Properties();
            props.setProperty("mail.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.starttls.enable", "true");

            Authenticator auth = new SMTPAuthenticator(login, password);

            Session session = Session.getInstance(props, auth);

            MimeMessage msg = new MimeMessage(session);
            msg.setText(message);
            msg.setSubject(subject);
            msg.setFrom(new InternetAddress(from));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            Transport.send(msg);
            DbConnection dbConnection = new DbConnection();
             System.out.println("i........."+cqid );
            dbConnection.pstmt = dbConnection.con.prepareStatement("update cust_query set replied=1 where cqid='" + cqid + "' ");
             System.out.println("i........." );
            int i = dbConnection.pstmt.executeUpdate();
            System.out.println("i........." + i);
            response.sendRedirect("adminClientQuery.jsp?msg=Mail Sent Seuccessfully !");
        } catch (AuthenticationFailedException ex) {
            System.out.println(ex.getMessage());
            response.sendRedirect("adminClientQuery.jsp?err=Authentication failed !");

        } catch (AddressException ex) {
            System.out.println(ex);
//            request.setAttribute("ErrorMessage", "Wrong email address");
//
//            RequestDispatcher dispatcher = request.getRequestDispatcher(err);
//            dispatcher.forward(request, response);
            response.sendRedirect("adminClientQuery.jsp?err=Wrong Email Address !");

        } catch (MessagingException ex) {
//            String errmsg=ex.'
            System.out.println(ex.getMessage());
            response.sendRedirect("adminClientQuery.jsp?err='" + ex.getMessage() + "'");
        } catch (SQLException se) {
            System.out.println(se);
        } catch (Exception e) {
            System.out.println(e);
        }

        // response.sendRedirect("adminClientQuery.jsp?msg=Mail Sent Seuccessfully !");
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
