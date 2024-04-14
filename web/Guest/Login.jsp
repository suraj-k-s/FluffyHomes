<%-- 
    Document   : Login
    Created on : 26 Feb, 2024, 11:58:11 AM
    Author     : rinub
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        if (request.getParameter("btn_login") != null) {
            String email = request.getParameter("txt_email");
            String password = request.getParameter("txt_password");

            String selAdmin = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "'";
            ResultSet rsAdmin = con.selectCommand(selAdmin);

            String selSubadmin = "select * from tbl_subadmin where subadmin_email='" + email + "' and subadmin_password='" + password + "'";
            ResultSet rsSubadmin = con.selectCommand(selSubadmin);

            String selOfficer = "select * from tbl_officer where officer_email='" + email + "' and officer_password='" + password + "'";
            ResultSet rsOfficer = con.selectCommand(selOfficer);

            String selOwner = "select * from tbl_owner where owner_email='" + email + "' and owner_password='" + password + "'";
            ResultSet rsOwner = con.selectCommand(selOwner);

            String selUser = "select * from tbl_user where user_email='" + email + "' and user_password='" + password + "'";
            ResultSet rsUser = con.selectCommand(selUser);

            if (rsAdmin.next()) {
                session.setAttribute("aid", rsAdmin.getString("admin_id"));
                session.setAttribute("aname", rsAdmin.getString("admin_name"));
                response.sendRedirect("../Admin/HomePage.jsp");

            } else if (rsSubadmin.next()) {
                session.setAttribute("sid", rsSubadmin.getString("subadmin_id"));
                session.setAttribute("sname", rsSubadmin.getString("subadmin_name"));
                session.setAttribute("country", rsSubadmin.getString("country_id"));
                response.sendRedirect("../SubAdmin/HomePage.jsp");

            } 
            else if (rsOfficer.next()) {
                session.setAttribute("ofid", rsOfficer.getString("officer_id"));
                session.setAttribute("ofname", rsOfficer.getString("officer_name"));
                session.setAttribute("state", rsOfficer.getString("state_id"));
                response.sendRedirect("../Officer/HomePage.jsp");

            }
            else if (rsOwner.next()) {
                session.setAttribute("oid", rsOwner.getString("owner_id"));
                session.setAttribute("oname", rsOwner.getString("owner_name"));
                response.sendRedirect("../Owner/HomePage.jsp");

            }
            else if (rsUser.next()) {
                session.setAttribute("uid", rsUser.getString("user_id"));
                session.setAttribute("uname", rsUser.getString("user_name"));
                response.sendRedirect("../User/HomePage.jsp");

            }else {
    %>
    <script>
        alert("Invalid Credentials");
        window.location = "Login.jsp";
    </script>
    <%
            }
        }
    %>
    <%@include file="Head.jsp" %>
    <body>
        <h2>Login</h2>
        <form name="frmLogin" method="post">
            <table border="1">
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txt_email" id="txt_email" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txt_password" id="txt_password" autocomplete="off" required=""/></td>

                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_login" value="login"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>
