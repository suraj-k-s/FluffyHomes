<%-- 
    Document   : Country
    Created on : May 5, 2021, 2:10:22 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Country</title>
        
        <%@include file="Header.jsp" %>
    </head>

    <%        String id = "", name = "", dis = "";

        if (request.getParameter("edit") != null) {

            id = request.getParameter("edit");
            name = request.getParameter("name");

        }

        if (request.getParameter("btn_save") != null) {

            if (request.getParameter("hid").equals("")) {
                String insQry = "insert into tbl_country(country_name)values('" + request.getParameter("txt_country") + "')";
                con.executeCommand(insQry);
                response.sendRedirect("Country.jsp");
            } else {
                String upQry = "update tbl_country set country_name='" + request.getParameter("txt_country") + "' where country_id='" + request.getParameter("hid") + "'";
                con.executeCommand(upQry);
                System.out.println(upQry);
                response.sendRedirect("Country.jsp");
            }
        }

        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_country where country_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Country.jsp");
        }


    %>
    <body>


        <section class="main_content dashboard_part">

            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="QA_section">
                                <!--Form-->
                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Table Country</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="txt_country">Country Name</label>
                                                    <input required="" type="text" class="form-control" value="<%=name%>" id="txt_country" name="txt_country">
                                                    <input type="hidden" name="hid" value="<%=id%>">
                                                </div>
                                                    <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" name="btn_save" style="width:100px; border-radius: 10px 5px " value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Country</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_country ";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>    
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("country_name")%></td>
                                                <td align="center"> 
                                                    <a href="Country.jsp?del=<%=rs.getString("country_id")%>" class="status_btn">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp; 
                                                    <a class="status_btn" href="Country.jsp?edit=<%=rs.getString("country_id")%>&name=<%=rs.getString("country_name")%>">Edit</a>
                                                </td> 
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </body>
    <%@include file="Footer.jsp" %>
</html>
