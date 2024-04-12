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
        if(request.getParameter("btn_save")!=null)
        {
             String country=request.getParameter("txt_country");
             String insQry="insert into tbl_country(country_name)values('"+country+"')";
            con.executeCommand(insQry);
            response.sendRedirect("Country.jsp");
        }
        if(request.getParameter("id")!=null)
        {
            String delQry="delete from tbl_country where country_id='"+request.getParameter("id")+"'";
            con.executeCommand(delQry);
            response.sendRedirect("Country.jsp");
        }
    %>
      
       
    <body>
        <form method="POST">
            <table border="1">
                <tr>
                    <td> country</td>
                    <td> <input type="text" name="txt_country" place holder="enter country" required=""</td>
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
                    <td>Country</td>
                    <td>Action</td>
                </tr>
              <%
                int i=0;
                String selQry="select * from tbl_country";
                ResultSet rs=con.selectCommand(selQry);
                while(rs.next())
                {
                  i++;
                   %>
                   <tr>
                       <td><%=i%></td>
                       <td><%=rs.getString("country_name")%></td>
                       <td><a href="Country.jsp?id=<%=rs.getString("country_id")%>">Delete</a></td>
                  </tr>
        <%
                }
        %>
            
            </table>
        </form>
    </body>
</html>
