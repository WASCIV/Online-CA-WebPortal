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


            String toid = null;
            String toname = null;
            try {
                toid = (String) session.getAttribute("toid");
                toname = (String) session.getAttribute("toname");
                // System.out.println(enroll);
                if (toid != null || toname != null) {
                    //System.out.println("if  " + enroll);
                    session.setAttribute("toid", toid);
                    session.setAttribute("sname", toname);
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
        <form method="post" action="SendMailToStu" name="frm">
            <table align="center" border="0" cellpadding="1" cellspacing="1" width="50%" style="background-color: #f7f7f7;">
                <tr>
                    <td colspan="8" width="100%" align="center">
                        <h1>Reply to Student</h1>
                    </td>
                </tr>
                <tr style="background-color: #ccffcc;">
                    <th>To :</th>


                    <%
                                String sub = null;
                                String sid = null;
                                String sqid = null;
                                try {
                                    sid = request.getParameter("sid");
                                    sub = request.getParameter("sub");
                                    sqid = request.getParameter("sqid");

                                    DbConnection db = new DbConnection();
                                    db.rst = db.stmt.executeQuery("select email from stu_mstr where sid='" + sid + "' ");
                                    if (db.rst.next()) {
                    %>

                    <td><%=db.rst.getString(1)%></td>

                <input type="hidden" name="to" value="<%=db.rst.getString(1)%>" />
                <input type="hidden" name="sqid" value="<%=sqid%>" />

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
