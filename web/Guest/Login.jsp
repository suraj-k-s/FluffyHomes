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
            String pass = request.getParameter("txt_pass");
            String selOwner = "select * from tbl_owner where owner_email='" + email + "' and owner_password='" + pass + "'";
            ResultSet rsowner = con.selectCommand(selOwner);

            if (rsowner.next()) {
                session.setAttribute("oid", rsowner.getString("owner_id"));
                session.setAttribute("oname", rsowner.getString("owner_name"));
                response.sendRedirect("../Owner/HomePage.jsp");

            } else {
    %>
    }
    <script>

        alert("Invalid Credentials");
        window.location = "Login.jsp";
    </script>
    <%
            }
        }
    %>

    <body>
        <form name="frmLogin" method="post">
            <table border="1">
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txt_email" id="txt_email" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txt_pass" id="txt_pass" autocomplete="off" required=""/></td>

                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_login" value="login"/>
                </tr>

                </td>

            </table>
        </form>
    <body>

    </body>
</html>

<body>

</body>
</html>
