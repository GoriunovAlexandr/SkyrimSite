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
                
                <p>The Bards College is a musical school in Solitude. The Bards College is where any aspiring bard starts his career in tale-telling or song. It is located next door to Proudspire Manor, near the Blue Palace inside the walls of Solitude. The College, though large, contains few notable items. Many of the bards around Skyrim were trained at the College, and will recommend that the player visit the College. The primary reward for joining the college is actually three of its miscellaneous quests, which together grant +1 to every skill (18 points overall).</p>

                <div class="image_content"><img src="./dist/img/quests/bards/InvestigateTheBardsCollege.png" alt="alt1" height="380" width="550"/></div>
                
                <p>Upon arriving at the Bards College, the player is able to seek admittance. It is traditional for new Bards to perform a service to the college before they can be admitted, but there is a problem. The headmaster Viarmo will say that no new bards can be admitted except at the festival of the burning of King Olaf, which the bards have held annually, but this year the Jarl wishes to cancel it as she feels it is in poor taste after the death of her husband.</p>

                <p>Viarmo will ask you to help him reinstate the festival sending you on a quest to retrieve a document lost long ago, an epitaph written at the ancient time of King Olaf's passing, and which he believes will help change the Jarl's mind. The document can be found in Dead Men's Respite. Once retrieved, return to Viarmo. You must help him fill in the gaps that are rampant in the document. Afterwards, the headmaster takes the player to the Jarl in order to try and reinstate the festival.</p>

                <div class="image_content"><img src="./dist/img/quests/bards/Bards-College.jpg" alt="alt1" height="400" width="550"/></div>
                
                <p>The Bards College is a joinable faction that appears in The Elder Scrolls V: Skyrim. Located in Solitude, the guild consists of bards, poets, and public speakers. Joining the college requires completing a quest for the guild's headmaster, Viarmo.  </p>
            
                <p>Upon entering the Bards College, admission can be requested from Viarmo. He will ask the Dragonborn to go to Dead Men's Respite to retrieve the missing verses from a poem about King Olaf One-Eye, called King Olaf's Verse. However, some of the verses are missing, so the Dragonborn and Viarmo will have to make up their own lines for the poem, so that it can be read to Solitude's Jarl. The Dragonborn must then attend the burning of Olaf's effigy, and speak to Viarmo to join the Bards College. </p>

                <div class="image_content"><img src="./dist/img/quests/bards/200px-BardsCollege_faction.png" alt="alt1" height="300" width="250"/></div>
                
                <p>After becoming a member of the guild, items can be freely used or taken from the college. Interestingly, the College contains no loot of immense value, but does contain many, many books. Book collectors and lore-enthusiasts may value this. The teachers at the College will see the Dragonborn as an 'adventuring type' and ask them to search for misplaced items and artifacts. Once these items are found, the teachers will provide the player with one skill up to each type of skill.</p>
                
                <p>Upon speaking with any of the Bards, you may receive hints about joining the Bards College, but it is not necessary to speak to any of them if you wish to join. Near the Blue Palace in the Avenues District you will find the Bards College. Head inside and look for Viarmo, the Headmaster of The Bards College. He warns you that few applicants are accepted, and then proceeds with the interview process which, of course - involves a task. Several people around the college will need your help as well, so speak to everyone and do the quests! You will receive skill increases instead of gold or loot, so it's definitely worth it. </p>
                
                
                
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
                                <%if(user != null){%>
                                <p><a href="incrementLike?id=<%=showcomment.getId()%>&PAGENAME=bards_college"><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%>   </a> </p>
                                <%}else{%>
                                    <p><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%></p>
                                    <%}%>
                            </div>
                            <div class="delete_comment">
                                <%if(adminUser != null){%>
                                <a href="deletecomment?id=<%=showcomment.getId()%>&PAGENAME=bards_college"><img src="./dist/img/delete.png" alt="alt1" height="20" width="20" /></a>
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
                        <input type="hidden" name="PAGENAME" value="BARDS"/>
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