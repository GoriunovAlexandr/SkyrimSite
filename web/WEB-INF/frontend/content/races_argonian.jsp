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


                        <p>Enigmatic and intelligent, the Argonians are experts at guerrilla warfare, and their natural abilities suit their swampy homeland, Black Marsh. They have developed immunities to the diseases that have doomed many would-be explorers in the region, and they are capable of easily exploring underwater locations due to their ability to breathe underwater. Argonians make proficient thieves, due to their increased lockpicking and sneaking skills. </p>

                        <div class="image_content"><img src="./dist/img/races/argonian/arg4.jpg" alt="alt1" height="300" width="500" /></div>

                        <h3>Politics</h3>

                        <p>After conquest of the Dunmer province of Morrowind, little is known about the politics of the Argonians in the Fourth Era. There is an Argonian political faction called the An-Xileel, but there is little information about them, except they're composed of mostly, if not all, Argonians, and that they pushed back Mehrunes Dagon's forces during the Oblivion Crisis in Black Marsh, and were also the faction responsible for orchestrating the conquest of Morrowind.

                        <h3>Assemblage</h3>

                        <p>In Windhelm, Argonians are sequestered from the predominantly Nordic population, and are forced to live at the Argonian Assemblage, located at the city docks. After the mass exodus of Dunmer and Argonian peoples to Windhelm, the citizens became suspicious, worrying that the immigrants would influence or otherwise dilute their culture, and so forced them into segregation. Largely, this extreme behavior was inspired by the political confrontation between the Empire of Tamriel and the rulers of Skyrim. However, this eventually just turned into blatant racism.

                        <h3>Marriage</h3>

                        <p>Unlike the citizens of Skyrim, who prefer to marry using an Amulet of Mara, some Argonians adhere to their native marriage traditions. In Black Marsh, it is customary to present a lover with an Argonian Wedding Band, which is crafted by the courting member. Each ring is unique and has personal meaning to the creator and the recipient. 

                        <p>"In Black Marsh, tradition dictates we present a potential mate a unique wedding ring to represent our future bond."

                        <p>"Every Argonian wedding proposal band is supposed to have three flawless amethysts as part of their design. Two of the gems, the ones on the outside, represent the couple to be married... one for the husband, one for the wife. The amethyst in the center represents The Hist, the entity that all Argonians consider a sacred part of our lives."</p>

                        <div class="image_content"><img src="./dist/img/races/argonian/arg1.jpg" alt="alt1" height="300" width="400" /></div>

                        <h3>Skill bonuses</h3>

                        Lockpicking 	+10<br/>
                        Light Armor 	+5<br/>
                        Alteration 	+5<br/>
                        Pickpocket 	+5<br/>
                        Restoration 	+5<br/>
                        Sneak 	+5 <br/>


                        <h3>Starting spells</h3>

                        Flames (Destruction)<br/>
                        Healing (Restoration) 

                        <h3>Special abilities</h3>

                        Histskin: Invoke the power of the Hist to recover health ten times faster for 60 seconds. Can only be used once per day.<br/>
                        Resist Disease: Your Argonian blood is 50% resistant to disease.<br/>
                        Waterbreathing: Your Argonian Lungs can breathe underwater. <br/>
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
                                <p><a href="incrementLike?id=<%=showcomment.getId()%>&PAGENAME=races_argonian"><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%>   </a> </p>
                                        <%} else {%>
                                <p><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%></p>
                                    <%}%>
                            </div>
                            <div class="delete_comment">
                                <%if (adminUser != null) {%>
                                <a href="deletecomment?id=<%=showcomment.getId()%>&PAGENAME=races_argonian"><img src="./dist/img/delete.png" alt="alt1" height="20" width="20" /></a>
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
                        <input type="hidden" name="PAGENAME" value="ARGONIAN"/>
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

