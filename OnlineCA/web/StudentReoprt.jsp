<%-- 
    Document   : StudentReoprt
    Created on : Apr 28, 2013, 1:57:07 PM
    Author     : tripathi
--%>

<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <title>Student Report</title>
        <style type="text/css">

            body{
                font-family: Verdana,Arial,Helvetica,sans-serif;
                font-size: 12px;
            }
        </style>
        <script type="text/javascript" src="js/clndr/scw.js" ></script>
    </head>
    <body>
    <center>
        <fieldset style="width: 50%;">
            <legend style="font-size: 16px;">Select Dates</legend>
            <form action="" method="">
                From : <input type="text" name="fdate" onclick="scwShow(this,event);" onfocus="scwShow(this,event);" /> &nbsp;&nbsp; To : <input type="text" name="tdate" onclick="scwShow(this,event);" onfocus="scwShow(this,event);" />&nbsp;&nbsp; <input type="submit" value="View Report" />
            </form>
        </fieldset>
        <%
            String fdate = null, tdate = null;
            try {
                fdate = request.getParameter("fdate");
                tdate = request.getParameter("tdate");
                if (fdate != null && tdate != null) {
        %>
        <h4>
            <%=fdate%>  &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;   To  &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  <%=tdate%>
        </h4>
        <fieldset style="width: 90%;">
            <legend style="font-size: 16px;">Student Report</legend>
            <table width="100%"  cellspacing="1" cellpadding="1">
                <tr style="background-color: #999999;">
                    <th>ID</th>
                    <th>Name</th>
                    <th>Father Name</th>
                    <th>Address</th>
                    <th>DOB</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Login</th>
                    <th>Password</th>
                    <th>DOJ</th>
                </tr>
                <%
                    try {
                        int row = 0;
                        DbConnection db = new DbConnection();
                        db.rst = db.stmt.executeQuery("SELECT * FROM stu_mstr WHERE doj BETWEEN '" + fdate + "' AND '" + tdate + "'");
                        while (db.rst.next()) {
                            row = 1;
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
                    <td><%=db.rst.getString(10)%></td>

                </tr>
                <%
                    }
                    if (row == 0) {
                %>
                <h3>No Record Matched</h3>
                <%                                    }
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                %>
            </table>
        </fieldset>
        <%                          }
            } catch (NullPointerException e) {
                System.out.println(e);
            }
        %>


    </center>
</body>
</html>
