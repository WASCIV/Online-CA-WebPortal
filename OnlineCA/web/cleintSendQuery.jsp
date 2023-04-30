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
            String cid = null;
            String cname = null;
            try {
                cid = (String) session.getAttribute("cid");
                cname = (String) session.getAttribute("cname");
                // System.out.println(enroll);
                if (cid != null || cname != null) {
                    //System.out.println("if  " + enroll);
                    session.setAttribute("cid", cid);
                    session.setAttribute("cname", cname);
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
        <title>Client----------- Upload Document</title>
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
                                    <b>    Welcome Client!   <%=cname%></b>
                                </div>
                                <div style="font-size: 16px;color: #ffffff; float: right">
                                    <b>   <a href="CustLogOut" style="text-decoration: none;color: #ffffff;">Log Out&nbsp;&nbsp;</a></b>
                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td width="950px" height="250px" valign="top">

                                <div style="width: 200px;height: 250px; float: left;background-color: #f7f7f7">
                                    <div id="menu">

                                        <ul>
                                            <li><a href="clientHome.jsp"><span>Home</span></a></li>
                                            <li><a href="clientUpload.jsp"><span>Upload Document</span></a></li>
                                            <li><a href="clientDownload.jsp"><span>Download</span></a></li>
                                            <li><a href="cleintSendQuery.jsp"><span>Send Query</span></a></li>
                                            <li><a href="#"><span>&nbsp;</span></a></li>
                                            <li><a href="#"><span>&nbsp;</span></a></li>
                                            <li><a href="#"><span>&nbsp;</span></a></li>
                                            <li><a href="#"><span>&nbsp;</span></a></li>
                                        </ul>

                                    </div>
                                </div>

                                <div style="width: 750px;height: 250px; float: left;">
                                    <h1 style="color: #999999">
                                        Send Query
                                    </h1>
                                    <%
                                                try {
                                                    String subject = request.getParameter("subject");
                                                    String query = request.getParameter("query");
                                                    DbConnection db = new DbConnection();
                                                    if (subject != null) {
                                                        db.pstmt = db.con.prepareStatement("INSERT INTO cust_query(cid, qury_sub, detail) VALUES (?,?,?);");
                                                        db.pstmt.setString(1, cid);
                                                        db.pstmt.setString(2, subject);
                                                        db.pstmt.setString(3, query);
                                                        int j = db.pstmt.executeUpdate();
                                                        if (j > 0) {
                                    %>
                                    <span style="float: right;color: #00cc00" >  Send Successfully !</span>
                                    <%                                                                                                            } else {
                                    %>
                                    <span style="float: right;color: #ff3300" > Failed !</span>
                                    <%                                                                        }
                                                                                        } else {
                                    %>
                                    <span style="float: right;color: #ff3300" >  Please Specify all fields !</span>
                                    <%                                                                        }
                                                } catch (NullPointerException e) {
                                                    response.sendRedirect("stuSendQuery.jsp");
                                                } catch (Exception e) {
                                                    System.out.println(e);
                                                }

                                    %>
                                    <form action="" method="post">
                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td width="30%">Subject</td>
                                                <td width="70%"><input type="text" name="subject" /> </td>
                                            </tr>
                                            <tr>
                                                <td width="30%">Query</td>
                                                <td width="70%"><textarea rows="5" cols="50" name="query" ></textarea> </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <input type="submit" value="Send " />
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
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
