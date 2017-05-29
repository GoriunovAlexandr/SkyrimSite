<%-- 
    Document   : error-404
    Created on : Nov 17, 2015, 8:28:47 PM
    Author     : user1
--%>

<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Page Does Not Found!</h1>

        <% response.setHeader("Refresh","3;url=homepage.html"); %>
    </body>
</html>



