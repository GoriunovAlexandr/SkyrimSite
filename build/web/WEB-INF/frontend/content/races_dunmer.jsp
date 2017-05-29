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

                        <p>The Dunmer, more commonly referred to as Dark Elves, are the dark skinned elven natives of the province of Morrowind. After the eruption of Red Mountain, many Dunmer fled to Skyrim, becoming refugees. They face extreme prejudices due to their elven blood. Several Dunmer have managed to make their way in Skyrim as merchants, mages or assassins for the Dark Brotherhood. </p>

                        <p>They have red, glowing eyes and their skin tones vary from green to gray, and even light blue. They are known to be extremely strong, intelligent, and very quick, but are said to be ill favored by fate.</p>

                        <div class="image_content"><img src="./dist/img/races/dunmer/dunmer3.jpg" alt="alt1" height="375" width="500" /></div>

                        <p>Both male and female Dunmer have a height of 1.0, which is standard across races in Skyrim. Redguards and Bretons share the same height. They are slightly taller than Bosmer, which rank at 0.95 and shorter than Altmer, which rank 1.08</p>

                        <p>Migration - Red Mountain eruption: After the eruption of Red Mountain, many Dunmer fled to Skyrim. Several took up residence at the College of Winterhold, to bolster their innate magical talents.[1] Many more fled to Windhelm, the seat of the Stormcloaks' resistance against the Empire of Tamriel.</p>

                        <p>When entering Windhelm, the Dragonborn witnesses a Dunmer arguing with two Nords.
                            Azura's vision: Before the destruction that led to the mass exodus of Dunmer, several of the faithful of Azura received visions of the eruption of Red Mountain. Setting out for Winterhold, these Dunmer built the Shrine of Azura and remained there as priests and priestesses, though they eventually left over time, until only one remained, Aranea Ienith.</p>

                        <p>Segregation: Strongly nationalistic, the Nords of Windhelm segregated the Dunmer from the other citizens, into what came to be known as the Gray Quarter.[3] Worse treatment, however, was given to the Argonians, who are not allowed to live in the city.</p>




                        <div class="image_content"><img src="./dist/img/races/dunmer/dunmer2.jpg" alt="alt1" height="250" width="400" /></div>

                        <h3>Skill bonuses</h3>

                        +10 Destruction<br/>
                        +5 Alchemy<br/>
                        +5 Alteration<br/>
                        +5 Illusion<br/>
                        +5 Light Armor<br/>
                        +5 Sneak <br/>

                        <h3>Starting spells</h3>

                        > Flames (Destruction)<br/>
                        > Sparks (Destruction)<br/>
                        > Healing (Restoration) <br/>

                        <h3>Special abilities</h3>

                        Ancestor's Wrath: Once per day for 60 seconds, opponents that get too close take 8 points per second of fire damage. Ancestor's Wrath can harm neutral NPCs such as town guards.<br/>
                        Resist Fire: Your Dunmer blood gives you 50% resistance to fire. 




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
                                <p><a href="incrementLike?id=<%=showcomment.getId()%>&PAGENAME=races_dunmer"><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%>   </a> </p>
                                        <%} else {%>
                                <p><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%></p>
                                    <%}%>
                            </div>
                            <div class="delete_comment">
                                <%if (adminUser != null) {%>
                                <a href="deletecomment?id=<%=showcomment.getId()%>&PAGENAME=races_dunmer"><img src="./dist/img/delete.png" alt="alt1" height="20" width="20" /></a>
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
                        <input type="hidden" name="PAGENAME" value="DUNMER"/>
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


