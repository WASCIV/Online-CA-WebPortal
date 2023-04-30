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
        <title>Acountant----------- Home</title>
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
        <script type="text/javascript">
            function totalsal(){
                //alert("   ");
                var basic= document.frm.basic.value;
                var ta=document.frm.ta.value;
                var da=document.frm.da.value;
                var other=document.frm.other.value;
                var tdate=parseFloat(basic)+parseFloat(ta)+parseFloat(da)+parseFloat(other);
            
                document.frm.total.value=tdate;
                //alert(diff+1);
                return;
            }

        </script>
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
                                    <b>    Welcome Acountant !   <%=aname%></b>
                                </div>
                                <div style="font-size: 16px;color: #ffffff; float: right">
                                    <b>   <a href="AcountantLogOut" style="text-decoration: none;color: #ffffff;">Log Out&nbsp;&nbsp;</a></b>
                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td width="950px"  valign="top">

                                <div style="width: 200px; float: left;background-color: #f7f7f7">
                                    <div id="menu">

                                        <ul>
                                            <li><a href="acountantHome.jsp"><span>Home</span></a></li>
                                            <li><a href="acountantEmpSalary.jsp"><span>View Salary List</span></a></li>
                                            <li><a href="acountantEmpSalAdd.jsp"><span>Issue Salary</span></a></li>
                                            <li><a href="acountantStuFee.jsp"><span>View Fee List</span></a></li>
                                            <li><a href="acountantStuAdd.jsp"><span>Issue Fee</span></a></li>
                                            <li><a href="#"><span>&nbsp;</span></a></li>
                                            <li><a href="#"><span>&nbsp;</span></a></li>
                                            <li><a href="#"><span>&nbsp;</span></a></li>
                                        </ul>

                                    </div>
                                </div>

                                <div style="width: 750px; float: left;">
                                    <h1 style="color: #999999">
                                        Issue Salary
                                    </h1>
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
                                             response.sendRedirect("acountantEmpSalAdd.jsp");
                                            }

%>
                                    <form action="EmpSalAddServlet" method="post" name="frm">
                                        <table width="100%" cellpadding="2" cellspacing="2" border="0">

                                            <tr style="background-color: #ccffcc;">
                                                <th>Employee ID</th>

                                                <td>
                                                    <select style="width:100px;" name="empid">
                                                        <option value="">Select ID</option>
                                                        <%
                                                                    DbConnection db = null;
                                                                    try {
                                                                        db = new DbConnection();
                                                                        db.rst = db.stmt.executeQuery("select empid from emp_mstr ");
                                                                        while (db.rst.next()) {
                                                        %>
                                                        <option value="<%=db.rst.getString(1)%>"><%=db.rst.getString(1)%></option>
                                                        <%
                                                                        }
                                                                    } catch (Exception e) {
                                                                        System.out.println(e);
                                                                    }
                                                        %>

                                                    </select>

                                                </td>
                                            </tr>

                                            <tr>
                                                <th>
                                                    Basic
                                                </th>
                                                <td>
                                                    <input type="text" name="basic" />
                                                </td>
                                            </tr>

                                            <tr>
                                                <th>
                                                    TA
                                                </th>
                                                <td>
                                                    <input type="text" name="ta" />
                                                </td>
                                            </tr>

                                            <tr>
                                                <th>
                                                    DA
                                                </th>
                                                <td>
                                                    <input type="text" name="da" />
                                                </td>
                                            </tr>

                                            <tr>
                                                <th>
                                                    Other
                                                </th>
                                                <td>
                                                    <input type="text" name="other" onblur=" totalsal();"/>
                                                </td>
                                            </tr>

                                            <tr>
                                                <th>
                                                    Total
                                                </th>
                                                <td>
                                                    <input type="text" name="total" readonly  />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    Month
                                                </th>
                                                <td>
                                                    <select name="month">
                                                        <option value="" >Select Month</option>
                                                        <option value="January">January</option>
                                                        <option value="February">February</option>
                                                        <option value="March">March</option>
                                                        <option value="April">April</option>
                                                        <option value="May">May</option>
                                                        <option value="Jun">Jun</option>
                                                        <option value="July">July</option>
                                                        <option value="August">August</option>
                                                        <option value="September">September</option>
                                                        <option value="October">October</option>
                                                        <option value="November">November</option>
                                                        <option value="December">December</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    Issue Date
                                                </th>
                                                <td>
                                                    <input type="text" name="idate" onclick="scwShow(this,event);" onfocus="scwShow(this,event);" />
                                                </td>
                                            </tr>
                                            <tr>

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
