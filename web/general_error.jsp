<%-- 
    Document   : general_error
    Created on : Nov 17, 2015, 8:29:20 PM
    Author     : user1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Refresh" content="3;url=home.html">
        <title>Error Page</title>
    </head>
    <body>
        <h1>Error Page! </h1>
        <div style="color:red;">
        <%=request.getAttribute("error")   %>
        </div>
        
        <p> You will be redirected in 3 sec...
    </body>
</html>