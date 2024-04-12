<%-- 
    Document   : User
    Created on : 26 Feb, 2024, 11:57:53 AM
    Author     : rinub
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
    </head>
    <body>
        <form method="POST">
            <table border="1">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name"  autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txt_contact" pattern="[+0 -9{10 13}" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txt_address" autocomplete="off" required=""/></td>   
                </tr>
                <tr>
                    <td>Zipcode</td>
                    <td><input type="text" name="" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><input type="radio" name="gender" id="btnmale" value="male"/>Male
                        <input type="radio" name="gender" id="btnfemale" value="female"/>Female
                        <input type="radio" name="gender" id="btnothers" value="others"/>Others
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="file_proof"  required=""/></td>
                </tr>
                <tr>
                    <td>Proof</td>
                    <td><input type="file" name="file_proof"  required=""/></td>
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
                        <select name="selstate" id="selstate" onchange="getDistrict(this.value)">
                            <option value="">---select---</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="#seldistrict" id="seldistrict" onchange="getPlace(this.value)">
                            <option value="">---select---</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td>
                        <select name="selPlace" id="selplace">
                            <option value="">---select---</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txt_pass" id="txt_pass" autocomplete="off" required=""/></td>
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
                        function getDistrict(sid)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxDistrict.jsp?sid=" + sid,
                                success: function(result) {
                                    $("#seldistrict").html(result);

                                }
                            });
                        }
                        function getPlace(did)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                success: function(result) {
                                    $("#selplace").html(result);

                                }
                            });
                        }

        </script>
    </body>

</html>

