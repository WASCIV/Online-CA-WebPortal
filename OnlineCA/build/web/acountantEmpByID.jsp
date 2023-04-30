<%-- 
    Document   : acountantEmpByID
    Created on : Mar 31, 2013, 11:53:08 AM
    Author     : chandan
--%>

<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
            String aid = null;
            String aname = null;
            try {
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
            %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Employee Detail by ID Page</title>
         <style type="text/css">
            body{
                font-family: Courier New, Courier, monospace;
                font-size: 12px;
            }
         </style>
    </head>
    <body>
        <table width="100%" cellpadding="2" cellspacing="2" border="0" align="center">

                                        <tr style="background-color: #ccffcc;">
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Father Name</th>
                                            <th>DOB</th>
                                            <th>Address</th>
                                            <th>Phone</th>
                                            <th>Email</th>
                                            <th>DOJ</th>
                                            <th>Designation</th>
                                        </tr>
                                        <%
                                                    try {
                                                        String empid=request.getParameter("empid");
                                                        DbConnection db = new DbConnection();
                                                       db.rst = db.stmt.executeQuery("select * from emp_mstr where empid='"+empid+"'");
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
