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

                        <p>Nords are a race that were led to Skyrim by Ysgramor. They are tall, fair-haired and pale skinned humans from Atmora who are known for their incredible resistance to cold and even magical frost. They are enthusiastic warriors, and act as soldiers, mercenaries, merchants and blacksmiths all over Tamriel. Eager to augment their martial skills beyond the traditional methods of Skyrim, they excel in all manner of warfare. Above all else in Nord culture is the quest for honor and glory, and a great emphasis is placed on family values. They thrive in the cold, reminiscent of their native Atmora, and are known as a militant people by their neighbors. Nords are also naturally superior at sea, and have benefited from nautical trade since their first migrations across the sea from Atmora. They captain and crew the merchant fleets of many regions, and may be found all along Tamriel's coasts. They issue a battle cry to make their enemies flee for a short time. Nords comprise the majority of the Stormcloaks, as well as the majority of the population of Skyrim. </p>


                        <div class="image_content"><img src="./dist/img/races/nord/nord1.jpg" alt="alt1" height="375" width="500"/></div>


                        <p>In past games, Nords typically fared well as 'warrior,' 'barbarian'  or 'scout' characters.﻿ They still make good warriors, scouts and the best barbarians because of their specialization in both one-handed and two-handed weapons as well as light armor.

                            The Nords' starting power (Battle Cry) makes most enemies flee for 30 seconds. This is extremely helpful when the player is overwhelmed by enemies that are of a slightly higher level than the player, and especially useful at lower levels. The Nords' bonus effect gives the player a 50% resistance to frost. This is vital when fighting mages or dragons that rely on frost attacks. This starting power is superior to most other racial resistances, as many spells cast at the player are frost-based, although Thalmor Wizards tend to favor shock spells. Many intimidating, overwhelming enemies - such as leveled Falmer or Draugr - use these spells which can easily, without resistance, drain one's health.</p>

                        <p>Dialogue between the player and Nord NPCs regarding the Civil War between the Stormcloaks and the Imperial Legion seems to show support for both the Stormcloaks and the Empire, clearly evidencing the bitter war which has split the people. </p>

                        <div class="image_content"><img src="./dist/img/races/nord/nord2.jpg" alt="alt1" height="250" width="400"/></div>

                        <h3>Skill bonuses</h3>
                        +10 Two-Handed (25)<br/>
                        +5 Block (20)<br/>
                        +5 Light Armor (20)<br/>
                        +5 One-Handed (20)<br/>
                        +5 Smithing (20)<br/>
                        +5 Speech (20) <br/>

                        <h3>Starting spells</h3>

                        > Flames (Destruction)<br/>
                        > Healing (Restoration) 

                        <h3>Special abilities</h3>

                        Battle Cry: Target flees for 30 seconds.<br/>
                        Resist Frost: Your Nord blood gives you 50% resistance to frost. 


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
                            <p><a href="incrementLike?id=<%=showcomment.getId()%>&PAGENAME=races_nord"><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%>   </a> </p>
                                    <%} else {%>
                            <p><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%></p>
                                <%}%>
                        </div>
                        <div class="delete_comment">
                            <%if (adminUser != null) {%>
                            <a href="deletecomment?id=<%=showcomment.getId()%>&PAGENAME=races_nord"><img src="./dist/img/delete.png" alt="alt1" height="20" width="20" /></a>
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
                        <input type="hidden" name="PAGENAME" value="NORD"/>
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


