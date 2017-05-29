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


                        <p>Known as "Altmer" in their homeland of Summerset Isle, the High Elves are the most gifted in the arcane arts of all the races. They can call upon their Highborn power to regenerate Magicka quickly.</p>

                        <div class="image_content"><img src="./dist/img/races/altmer/altmer2.png" alt="alt1" height="200" width="300" /></div>

                        <p>Altmer are one of the ten playable races in The Elder Scrolls V: Skyrim. Due to their magical affinities, the Altmer excel at mage-based classes. Characterized by their yellowish skin and amber-colored eyes, the Altmer are subjected to racism and discrimination due to their affiliation with the Third Aldmeri Dominion and the Thalmor. </p>

                        <p>As a race, the Altmer strive to maintain the appearance of their ancestor race, the Aldmer, primarily through highly selective traditions surrounding marriage and reproduction. They are among the tallest of the humanoid races, taller than most humans and much taller than other mer. Their skin maintains a very pale gold hue, not quite the pale white of the northern human races such as Nords or Bretons but far lighter than the Bosmer. They are slender, with prominently pointed ears and almond-shaped eyes that can be amber, green, or yellow. On average, Altmer are of smaller build than humans, and thus generally not as strong. Their tall stature also makes them less agile than their Bosmeri cousins. However, Altmer are among the most intelligent and magically-inclined races on Nirn, surpassing even the Bretons in magical aptitude. Altmer are received poorly amongst the Nords, the Stormcloaks especially, ever since the Thalmor, the ruling political group of the Altmer, outlawed the worship of Talos in Skyrim. High Elves are well known for their noble countenance and are arrogant or disdainful more often than not when addressing humans. The Altmer are the tallest race in The Elder Scrolls V: Skyrim, standing at a scale of 1.08. However, as with all races, when in first-person mode, the camera height is 1.00. </p>

                        <div class="image_content"><img src="./dist/img/races/altmer/alt1.png" alt="alt1" height="400" width="300" /></div>


                        <h3>Skill bonusesEdit</h3>

                        +10 Illusion (level 25)<br/>
                        +5 Alteration (level 20)<br/>
                        +5 Conjuration (level 20)<br/>
                        +5 Destruction (level 20)<br/>
                        +5 Enchanting (level 20)<br/>
                        +5 Restoration (level 20)<br/> 

                        <h3>Starting spellsEdit</h3>

                        <p>Flames (Destruction). All races start with this particular spell.
                            Healing (Restoration). All races start with this particular spell.
                            Fury (Illusion) </p>

                        <h3>Special abilitiesEdit</h3>

                        <p>Highborn: Regenerate magicka faster for 60 seconds, once a day.
                            Fortify Magicka: Passive increase in magicka by 50 points. If the player is a vampire and the Necromage perk is taken from the Restoration perk tree, this will increase by 25% to 62 points. </p>
                    </div>
                </div>

                <script class="secret-source">
                    jQuery(document).ready(function ($) {

                        $('#banner-fade').bjqs({
                            height: 420,
                            width: 800,
                            responsive: true
                        });

                    });
                </script>





                <div style="clear:both"></div>
                <p>
                    <%List<Comment> com = new ArrayList();
                        com = (List<Comment>) request.getAttribute("comment");
                        if (com == null) {
                    %><p>No comments for this Page</p><%
                        } else {/*(com.size() > 0)*/

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
                            <p><a href="incrementLike?id=<%=showcomment.getId()%>&PAGENAME=races_altmer"><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%>   </a> </p>
                                    <%} else {%>
                            <p><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%></p>
                                <%}%>
                        </div>
                        <div class="delete_comment">
                            <%if (adminUser != null) {%>
                            <a href="deletecomment?id=<%=showcomment.getId()%>&PAGENAME=races_altmer"><img src="./dist/img/delete.png" alt="alt1" height="20" width="20" /></a>
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
                        <input type="hidden" name="PAGENAME" value="ALTMER"/>
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

