<%-- 
    Document   : newstaff
    Created on : May 31, 2017, 8:33:00 AM
    Author     : Hung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Staff</title>
    </head>
    <body>
        <h1>Create Staff</h1>
        <form action="create-staff.htm" method="POST" enctype="multipart/form-data">
            <fieldset>
                <legend>Create Staff</legend>
            Name: <input type="text" name="txtName"/><br />
            Gender: <select name="gender">
                <option value="x">Nam</option>
                <option value="y">Nữ</option>
            </select><br />
            Birthday: <input type="date" name="txtDate"/><br />
            Photo: <input type="file" name="txtPhoto"/><br />
            Email: <input type="email" name="txtEmail"/><br />
            Phone: <input type="tel" name="txtPhone"/><br />
            Salary: <input type="number" name="txtSalary"/><br />
            Notes: <input type="text" name="txtNote"/><br />
            <input type="submit" name="btnsubmit" value="Login"/>
            </fieldset>
        </form>
    </body>
</html>
