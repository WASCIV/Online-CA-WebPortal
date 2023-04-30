<%-- 
    Document   : index
    Created on : Mar 28, 2013, 12:16:37 PM
    Author     : chandan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            body{
                font-family: Courier New, Courier, monospace;
                font-size: 12px;
            }

            #menu ul,#menu li { margin:0; padding:0; }
            #menu li {list-style:none;float:left;}

            #menu a { display:block;margin:0 auto;color:#fff;text-decoration:none; background:url(images/_right.png) right top no-repeat;}

            #menu a span { display:block;text-align:center;background:url(images/_left.png) left top no-repeat; font:bold 12px/30px Arial, Helvetica, sans-serif;  padding:0 20px; }

            #menu a:hover { background-position:right bottom;text-decoration:underline}
            #menu a:hover span { background-position:left bottom;  }</style>
        <script type="text/javascript">
            function validate()
            {
                if(document.frm.login.value=="")
                {
                    alert("Please enter Login");
                    document.frm.login.focus();
                    return false;
                }
                if(document.frm.pswd.value==0)
                {
                    alert("Please Enter  Password");
                    document.frm.pswd.focus();
                    return false;
                }

                return true;
            }
            function frgtvalidate()
            {
                if(document.frmfrgt.utype.selectedIndex==0)
                {
                    alert("Please Select User  Type");
                    document.frmfrgt.utype.focus();
                    return false;
                }
            
                if(document.frmfrgt.login.value=="")
                {
                    alert("Please enter Login");
                    document.frmfrgt.login.focus();
                    return false;
                }
                if(document.frmfrgt.dob.value==0)
                {
                    alert("Please Enter Your Date fof Birth");
                    document.frmfrgt.dob.focus();
                    return false;
                }

                return true;
            }
        </script>
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
                            <td width="950px" bgcolor="#296dc1">
                                <div id="menu">

                                    <ul>
                                        <li><a href="index.jsp"><span>Home</span></a></li>
                                        <li><a href=""><span>About Us</span></a></li>
                                        <li><a href="registration.jsp"><span>Registration</span></a></li>
                                        <li><a href=""><span>Contact us</span></a></li>
                                    </ul>

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="950px" height="250px" valign="top">

                                <div style="width: 300px;height: 250px; float: left;background-color: #f7f7f7">
                                    <form action="LoginServlet" method="post" name="frm" onSubmit="return validate();">
                                        <table width="300px">

                                            <tr>

                                                <th colspan="2" style="color: #296dc1;font-size: 16px;" align="left">
                                                    <br>
                                                    Login Panel
                                                    <hr size="1" width="100%" style="color: #296dc1;" />
                                                </th>
                                            <tr>
                                                <td width="50%">


                                                    <input type="radio" value="admin" name="utype" checked>Admin


                                                </td>

                                                <td width="50%">



                                                    <input type="radio" value="client" name="utype">Client

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="radio" value="emp" name="utype">Employee
                                                </td>
                                                <td>
                                                    <input type="radio" value="stu" name="utype">Student
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="radio" value="to" name="utype">Training Officer<br>
                                                </td>
                                                <td>
                                                    <input type="radio" value="actnt" name="utype">Accountant


                                                </td>
                                            </tr>

                                            <tr>
                                                <td colspan="2">
                                                    &nbsp;
                                                    <span style="float: right;color: #ff3300;">
                                                        <%
                                                            try {
                                                                String error = request.getParameter("error");
                                                                if (error != null) {
                                                        %>
                                                        <%=error%>
                                                        <%
                                                                }
                                                            } catch (Exception e) {

                                                                System.out.println(e);
                                                            }

                                                        %>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>

                                                <th>
                                                    Login
                                                </th>
                                                <td>
                                                    <input type="text" name="login" />
                                                </td>
                                            </tr>
                                            <tr>

                                                <th>
                                                    Password
                                                </th>
                                                <td>
                                                    <input type="password" name="pswd" />
                                                </td>
                                            </tr>
                                            <tr>


                                                <td colspan="2" align="right">
                                                    <a href="ForgotPswd.jsp">Forgot Password</a>
                                                    <input type="submit" value="Login" />&nbsp;
                                                    <input type="reset" value="Clear" />
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>

                                <div style="width: 650px;height: 250px; float: left;">
                                    <h1 style="color: #999999">
                                        Forgot Password
                                    </h1>
                                    <%
                                        try {
                                            String frgterr = request.getParameter("frgterr");
                                           String pswd = request.getParameter("pswd");
                                            if (frgterr != null) {
                                    %>
                                    <span style="color: #ff3300;font-size: 14px;"> Given Record is not exist</span>
                                    <%
                                            }if (pswd != null) {
                                    %>
                                    <span style="color: #296dc1;font-size: 14px;">Your Password is <b> <%=pswd%></b></span>
                                    <%
                                            }
                                        } catch (Exception e) {

                                            System.out.println(e);
                                        }

                                    %>
                                    <form action="ForgotPswdServlet" method="post" name="frmfrgt" onSubmit="return frgtvalidate();">
                                        <table width="70%" align="center" bgcolor="#f7f7f7">
                                            <tr>
                                                <td>
                                                    Select User Type
                                                </td>
                                                <td>
                                                    <select name="utype">
                                                        <option value=""></option>
                                                        <option value="clnt">Client</option>
                                                        <option value="stu">Student</option>
                                                        <option value="emp">Employee</option>
                                                        <option value="acnt">Accountant</option>
                                                        <option value="to">Training Officer </option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Enter your login id
                                                </td>
                                                <td>
                                                    <input type="text" name="login" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Enter your date of birth
                                                </td>
                                                <td>
                                                    <input type="text" name="dob" /><span style="font-size: 11px;">(YYYY-MM-DD)</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <input type="reset" value="Clear.." />
                                                </td>
                                                <td>
                                                    <input type="submit" value="Get Password !" />
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
