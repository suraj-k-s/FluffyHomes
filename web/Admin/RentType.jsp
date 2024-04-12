<%-- 
    Document   : Country
    Created on : 21 Feb, 2024, 5:06:45 PM
    Author     : rinub
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <%
        if (request.getParameter("btn_save") != null) {
            String renttype = request.getParameter("txt_renttype");
            String insQry = "insert into tbl_renttype(renttype_name)values('" + renttype + "')";
            con.executeCommand(insQry);
            response.sendRedirect("RentType.jsp");
        }
        if (request.getParameter("id") != null) {
            String delQry = "delete from tbl_renttype where renttype_id='" + request.getParameter("id") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("RentType.jsp");
        }
    %>


    <body>
        <form method="POST">
            <table border="1">
                <tr>
                    <td> Rent Type</td>
                    <td> <input type="text" name="txt_renttype" place holder="enter renttype" required=""</td>
                </tr>
                <tr > 
                    <td colspan="2" align="center">

                        <input type="submit" value="save" name="btn_save"/>

                    </td>
            </table>
            <br>
            <br>
            <table border="1">
                <tr>
                    <td>Slno</td>
                    <td>Rent Type</td>
                    <td>Action</td>
                </tr>
                <%
                    int i = 0;
                    String selQry = "select * from tbl_renttype";
                    ResultSet rs = con.selectCommand(selQry);
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("renttype_name")%></td>
                    <td><a href="RentType.jsp?id=<%=rs.getString("renttype_id")%>">Delete</a></td>
                </tr>
                <%
                    }
                %>

            </table>
        </form>
    </body>
</html>

</head>
<body>
    <h1>Hello World!</h1>
</body>
</html>
