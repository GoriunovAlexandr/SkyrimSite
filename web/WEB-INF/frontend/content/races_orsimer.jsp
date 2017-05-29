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

                        <p>The Orsimer (more commonly known as Orcs), are the native people of the Wrothgarian and Dragontail Mountains. Despite historical misconceptions, they are in fact a variant of elves or mer, hence the name "Orsimer," meaning "Pariah Folk." Following in the footsteps of Trinimac, and subsequently Malacath, Orcs have consistently held a standard as a race as some of Tamriel's greatest warriors and smiths. </p> 

                        <div class="image_content"><img src="./dist/img/races/orc/orc1.jpg" alt="alt1" height="350" width="500"/></div>

                        <p>Most orcs are found in strongholds throughout Skyrim, though some are seen in major cities such as Morthal and Markarth. The Dragonborn may enter, but cannot have conversation with the Orcs inside. Once you near an Orc Stronghold, a guard will tell you to stay away. You are allowed to enter the stronghold, but the Orcs dislike it, thus making conversation impossible until you complete the quest the guard gives you. This quest varies per Stronghold. If the Dragonborn is an Orc, they will be accepted and may enter and engage in conversations without the need for prerequisite quests, though they will still treat the Dragonborn as an "outlander." However, if you are an Orc, as well as a vampire, then there will be a prerequisite quest. Orc strongholds tend to have a mine and blacksmith tools, which are usable regardless of whether the associated quest has been completed. </p>

                        <p>Orcs excel above and beyond in warrior roles. Their natural abilities fall under the warrior banner with the exception to enchanting, but this isn't outside of the realm of the warrior. With proper training this can easily give any Orc player character a needed boost in the game. The variety and extent of their skill bonuses make Orcs arguably the best pure warriors in the game. Two popular game play roles are as Tank or Blademaster, obviously focusing on use of heavy armor and respectively on shields and dual wielding over an Archer, Assassin or Mage-type role. Tie this into their racial Berserker Rage, and a tidy warrior is complete.</p>

                        <p>It is interesting to note that Orcs are the warriors of the Mer bloodlines. They alone excel under the warrior constellation focusing more on brute strength over cunning, speed and magic like the rest of the Mer. Oddly, an Orsimer is head of the Arcanium at the College of Winterhold. </p>

                        <div class="image_content"><img src="./dist/img/races/orc/orc2.png" alt="alt1" height="400" width="300"/></div>

                        <h3>Skill bonuses</h3>

                        +10 Heavy Armor (25)<br/>
                        +5 Block (20)<br/>
                        +5 Enchanting (20)<br/>
                        +5 One-Handed (20)<br/>
                        +5 Smithing (20)<br/>
                        +5 Two-Handed (20) <br/>

                        <h3>Starting spells</h3>

                        > Flames (Destruction)<br/>
                        > Healing (Restoration) 

                        <h3>Special abilities</h3>

                        Berserker Rage - Take half damage and do double damage for 60 seconds. This does not apply to damage dealt by spells; however, it does stack with other physical damage buffs.<br/> 
                        While Berserker Rage is active, the screen turns red and a little blurry while sound dulls a bit. 


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
                                <%if(user != null){%>
                                <p><a href="incrementLike?id=<%=showcomment.getId()%>&PAGENAME=races_orsimer"><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%>   </a> </p>
                                <%}else{%>
                                    <p><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%></p>
                                    <%}%>
                            </div>
                            <div class="delete_comment">
                                <%if(adminUser != null){%>
                                <a href="deletecomment?id=<%=showcomment.getId()%>&PAGENAME=races_orsimer"><img src="./dist/img/delete.png" alt="alt1" height="20" width="20" /></a>
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
                        <input type="hidden" name="PAGENAME" value="ORSIMER"/>
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


