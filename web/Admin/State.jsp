<%-- 
    Document   : State
    Created on : 21 Feb, 2024, 5:07:20 PM
    Author     : rinub
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>State</title>
    </head>
    <%
        if (request.getParameter("btn_save") != null) {
            String state = request.getParameter("txt_state");
            String id = request.getParameter("selcountry");
            String insQry = "insert into tbl_state(country_id,state_name)values('" + id + "','" + state + "')";
            con.executeCommand(insQry);
            response.sendRedirect("State.jsp");
        }
        if (request.getParameter("id") != null) {
            String delQry = "delete from tbl_state where state_id='" + request.getParameter("id") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("State.jsp");
        }
    %>


    <body>
        <form name="frmState" method="POST">
            <table border="1">
                <tr>
                    <td>country</td>
                    <td><select name="selcountry" id="selcountry">
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
                    <td><input type="text" name="txt_state"</td>
                </tr>
                <tr colspan="2" align="center">
                    <td colspan="2" align="ceneter"><input type="Submit" value="save" name="btn_save"/></td>
                </tr>
            </table>

        </form>
        <br><br>

        <table border="1">
            <tr>
                <td>Sl.no</td>
                <td>Country</td>
                <td>State</td>
                <td>Action</td>
            </tr>
            <%
                int i = 0;
                String seQry = "select * from tbl_state s inner join tbl_country c on s.country_id=c.country_id";
                ResultSet sr = con.selectCommand(seQry);
                while (sr.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=sr.getString("country_name")%></td>
                <td><%=sr.getString("state_name")%></td>
                <td><a href="State.jsp?id=<%=sr.getString("state_id")%>">Delete</a></td>
            </tr>
            <%
                }
            %>

        </table>
    </body>
</html>
