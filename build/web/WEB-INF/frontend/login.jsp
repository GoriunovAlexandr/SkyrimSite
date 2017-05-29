<%-- 
    Document   : login
    Created on : Nov 17, 2015, 11:11:24 PM
    Author     : user1
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="my.web.project.login.fb.FBConnection"%>

<%
	FBConnection fbConnection = new FBConnection();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
         <link href="dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="signin.css" rel="stylesheet">
        <script src="dist/assets/js/ie-emulation-modes-warning.js"></script>
    </head>
    <body>
        <div id="wrapper">
        <jsp:include page="common/header.jsp"/>
        
        <div id="login_block">
            <h1>LogIn Page</h1>
            <div
                style="height: 100px; width: 610px;"><%--${pageContext.request.contextPath}  src="./../../dist/img/facebookloginbutton.png"--%>
		<a href="<%=fbConnection.getFBAuthUrl()%>"> <img src="${pageContext.request.contextPath}/dist/img/facebookloginbutton.png" />
		</a>
            </div>
            
            <div>
                <form class="form-signin" action="login_process" method="POST">
                    <label for="inputUsername" class="sr-only">Username</label>
                    <p>Username:  <input type="text" name="NUMEUTILIZATOR" value="" size="10" class="form-control"/>
                    <p>Password:  <input type="password" name="PASSWORD" value="" size="10" class="form-control" />
                        <input type="submit" value="LOGIN" class="btn btn-lg btn-primary btn-block" style="margin-top: 5px;" /><input type="reset"   value="CLEAR" class="btn btn-lg btn-primary btn-block " />
                </form>
            </div>
        </div>
            
        <jsp:include page="common/footer.jsp"/>
        </div>
        <script src="dist/assets/js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
