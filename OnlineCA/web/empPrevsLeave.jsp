<%-- 
    Document   : empPrevsLeave
    Created on : Mar 30, 2013, 9:46:28 AM
    Author     : chandan
--%>

<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
            String empid = null;
            String ename = null;
            try {
                empid = (String) session.getAttribute("empid");
                ename = (String) session.getAttribute("ename");
                // System.out.println(enroll);
                if (empid != null || ename != null) {
                    //System.out.println("if  " + enroll);
                    session.setAttribute("empid", empid);
                    session.setAttribute("cname", ename);
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
        <title>Leave Detail</title>
         <style type="text/css">
            body{
                font-family: Courier New, Courier, monospace;
                font-size: 12px;
            }
         </style>
    </head>
    <body>
        <table width="100%" cellpadding="2" cellspacing="2" border="0">

                                        <tr style="background-color: #ccffcc;">
                                            <th>From Date</th>
                                            <th>To Date</th>
                                            <th>Days</th>
                                            <th>Granted</th>

                                        </tr>
                                        <%
                                                    try {
                                                        String grnt=null;
                                                        DbConnection db = new DbConnection();
                                                        db.rst = db.stmt.executeQuery("select * from emp_leave where empid='"+empid+"'");
                                                        if (db.rst.next()) {
                                                            if(db.rst.getString(5).equals("0")){
                                                                grnt="Yes";
                                                                }else{
                                                                grnt="No";
                                                                }
                                        %>
                                        <tr style="background-color: #f7f7f7;">
                                            <td><%=db.rst.getString(2)%></td>
                                            <td><%=db.rst.getString(3)%></td>
                                            <td><%=db.rst.getString(4)%></td>

                                            <td><%=db.rst.getString(5)%></td>


                                        </tr>
                                        <%
                                                        }else{
                                                            %>
                                                            <tr style="background-color: #f7f7f7;">
                                                                <td colspan="4" align="center"> No Record Found</td>
                                                            </tr>
                                                            <%
                                                    } }catch (Exception e) {
                                                        System.out.println(e);
                                                    }
                                        %>
                                    </table>
    </body>
</html>
