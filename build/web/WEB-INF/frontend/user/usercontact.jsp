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
        <title>Contact Page</title>
        <link href="dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="signin.css" rel="stylesheet">
        <script src="dist/assets/js/ie-emulation-modes-warning.js"></script>
    </head>
    <body>
        
        <jsp:include page="common/header.jsp"/>
        <div id="wrapper">
            <h1>ContactS</h1>
            <p><%= request.getAttribute("pageText") %>

                <%List<Comment> com = new ArrayList();
                MyUser user = (MyUser)session.getAttribute(UserConstants.CMSUSER);
                com = (List<Comment> ) request.getAttribute("comment");
                if(com == null){
                    %><p>No comments for this Page</p><%
                }else{/*(com.size() > 0)*/
                        Comment showcomment = null;
                        for (int i = 0; i < com.size(); i++) {
                            showcomment = com.get(i);
                        %>
                        <div>
                            <p><%=showcomment.getComment()%></p>
                            <p><%=showcomment.getUserName()%></p>
                            <%if(user != null){%>
                            <p>Likes:   <a href="incrementLike?id=<%=showcomment.getId()%>">  <%=showcomment.getLike()%>   </a> </p>
                            <%}else{%>
                                <p><%=showcomment.getLike()%></p>
                                <%}%>
                            <hr/>
                        </div><br>      
                            <%
                    }
                %> 
                    <%
                    }
           %> 
        </div>
        <jsp:include page="common/footer.jsp"/>
    </body>
</html>

