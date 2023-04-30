<%--
    Document   : index
    Created on : Mar 28, 2013, 12:16:37 PM
    Author     : chandan
--%>

<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            String sid = null;
            String sname = null;
            try {
                sid = (String) session.getAttribute("sid");
                sname = (String) session.getAttribute("sname");
                // System.out.println(enroll);
                if (sid != null || sname != null) {
                    //System.out.println("if  " + enroll);
                    session.setAttribute("sid", sid);
                    session.setAttribute("sname", sname);
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
        <title>Student----------- Home</title>
        <style type="text/css">
            body{
                font-family: Courier New, Courier, monospace;
                font-size: 12px;
            }

            #menu ul,#menu li { margin:0; padding:0; }
            #menu li {list-style:none;width:160px;clear:both;}

            #menu a { display:block;margin:0 auto;color:#fff;text-decoration:none; background:url(images/_right.png) right top no-repeat;}

            #menu a span { display:block;text-align:left;background:url(images/_left.png) left top no-repeat; font:bold 12px/30px Arial, Helvetica, sans-serif;  padding:0 20px; }

            #menu a:hover { background-position:right bottom;text-decoration:underline}
            #menu a:hover span { background-position:left bottom;  }</style>
    </head>
    <body>
        <table width="990"  border="0px" align="center" cellpadding="0" cellspacing="0">
            <tr>

                <td width="16"><img src="images/top_lef.gif" width="16" height="16"></td>
                <td width="950" height="16" background="images/top_mid.gif"><img src="images/top_mid.gif" width="16" height="16"></td>
                <td width="24"><img src="images/top_rig.gif" width="24" height="16"></td>
            </tr>
            <tr>
                <td width="16" background="images/cen_lef.gif"><img src="images/cen_lef.gif" width="16" height="11"></td>
                <td bgcolor="#FFFFFF" width="950" bordercolordark="#970000">
                    <table width="950px" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="950px">
                                <%@include file="header.html" %>
                            </td>
                        </tr>
                        <tr>
                            <td width="950px" bgcolor="#296dc1" height="30px" >

                                <div style="font-size: 16px;color: #ffffff; float: left">
                                    <b>    Welcome Student!   <%=sname%></b>
                                </div>
                                <div style="font-size: 16px;color: #ffffff; float: right">
                                    <b>   <a href="StuLogOut" style="text-decoration: none;color: #ffffff;">Log Out&nbsp;&nbsp;</a></b>
                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td width="950px" height="250px" valign="top">

                                <div style="width: 200px;height: 250px; float: left;background-color: #f7f7f7">
                                    <div id="menu">

                                        <ul>
                                            <li><a href="stuHome.jsp"><span>Home</span></a></li>
                                            <li><a href="stuSchedule.jsp"><span>Check Schedule</span></a></li>
                                            <li><a href="studownload.jsp"><span>Download</span></a></li>
                                            <li><a href="stuSendQuery.jsp"><span>Send Query</span></a></li>
                                            <li><a href="stuFee.jsp"><span>Fee Status</span></a></li>
                                            <li><a href="#"><span>&nbsp;</span></a></li>
                                            <li><a href="#"><span>&nbsp;</span></a></li>
                                            <li><a href="#"><span>&nbsp;</span></a></li>
                                        </ul>

                                    </div>
                                </div>

                                <div style="width: 750px;height: 250px; float: left;">
                                    <h1 style="color: #999999">
                                        Home
                                    </h1>
                                       <table width="100%" cellpadding="2" cellspacing="2" border="0">

                                        <tr style="background-color: #ccffcc;">
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Father Name</th>
                                            <th>Address</th>
                                            <th>DOB</th>
                                            <th>Phone</th>
                                            <th>Email</th>
                                        </tr>
                                        <%
                                                    try {
                                                        DbConnection db = new DbConnection();
                                                        db.rst = db.stmt.executeQuery("select * from stu_mstr where sid='"+sid+"'");
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

                                        </tr>
                                        <%
                                                        }
                                                    } catch (Exception e) {
                                                        System.out.println(e);
                                                    }
                                        %>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="950px">
                                <%@include file="footer.html" %>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="24" background="images/cen_rig.gif"><img src="images/cen_rig.gif" width="24" height="11"></td>
            </tr>
            <tr>
                <td width="16" height="16"><img src="images/bot_lef.gif" width="16" height="16"></td>
                <td height="16" background="images/bot_mid.gif"><img src="images/bot_mid.gif" width="16" height="16"></td>
                <td width="24" height="16"><img src="images/bot_rig.gif" width="24" height="16"></td>
            </tr>
        </table>


    </body>
</html>
