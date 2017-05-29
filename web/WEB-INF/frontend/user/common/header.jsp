<%-- 
    Document   : header
    Created on : Nov 17, 2015, 8:34:02 PM
    Author     : user1
--%>
<link rel="stylesheet" href="dist/css/style.css">


<%@page import="my.web.project.users.UserConstants"%>
<%@page import="my.web.project.entities.MyUser"%>

<div id="header">
    <div id="logo"><a href="homepage"> <img src="./dist/img/Logo1.png" alt="Logo" height="150" width="75"/>  </a> </div>
    <div class="menu">
    <a href="homepage"> HOME |</a>
    <a href="map"> MAP |</a>
    <a href="contact"> CONTACT |</a>
    <a href="logout"> LogOut |</a>
    <a href="changeprofile"> Change Profile |</a>
    <div style="color: orange; display: block; float: right; margin-right: 10px;">
    <%MyUser user = (MyUser)session.getAttribute(UserConstants.CMSUSER);
        MyUser adminUser = (MyUser)session.getAttribute(UserConstants.CMSADMIN);
            if(user != null){
                int userid=user.getId();
                String username= user.getUsername();
                switch(userid){
                    case 1:%> Hello, <%=user.getNikuser()%>! <img src="userimages/imageName1.jpg" alt="imageName1" height="50" width="50"/> <%break;
                    case 2:%> Hello, <%=user.getNikuser() %>! <img src="userimages/imageName2.jpg" alt="imageName2" height="50" width="50"/> <%break; 
                    case 3:%> Hello, <%=user.getNikuser() %>! <img src="userimages/imageName3.jpg" alt="imageName3" height="50" width="50"/> <%break; 
                    case 4:%> Hello, <%=user.getNikuser() %>! <img src="userimages/imageName4.jpg" alt="imageName4" height="50" width="50"/> <%break; 
                    case 5:%> Hello, <%=user.getNikuser() %>! <img src="userimages/imageName5.jpg" alt="imageName5" height="50" width="50"/> <%break; 
                
                    default:%>Hello, <%=user.getNikuser() %><%
                }
            }else{%>
                Hello, <%=adminUser.getNikuser() %>! 
            <%}%>
    </div>
    </div>
</div>