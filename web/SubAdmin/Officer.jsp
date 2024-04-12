<%-- 
    Document   : Officer
    Created on : 26 Feb, 2024, 11:57:41 AM
    Author     : rinub
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Officer</title>
    </head>
    <body>
        <form method="POST">
            <table border=1>
                <tr> 
                    <td>Name</td>
                    <td><input type="text" name="txt_name" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txt_contact" pattern="[+0 -9{10 13}" autocomplete="off" required=""/></td>
                </tr>        
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txt_email"   required=""/></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txt_address" autocomplete="off" required=""/> </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><input type="radio" name="gender" id="btnmale" value="male"/>Male
                        <input type="radio" name="gender" id="btnfemale" value="female"/>Female
                        <input type="radio" name="gender" id="btnothers" value="others"/>Others
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="file_proof"  required=""/> </td>
                </tr>
                <tr>
                    <td>Country</td>
                    <td>
                        <select name="selcountry" id="selcountry" onchange="getState(this.value)">
                            <option value="">---select---</option>
                            <%
                                String selQry = "select * from tbl_country";
                                ResultSet rs = con.selectCommand(selQry);
                                while (rs.next()) {
                            %>   
                            <option value="<%=rs.getString("country_id")%>">
                                <%=rs.getString("country_name")%>
                            </option> 
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>State</td>
                    <td>
                        <select name="selstate" id="selstate">
                            <option value="">---select---</option>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txt_pass" id="txt_pass" required=""/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_save" value="submit"/></td>
                </tr>

            </table>

        </form>
        <script src="../Assets/JQ/jquery.js"></script>
        <script>
                                function getState(cid)
                                {
                                    $.ajax({
                                        url: "../Assets/AjaxPages/AjaxState.jsp?cid=" + cid,
                                        success: function(result) {
                                            $("#selstate").html(result);

                                        }
                                    });
                                }
        </script>

    </body>

</html>
