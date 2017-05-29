<%@page import="my.web.project.users.UserConstants"%>
<%@page import="my.web.project.entities.MyUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.web.project.entities.Comment"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="//cdn.ckeditor.com/4.5.4/standard/ckeditor.js"></script>
        

        <!-- Custom styles for this template 
        <link href="signin.css" rel="stylesheet">-->
        

        <!--Slider Part-->
        <link rel="stylesheet" href="dist/slider/css/bjqs.css">


    <!-- demo.css contains additional styles used to set up this demo page - not required for the slider --> 
    <link rel="stylesheet" href="dist/slider/css/demo.css">
    <link rel="stylesheet" href="dist/css/style.css">

    <!-- load jQuery and the plugin -->
    <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script src="dist/slider/js/bjqs-1.3.min.js"></script>
        
        
    </head>
    <body>
        <div id="background_container">
<!--            <div id="left_bg"></div>
            <div id="right_bg"></div>-->
        
        <div id="wrapper">
        <%MyUser user = (MyUser) session.getAttribute(UserConstants.CMSUSER);
                MyUser adminUser = (MyUser) session.getAttribute(UserConstants.CMSADMIN);

                    if (user != null || adminUser != null) {
                %>

                <jsp:include page="../user/common/header.jsp"/>

                <%
                } else {
                %>
                <jsp:include page="../common/header.jsp"/>

                <% }
                %>
        
       
        <img src="./dist/img/head.jpg" alt="Logo" height="650" width="1000"/>
        
        <jsp:include page="../common/leftmenu.jsp"/>
        <div id="content_container">
            <div id="quest_content">
                
                <p>Bretons are a race of both human and elven ancestry. They populate the province of High Rock. They are excellent mages with high magic resistance but have few other distinctive features. They are considered an intelligent race in Tamriel, known for a proficiency in abstract thinking, a possible reason for their adeptness in the magical arts. It is suggested that they may probably also carry Aldmer blood, accounting for their magical prowess. </p>
                
                <div class="image_content"><img src="./dist/img/races/breton/breton1.jpg" alt="alt1" height="375" width="500" /></div>
                
                <p>Unlike the neighboring Redguard and Dunmer populations, the Bretons don't have many of their number in Skyrim. Some, however, do take to city life and are a minority in settlements.</p>

                <p>In the Reach, the native Bretons were involved in an armed uprising against the Nords that rule Markarth. They took the city by force due to a belief that it belonged to the native population, but were driven out by Ulfric Stormcloak prior to his own conflict with the Empire. This group call themselves the Forsworn and are active to this day. The Dragonborn is able to assist the Forsworn during the quest No One Escapes Cidhna Mine, this results in the normally hostile Forsworn settlement of Druadach Redoubt becoming friendly. </p>
                
                <div class="image_content"><img src="./dist/img/races/breton/breton2.jpg" alt="alt1" height="250" width="400" /></div>
                
                <h3>Skill bonuses</h3>

                    +10 Conjuration (25)<br/>
                    +5 Alchemy (20)<br/>
                    +5 Alteration (20)<br/>
                    +5 Illusion (20)<br/>
                    +5 Restoration (20)<br/>
                    +5 Speech (20) <br/>

                <h3>Starting spells</h3>

                    > Conjure Familiar (Conjuration)<br/>
                    > Flames (Destruction)<br/>
                    > Healing (Restoration) <br/>

                <h3>Special abilities</h3>

                    <p>Dragonskin : Absorb 50% of magicka from hostile spells for 60 seconds.
                    Magic Resistance : Breton blood grants a 25% resistance to magic. Note: In the loading screen trivia, it says the Bretons have a 50% magic resistance. 25% is the correct level.</p>
                

               
                

            </div>
        </div>

      <script class="secret-source">
        jQuery(document).ready(function($) {

          $('#banner-fade').bjqs({
            height      : 420,
            width       : 800,
            responsive  : true
          });

        });
      </script>

            
            
       
        
      <div style="clear:both"></div>
        <p>
            <%List<Comment> com = new ArrayList();
            com = (List<Comment> ) request.getAttribute("comment");
            if(com == null){
                %><p>No comments for this Page</p><%
            }else{/*(com.size() > 0)*/
                    Comment showcomment = null;
                    for (int i = 0; i < com.size(); i++) {
                        showcomment = com.get(i);
                    %>      
                    <div id="show_comment">
                        <div class="comment_text">  <p><%=showcomment.getComment()%></p>   </div>
                        <div>
                            <div class="comment_author"><p>Left by: <%=showcomment.getUserName()%></p></div>
                            <div class="comment_like">
                                <%if (user != null) {%>
                                <p><a href="incrementLike?id=<%=showcomment.getId()%>&PAGENAME=races_breton"><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%>   </a> </p>
                                        <%} else {%>
                                <p><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%></p>
                                    <%}%>
                            </div>
                            <div class="delete_comment">
                                <%if (adminUser != null) {%>
                                <a href="deletecomment?id=<%=showcomment.getId()%>&PAGENAME=races_breton"><img src="./dist/img/delete.png" alt="alt1" height="20" width="20" /></a>
                                    <%}%>
                            </div>
                        </div>

                    </div></br><hr/> 
                        <%
                }
            %> 
                <%
                }
       %> 
       <%if (user != null) {%>
                <div class="comment_filed">
                    <form action="savecomment" method="POST">
                        <h2 class="left_margin"><%=request.getAttribute("leaveComment")%></h2>
                        <p>
                            <textarea id="editor1" name="TEXTPAGE" rows="4" cols="74"></textarea>
                        </p>
                        <input type="hidden" name="PAGENAME" value="BRETON"/>
                        <input type="submit" value="SAVE" class="comment_submit_button"/>

                    </form>
                </div>
                <%}%>

                <jsp:include page="../common/footer.jsp"/>
                <ckeditor:replace replace="editor1" basePath="/ckeditor/" />
    </div>
    </div>
    </body>
</html>


