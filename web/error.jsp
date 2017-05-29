<%-- 
    Document   : error
    Created on : Oct 6, 2015, Oct 6, 2015 7:58:44 PM
    Author     : iucosoftmain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>Error Page</title>
    </head>
    <body>
       <%
         
        String backpage="homepage.html";
        String moveback = (String)request.getAttribute("moveback");
        if(moveback!=null){
            backpage=moveback;
        }
        
        
        %>    
             
        <% response.setHeader("Refresh", "3;url="+backpage); %>

        <h1>HTML ERROR!</h1>
        <div style="color: red;" > 
           <%=request.getAttribute("error") %>
        </div>
        <p> you will be redirected in 3 sec...
        
        
            
    </body>
</html>
