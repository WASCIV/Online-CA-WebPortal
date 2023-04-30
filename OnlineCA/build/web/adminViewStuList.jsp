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
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td colspan="9" width="100%" align="center">
                    <h1>Student List</h1>
                </td>
            </tr>
            <tr style="background-color: #ccffcc;">
                <th>ID</th>
                <th>Name</th>
                <th>Father Name</th>
                <th>Address</th>
                <th>DOB</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Login</th>
                <th>Password</th>
            </tr>
            <%
                        try {
                            DbConnection db = new DbConnection();
                            db.rst = db.stmt.executeQuery("select * from stu_mstr ");
                            if (db.rst.next()) {
            %>
            <tr style="background-color: #f7f7f7;">
                <td><%=db.rst.getString(1)%></td>
                <td><%=db.rst.getString(2)%></td>
                <td><%=db.rst.getString(3)%></td>
                <td><%=db.rst.getString(4)%></td>
                <td><%=db.rst.getString(5)%></td>
                <td><%=db.rst.getString(6)%></td>
                <td><%=db.rst.getString(7)%></td>
                <td><%=db.rst.getString(8)%></td>
                <td><%=db.rst.getString(9)%></td>

            </tr>
            <%
                            }
                        } catch (Exception e) {
                            System.out.println(e);
                        }
            %>
        </table>
    </body>
</html>
