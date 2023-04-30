
<html>
    <head>
        </head>
    <body>      <form name="frm" action="RegisterServlet" method="post"">
                                    <table width="70%"  align="center" bgcolor="#fyf7f7">
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
                                            </td> </tr>
                                        <tr><td> Name  </td><td> <input type="text" name="name" /> </td></tr><tr>
                                            <td> Father Name</td><td><input type="text" name="fname" /> </td> </tr> <tr>
                                            <td>Address </td><td><input type="text" name="adrs" /></td></tr><tr> <td>
                                                &nbsp;</td><td> <img src="Cap_Img.jsp">&nbsp;&nbsp;
                                                <input type="button" value="Refresh Image" onClick="window.location.href=window.location.href">
                                            </td></tr>
                                         <tr>
                                             <td valign="top">
                                               Please enter the string shown in the image.
                                            </td>
                                            <td>
                                                <input name="code" id="code" type="text" onblur=" checkcode(document.frm.code.value);">
                                                <span id="msgAreaCaptcha"></span>
                                            </td>
                                        </tr>
                                    </table>
                
        </table>


    </body>
</html>
