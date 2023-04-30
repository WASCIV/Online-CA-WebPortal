

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page </title>
        <script type="text/javascript" language="java" src="js/validateregistrationpage.js"></script>


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
        <script type="text/javascript" src="js/clndr/scw.js" ></script>
        <script type="text/javascript" src="js/validateuserid.js"></script>
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
                                <form name="frm" action="RegisterServlet" method="post" onSubmit="return validate();">
                                    <table width="70%"  align="center" bgcolor="#fyf7f7">
                                        <tr>
                                            <td colspan="2" style="font-size: 16px;">
                                                <br>
                                                <b>  Registration</b><span style="float: right">
                                                    <span style="float: right">
                                                        <%
                                                            try {
                                                                String msg = request.getParameter("msg");
                                                                if (msg != null) {
                                                        %>
                                                        <%=msg%>
                                                        <%
                                                                }
                                                            } catch (Exception e) {

                                                                System.out.println(e);
                                                            }

                                                        %>
                                                    </span>

                                                </span>
                                                <div align="center" style="background-color: #d7d7d7;font-size: 12px;color: #f7941d">
                                                    ** Only Client & Student can get registration through this page
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Select User Category
                                            </td>
                                            <td>
                                                <select name="utype" id="utype" style="width: 145px;">
                                                    <option value=""></option>
                                                    <option value="client">Client</option>
                                                    <option value="stu">Student</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Name
                                            </td>
                                            <td>
                                                <input type="text" name="name" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Father Name
                                            </td>
                                            <td>
                                                <input type="text" name="fname" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Address
                                            </td>
                                            <td>
                                                <input type="text" name="adrs" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Date of Birth
                                            </td>
                                            <td>
                                                <input type="text" name="dob" onclick="scwShow(this,event);" onfocus="scwShow(this,event);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Mobile
                                            </td>
                                            <td>
                                                <input type="text" name="mob" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                E-mail
                                            </td>
                                            <td>
                                                <input type="text" name="email" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Login
                                            </td>
                                            <td>
                                                <input type="text" name="login" id="usrlogin" onblur="validateUId();"/><span id="msgArea"></span>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <img src="Cap_Img.jsp">&nbsp;&nbsp;
                                                <input type="button" value="Refresh Image" onClick="window.location.href=window.location.href">
                                            </td>
                                        </tr>
                                         <tr>
                                             <td valign="top">
                                               Please enter the string shown in the image.
                                            </td>
                                            <td>
                                                <input name="code" id="code" type="text" onblur=" checkcode(document.frm.code.value);"><span id="msgAreaCaptcha"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Password
                                            </td>
                                            <td>
                                                <input type="password" name="pswd" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Retype Password
                                            </td>
                                            <td>
                                                <input type="password" name="rpswd" />
                                            </td>
                                        </tr>
                                       
                                        <tr>
                                            <td colspan="2">
                                                &nbsp;
                                            </td>

                                        </tr>
                                        <tr>

                                            <td align="right" colspan="2">
                                                <input type="reset" value="Clear" />&nbsp;&nbsp;
                                                <input type="submit" value="Submit" id="submit"/>
                                            </td>
                                        </tr>
                                    </table>
                                </form>

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
