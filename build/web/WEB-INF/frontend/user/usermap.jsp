<%@page import="my.web.project.users.MyFileUtil"%>
<%@page import="my.web.project.users.UserConstants"%>
<%@page import="my.web.project.entities.MyUser"%>
<%@page import="my.web.project.entities.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER MAP Page</title>
        <script src="//cdn.ckeditor.com/4.5.4/standard/ckeditor.js"></script>
    </head>
    <body>
        <jsp:include page="common/header.jsp"/>
      <!-- <img src="userimages/imageName3.jpg" alt="imageName3" />-->

        <h1>Hello ${userName}</h1> 
        <%MyUser user = (MyUser)session.getAttribute(UserConstants.CMSUSER);
            int userid=user.getId();
            switch(userid){
                case 1:%>  <img src="userimages/imageName1.jpg" alt="imageName1" height="50" width="50"/> <%break;
                case 2:%>  <img src="userimages/imageName2.jpg" alt="imageName2" height="50" width="50"/> <%break; 
                case 3:%>  <img src="userimages/imageName3.jpg" alt="imageName3" height="50" width="50"/> <%break; 
                case 4:%>  <img src="userimages/imageName4.jpg" alt="imageName4" height="50" width="50"/> <%break; 
                case 5:%>  <img src="userimages/imageName5.jpg" alt="imageName5" height="50" width="50"/> <%break; 

        }%>
       
        <br>
        
        <%
           // MyUser user = new MyUser();
        
        String homepage = "userhome";
        session.setAttribute("page", homepage);
        //user = (MyUser) session.getAttribute("userName");
        
        int id = user.getId();
        String UserName = user.getNikuser();
        %>
        
        <a href="changeprofile?id=<%=user.getId()%>">  Change Profile </a>
        
            <%List<Comment> com = new ArrayList();
            com = (List<Comment> ) request.getAttribute("comment");
                //if(request.getAttribute("pageText")   != null){
                    //request.getAttribute("pageText");//}
                /*else{
                     
                }*/
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
                        <p>Likes:   <a href="incrementLike?id=<%=showcomment.getId()%>">  <%=showcomment.getLike()%>   </a> </p>
                        <hr/>
                    </div><br>      
                        <%
                }
            %> 
                <%
                }
       %> 
        
        
        
        <form action="savecomment" method="POST">
            
        <p>
            <textarea id="editor1" name="TEXTPAGE" rows="4" cols="20"><%=request.getAttribute("leaveComment") %></textarea>
        </p>
        <input type="hidden" name="PAGENAME" value="MAP"/>
        <input type="submit" value="SAVE" />
        
        </form>
        
        
        
        
        
        
        <jsp:include page="common/footer.jsp"/>
        
        
	<ckeditor:replace replace="editor1" basePath="/ckeditor/" />
        
    </body>
</html>