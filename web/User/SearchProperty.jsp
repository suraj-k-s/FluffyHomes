<%-- 
    Document   : Place
    Created on : 1 Feb, 2024, 4:49:15 PM
    Author     : abhis
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="Head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Property </title>
        <%
        if (request.getParameter("id") != null) {

            String ins = "INSERT INTO `tbl_rentbook` (`booked_date`, `rent_id`, `user_id`) VALUES (curdate(),'"+request.getParameter("id")+"','"+session.getAttribute("uid")+"')";
            if (con.executeCommand(ins)) {
                %>
                <script>
                    alert("Request Sended");
                    window.location='SearchProperty.jsp';
                </script>
                <%

            }
        }


    %>
    </head>
    <body>
        <form method="post">
            <table border="1">

                <tr>
                    <td>Country</td>
                    <td>
                        <select name="selcountry" id="selcountry" required="" onchange="getState(this.value)">
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

                    <td>State</td>
                    <td>
                        <select name="selstate" id="selstate" required onchange="getDistrict(this.value)">
                            <option value="">---select---</option>
                        </select>
                    </td>

                    <td>District</td>
                    <td>
                        <select name="seldistrict" id="seldistrict" required onchange="getPlace(this.value)">
                            <option value="">---select---</option>
                        </select>
                    </td>

                    <td>Place</td>
                    <td>
                        <select name="selPlace" id="selplace" required>
                            <option value="">---select---</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <input type="submit" name="btn_save">
                    </td>
                </tr>
            </table>
        </form>

        <%

        %>




        <table  align="center">


            <tr>
                <%                String seQry = "select * from tbl_rent ";

                    if (request.getParameter("btn_save") != null) {
                        String plid = request.getParameter("selPlace");

                        seQry += " where place_id='" + plid + "'";

                    }
                    int i = 0;

                    ResultSet rr = con.selectCommand(seQry);
                    while (rr.next()) {
                        i++;


                %>

                <td style="border: 1px solid black;padding: 10px" >

                    <table style="margin: 10px">
                        <tr>
                            <td><img src="../Assets/Files/<%=rr.getString("rent_image")%>" width="120" height="120" style="border-radius: 50%"></td>

                        </tr>
                        <tr>
                            <td align="center"><%=rr.getString("rent_name")%></td>
                        </tr>
                        <tr>

                            <td align="center">
                                <a href="SearchProperty.jsp?id=<%=rr.getString("rent_id")%>">Send Request</a>
                            </td>
                        </tr>
                    </table>
                </td>
                <%
                        if (i == 3) {
                            i = 0;
                            out.println("</tr><tr>");
                        }

                    }
                %>

            </tr>
        </table>
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
    <%@include file="Foot.jsp" %>


</html>