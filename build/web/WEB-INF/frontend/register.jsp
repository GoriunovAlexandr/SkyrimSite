<%-- 
    Document   : register
    Created on : Nov 17, 2015, 11:14:49 PM
    Author     : user1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link href="dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="signin.css" rel="stylesheet">
        <script src="dist/assets/js/ie-emulation-modes-warning.js"></script>
    </head>
    <body>
        <div id="wrapper">
        <jsp:include page="common/header.jsp"/>
        
        <div id="register_block">
            <h1>Register Page</h1>

            <form action="registration_process" class="form-signin" method="POST">
                <p>User Name:   <input type="text" name="NIK_USER" class="form-control" value="" size="10"/>
                <p>First Name:  <input type="text" name="NAME_USER" class="form-control" value="" size="10"/>
                <p>Last Name:  <input type="text" name="LASTNAME_USER" value="" class="form-control" size="10"/>
                <p>Email:      <input type="text" name="EMAIL_USER" value="" class="form-control" size="20"/>
                <p>Password:   <input type="password" name="PASSWORD1" value="" class="form-control" size="10" />
                <p>Confirm Password:  <input type="password" name="PASSWORD2" value=""  class="form-control" size="10" />
                <input type="submit" value="REGISTER" class="btn btn-lg btn-primary btn-block" style="margin-top: 5px;"/><input type="reset" value="CLEAR" class="btn btn-lg btn-primary btn-block"/>
            </form>
            </div>
        
        <jsp:include page="common/footer.jsp"/>
        </div>
    </body>
</html>
