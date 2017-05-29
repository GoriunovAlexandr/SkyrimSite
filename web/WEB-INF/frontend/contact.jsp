<%-- 
    Document   : contact
    Created on : Nov 17, 2015, 8:44:44 PM
    Author     : user1
--%>

<%@page import="my.web.project.users.UserConstants"%>
<%@page import="my.web.project.entities.MyUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Page</title>
        <link href="dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
<!--        <link href="signin.css" rel="stylesheet">-->
        <script src="dist/assets/js/ie-emulation-modes-warning.js"></script>
        
        
        
        
        
        
        <link type="text/css" href="${pageContext.request.contextPath}/dist/gallerie/bottom.css" rel="stylesheet" /><!--../../    $ {pageContext.request.contextPath}-->
	<script type="text/javascript" src=" https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<!--        <script type="text/javascript" src="${pageContext.request.contextPath}/dist/gallerie/jquery.jcarousel.min.js"></script>../../-->
		<script type="text/javascript" src="${pageContext.request.contextPath}/dist/gallerie/jquery.pikachoose.min.js"></script><!--../../-->
		<script type="text/javascript" src="${pageContext.request.contextPath}/dist/gallerie/jquery.touchwipe.min.js"></script><!--../../-->
		<script language="javascript">
			$(document).ready(function (){
					$("#pikame").PikaChoose({showTooltips:true});
				});
		</script>

        
        
        

<!--    src="dist/img/map1.jpg"-->

        
        
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
                <jsp:include page="./common/header.jsp"/>

                <% }
                %>


            <div id="contact_page">
                <h1>Contact Page</h1>
                <h1>Developed by Nord's with love for </h1>
                

   
                <div id="gallerie_block">
                    <div class="pikachoose">
                        <ul id="pikame">
                            <li><a href="http://www.pikachoose.com"><img src=".../../dist/gallerie/img/1.jpg"/></a><span>This is an example of the basic theme.</span></li>
                            <li><a href="http://www.pikachoose.com"><img src=".../../dist/gallerie/img/2.jpg"/></a><span>jCarousel is supported and can be integrated with PikaChoose!</span></li>
                            <li><a href="http://www.pikachoose.com"><img src=".../../dist/gallerie/img/3.jpg"/></a><span>Be sure to check out  for updates.</span></li>
                            <li><a href="http://www.pikachoose.com"><img src=".../../dist/gallerie/img/1.jpg"/></a><span>This is an example of the basic theme.</span></li>
                            <li><a href="http://www.pikachoose.com"><img src=".../../dist/gallerie/img/2.jpg"/></a><span>jCarousel is supported and can be integrated with PikaChoose!</span></li>
                            <li><a href="http://www.pikachoose.com"><img src=".../../dist/gallerie/img/3.jpg"/></a><span>Be sure to check out for updates.</span></li>
                        </ul>
                    </div>
                </div>
 
            </div>

        <jsp:include page="common/footer.jsp"/>
        </div>
    </body>
</html>
