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

                        <p>The Khajiit are a playable race present in The Elder Scrolls V: Skyrim. Khajiit are one of the beast races which inhabit the continent of Tamriel, primarily their home province of Elsweyr. The Khajiit are Cathay and are recognizable by their feline appearance and their sly accent. Along with the Argonians, they are referred to as the beast-races of Skyrim. Because of this, Khajiit have a negative public image. </p>

                        <div class="image_content"><img src="./dist/img/races/kadjit/kadjit1.jpg" alt="alt1" height="375" width="500"/></div>

                        <p>Known for their natural agility and stealth, many Khajiit disdain weapons in favor of their claws. When involved in combat, they often flatten their ears, narrow their eyes, and show their teeth (similar to a real-life cat). Due to their stealth skills, beguiling wit, and latent agility, they make adept thieves and assassins.</p>

                        <p>Many Khajiit are also warriors, although this is mainly true of the Cathay-raht, a breed taller and more powerful than the Cathay that are rarely found outside Elsweyr. The Cathay found in Skyrim are much more agile and in addition to their natural agility and proficiency in stealth, they have the added benefit of night vision. These skills, combined with the general tendency of humans and mer to look down on Khajiit and "beasts", leads many Khajiit outside of their home province to become professional assassins, thieves or bandits in other lands.</p>

                        <p>Other Khajiit in the province of Skyrim find their cunning nature suitable for mercantilism and trade. Still more are involved in the illegal smuggling of Skooma, a narcotic. </p>

                        <div class="image_content"><img src="./dist/img/races/kadjit/kadjit2.jpg" alt="alt1" height="250" width="400"/></div>

                        <h3>Skill bonuses</h3>
                        Alchemy 	+5<br/>
                        Archery 	+5<br/>
                        Lockpicking +5<br/>
                        One-Handed 	+5<br/>
                        Pickpocket 	+5<br/>
                        Sneak 	+10<br/>

                        <h3>Starting spells</h3>

                        > Flames (Destruction) - All races have this starting spell.<br/>
                        > Healing (Restoration) - All races have this starting spell. 

                        <h3>Special abilities</h3>

                        Night Eye - See in the dark for 60 seconds for an unlimited number of times per day.<br/>
                        Claws - Unarmed attacks do 15 points of damage. 


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
                            <p><a href="incrementLike?id=<%=showcomment.getId()%>&PAGENAME=races_khajiit"><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%>   </a> </p>
                                    <%} else {%>
                            <p><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%></p>
                                <%}%>
                        </div>
                        <div class="delete_comment">
                            <%if (adminUser != null) {%>
                            <a href="deletecomment?id=<%=showcomment.getId()%>&PAGENAME=races_khajiit"><img src="./dist/img/delete.png" alt="alt1" height="20" width="20" /></a>
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
                        <input type="hidden" name="PAGENAME" value="CAT"/>
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


