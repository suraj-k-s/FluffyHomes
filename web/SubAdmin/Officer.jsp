<%-- 
    Document   : SubAdmin
    Created on : 26 Feb, 2024, 11:56:13 AM
    Author     : rinub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SubAdmin</title>
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
                    <td>Photo</td>
                    <td><input type="file" name="file_proof" required=""/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txt_pass" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Country</td>
                    <td>
                        <select name="selcountry" id="selcountry" onchange="getState(this.value)">
                            <option value="">---select---</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_save" value="save"/></td>
                </tr>
            </table>
        </form>

    </body>
</html>
