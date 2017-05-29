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

                        <p>Bosmer (or, more commonly, Wood Elves) are the elven people of Valenwood. They prefer a simple existence, living in harmony with the land and wild animals. They are known to be the best archers in all of Tamriel and are known for their ability to command wild creatures. They make great scouts or thieves, due to their natural stealth and light footing. </p>

                        <div class="image_content"><img src="./dist/img/races/bosmer/bosmer.jpg" alt="alt1" height="300" width="500" /></div>

                        <p>After the War of the Blue Divide in the Third Era, in which the Altmer defeated the Bosmer in Valenwood, the Altmer and Bosmer are the core of the newly formed Aldmeri Dominion and its Thalmor forces. The Dominion very nearly destroyed the Empire, if not for the Battle of the Red Ring, which forced the Elven armies to withdraw from Cyrodiil. Following its victory in the Great War, the Third Aldmeri Dominion experienced increased prestige and power that the Mer had not possessed since the First Aldmeri Dominion, which had been defeated by Tiber Septim in the final years of the Second Era. Confident of its ability to defeat the Mede Empire, the Dominion further expanded its influence into the other provinces of Tamriel, including the homeland of the Nords: Skyrim. It also reestablished diplomatic relations with the Mede Empire, even though they were still engaged in a cold war.</p>

                        <p>Malborn, from the quest Diplomatic Immunity, hates the Thalmor as evidenced by him helping the Dragonborn infiltrate a Thalmor party. According to Delphine, Malborn's family was killed by the Thalmor in Valenwood. Therefore, Malborn's family was possibly made of Imperial allies or sympathizers. The wiping out of Malborn's family is referred to by Delphine as a "purge", suggesting that the Thalmor have been actively pursuing their goal to purify the elven races.  </p>

                        <div class="image_content"><img src="./dist/img/races/bosmer/bosmer2.jpg" alt="alt1" height="250" width="400" /></div>

                        <h3>Skill bonuses</h3>

                        +10 Archery (25)<br/>
                        +5 Alchemy (20)<br/>
                        +5 Light Armor (20)<br/>
                        +5 Lockpicking (20)<br/>
                        +5 Pickpocket (20)<br/>
                        +5 Sneak (20) <br/>

                        <h3>Starting spells</h3>

                        > Flames (Destruction)<br/>
                        > Healing (Restoration) 

                        <h3>Special abilities</h3>

                        > Command Animal: Make an animal an ally for 60 seconds.<br/>
                        > Resist Disease and Poison: Your Bosmer blood gives you 50% resistance to poison and disease. 


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
                                <p><a href="incrementLike?id=<%=showcomment.getId()%>&PAGENAME=races_bosmer"><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%>   </a> </p>
                                        <%} else {%>
                                <p><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%></p>
                                    <%}%>
                            </div>
                            <div class="delete_comment">
                                <%if (adminUser != null) {%>
                                <a href="deletecomment?id=<%=showcomment.getId()%>&PAGENAME=races_bosmer"><img src="./dist/img/delete.png" alt="alt1" height="20" width="20" /></a>
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
                        <input type="hidden" name="PAGENAME" value="BOSMER"/>
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

