
<jsp:useBean class="DB.ConnectionClass" id="ep"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <%
            String selqry="select * from tbl_owner where owner_id='"+session.getAttribute("oid")+"' ";
            ResultSet s1=ep.selectCommand(selqry);
            s1.next();
            if(request.getParameter("txt_update")!=null){
                String up="Update tbl_owner set owner_name='"+request.getParameter("txt_name")+"',owner_address='"+request.getParameter("txt_address")+"',"
                        + "owner_contact='"+request.getParameter("txt_contact")+"',owner_email='"+request.getParameter("txt_email")+"' where owner_id='"+session.getAttribute("oid")+"' ";
              if(ep.executeCommand(up)){
                  %>
                  <script>
                      alert("Updated");
                      window.location="MyProfile.jsp";
                  </script>
                  <%
              }
            }
            
        
        %>
        <form method="post" action="">
            <table border="2"  align="center">
                
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" value="<%=s1.getString("owner_name") %>"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txt_address" value="<%=s1.getString("owner_address")%>"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                     <td><input type="text" name="txt_contact" value="<%=s1.getString("owner_contact")%>"></td>
                </tr>
                 <tr>
                     <td>Email</td>
                     <td><input type="text" name="txt_email" value="<%=s1.getString("owner_email")%>"></td>
                     
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="txt_update" value="Update"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
   <%@include file="Foot.jsp" %>