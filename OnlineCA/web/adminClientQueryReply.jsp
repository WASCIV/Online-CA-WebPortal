<%--
    Document   : adminViewClientList
    Created on : Mar 31, 2013, 2:34:02 PM
    Author     : chandan
--%>

<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%

            String login = null;
            try {

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

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin----------Client List</title>
        <style type="text/css">
            body{
                font-family: Courier New, Courier, monospace;
                font-size: 12px;
            }
        </style>
    </head>
    <body>
        <form method="post" action="SendMailToClient" name="frm">
        <table align="center" border="0" cellpadding="1" cellspacing="1" width="50%" style="background-color: #f7f7f7;">
            <tr>
                <td colspan="8" width="100%" align="center">
                    <h1>Reply to Client</h1>
                </td>
            </tr>
            <tr style="background-color: #ccffcc;">
                <th>To :</th>


                <%
                            String sub = null;
                            String cid = null;
                            String cqid=null;
                            try {
                                cid = request.getParameter("cid");
                                sub = request.getParameter("sub");
                                cqid=request.getParameter("cqid");

                                DbConnection db = new DbConnection();
                                db.rst = db.stmt.executeQuery("select email from cust_mstr where cid='" + cid + "' ");
                                if (db.rst.next()) {
                %>

                <td><%=db.rst.getString(1)%></td>

            <input type="hidden" name="to" value="<%=db.rst.getString(1)%>" />
<input type="hidden" name="cqid" value="<%=cqid%>" />

                <%
                                }
                            } catch (Exception e) {
                                System.out.println(e);
                            }
                %>

            <tr>
                <th>
                    Subject :
                </th>
                <td>
                    Reply :  <input type="hidden" name="sub" value="Reply : <%=sub%>" /><%=sub%>
                </td>
            </tr>
            <tr>
                <th>
                    Message :
                </th>
                <td>
                    <textarea rows="5" cols="30" name="msg"></textarea>
                </td>
            </tr>
            <tr>

                <td colspan="2" width="100%" align="center">
                    <input type="submit" value="Send Mail :-" />
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
