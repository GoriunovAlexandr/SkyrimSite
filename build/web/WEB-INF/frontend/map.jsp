<%-- 
    Document   : map
    Created on : Nov 17, 2015, 8:45:20 PM
    Author     : user1
--%>

<%@page import="my.web.project.users.UserConstants"%>
<%@page import="my.web.project.entities.MyUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="my.web.project.entities.Comment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Map Page</title>
        <link href="dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="signin.css" rel="stylesheet">
        <link rel="stylesheet" href="dist/css/style.css">
        <script src="dist/assets/js/ie-emulation-modes-warning.js"></script>
    </head>
    <body>
        <div id="wrapper">
        <%MyUser user = (MyUser) session.getAttribute(UserConstants.CMSUSER);

                    if (user != null) {
                %>

                <jsp:include page="./user/common/header.jsp"/>

                <%
                } else {
                %>
                <jsp:include page="common/header.jsp"/>

                <% }
                %>
        <div id="map_page">
            <h1>Map Page</h1>
                <img src="dist/img/map1.jpg" alt="imageName1" width="1000" /> 

           </div>
           <jsp:include page="common/footer.jsp"/>
        </div>
        
    </body>
</html>
