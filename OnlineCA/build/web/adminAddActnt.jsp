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
        <title>Admin----------- Add Training Officer</title>
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
            <script type="text/javascript" src="js/clndr/scw.js" ></script>
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
                                    <b>    Welcome Admin !   <%=login%></b>
                                </div>
                                <div style="font-size: 16px;color: #ffffff; float: right">
                                    <b>   <a href="StuLogOut" style="text-decoration: none;color: #ffffff;">Log Out&nbsp;&nbsp;</a></b>
                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td width="950px"  valign="top">

                                <div style="width: 200px; float: left;background-color: #f7f7f7">
                                    <div id="menu">

                                        <ul>
                                            <li><a href="adminAddEmp.jsp"><span>Home</span></a></li>
                                            <li><a href="#"><span>&nbsp;</span></a></li>
                                            <li><a href="adminViewClientList.jsp" target="_blank"><span>Client List</span></a></li>
                                            <li><a href="adminClientQuery.jsp" target="_blank"><span>Client Query</span></a></li>
                                            <li><a href="adminClientUpld.jsp"><span>Upload Document</span></a></li>
                                             <li><a href="adminClientDwnld.jsp" title="From Client"><span>Download Document</span></a></li>
                                            <li><a href="#"><span>&nbsp;</span></a></li>
                                            <li><a href="adminViewStuList.jsp"><span>Student List</span></a></li>
                                           <li><a href="#"><span>&nbsp;</span></a></li>
                                            <li><a href="adminAddEmp.jsp"><span>Add Employee</span></a></li>
                                            <li><a href="adminViewEmpList.jsp" target="_blank"><span>Employee List</span></a></li>
                                           <li><a href="#"><span>&nbsp;</span></a></li>
                                            <li><a href="adminAddTo.jsp"><span>Add TO</span></a></li>
                                            <li><a href="adminViewToList.jsp" target="_blank"><span>TO List</span></a></li>

                                           <li><a href="#"><span>&nbsp;</span></a></li>
                                            <li><a href="adminAddActnt.jsp"><span>Add Acountant</span></a></li>
                                            <li><a href="adminViewActntList.jsp" target="_blank"><span>Acountant List</span></a></li>


                                            <li><a href="#"><span>&nbsp;</span></a></li>
                                        </ul>

                                    </div>
                                </div>

                                <div style="width: 750px; float: left;">
                                    <h1 style="color: #999999">
                                        Add Acountant

                                    </h1>
                                    <hr width="80%" size="1px" style="color: #fff;" align="left"/>
                                   <%
                                     try{
                                        String msg= request.getParameter("msg");
                                        if(msg!=null)
                                            {
                                            %>
                                            <%=msg%>
                                            <%
                                            }
                                        }catch(NullPointerException ne){
                                             response.sendRedirect("acountantStuAdd.jsp");
                                            }

%>
                                    <form action="AddActntServlet" method="post" name="frm">
                                        <table width="100%" cellpadding="2" cellspacing="2" border="0" style="background-color: #f7f7f7;">

                                            <tr style="background-color: #ccffcc;">
                                                <th> Name</th>

                                                <td>
                                                    <input type="text" name="ename" />

                                                </td>
                                            </tr>
                                            <tr style="background-color: #ccffcc;">
                                                <th>Father Name</th>

                                                <td>
                                                    <input type="text" name="efname" />

                                                </td>
                                            </tr>
                                            <tr style="background-color: #ccffcc;">
                                                <th>Date of Birth</th>

                                                <td>
                                                    <input type="text" name="edob" onclick="scwShow(this,event);" onfocus="scwShow(this,event);" />

                                                </td>
                                            </tr>
                                            <tr style="background-color: #ccffcc;">
                                                <th>Address</th>

                                                <td>
                                                    <input type="text" name="eadrs" />

                                                </td>
                                            </tr>
                                             <tr style="background-color: #ccffcc;">
                                                <th>Phone</th>

                                                <td>
                                                    <input type="text" name="ephone" />

                                                </td>
                                            </tr>
                                            <tr style="background-color: #ccffcc;">
                                                <th>Email</th>

                                                <td>
                                                    <input type="text" name="eemail" />

                                                </td>
                                            </tr>
                                            <tr style="background-color: #ccffcc;">
                                                <th>Date of Joining</th>

                                                <td>
                                                    <input type="text" name="edoj" onclick="scwShow(this,event);" onfocus="scwShow(this,event);"/>

                                                </td>
                                            </tr>

                                            <tr style="background-color: #ccffcc;">
                                                <th>login</th>

                                                <td>
                                                    <input type="text" name="elogin" />

                                                </td>
                                            </tr>
                                            <tr style="background-color: #ccffcc;">
                                                <th>Password</th>

                                                <td>
                                                    <input type="text" name="pswd" />

                                                </td>
                                            </tr>



                                            <tr style="background-color: #ccffcc;">

                                                <td colspan="2" align="center">
                                                    <input type="submit" value="Submit" />
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
