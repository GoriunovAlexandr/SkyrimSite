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
                        <p>The College of Winterhold is a faction that you have the option of joining. It is Skyrim's equivalent of the Mages Guild from earlier Elder Scrolls games. The College is the only place in Skyrim dedicated to education and practice in the magical arts.</p>

                        <p>The secretive nature of the College mages and the Nords' natural distrust of Magic have contributed to widespread distrust of the College and its members. The destruction of most of Winterhold in 4E 122 only worsened the situation, though no actual evidence exists to suggest the College's involvement. The College's leader, Arch-Mage Savos Aren, seems to be aware of the College's reputation, but doesn't seem too eager to do anything about it.</p>

                        <div class="image_content"><img src="./dist/img/quests/college/college.jpg" alt="alt1" height="400" width="680"/></div>

                        <p>The threadbare Hold City of Winterhold has seen most of its population driven away. The center of life in these parts nowadays is the College of Winterhold. Once a prominent, influential location in Skyrim, Winterhold has fallen on hard times, but is still a haven for mages in Skyrim, a safe refuge from distrustful Nords. Largely self-sufficient, the College of Winterhold is quite content to be isolated from the rest of the province, although a more peaceful coexistence with the outside world is always preferred.</p>

                        <p>The College of Winterhold is situated on a cliff overlooking the Sea of Ghosts. Several years ago, much of the cliff fell into the sea, taking nearly all of the original city with it. Only a few buildings remain, though somehow the College of Winterhold has largely been untouched by the damage. It now resides on a free-standing pillar of rock and ice. Inside, the College is split into three distinctive towers: Halls of Countenance and Attainment, where apprentices and senior mages reside; and the Hall of the Elements, where the Arch-Mage resides, gatherings are held, and The Arcanaeum (the College's great library) is kept. Below the College lies The Midden, a warren of icy tunnels where the remnants of long-forgotten experiments reside.</p>

                        <div class="image_content"><img src="./dist/img/quests/college/00s.jpg" alt="alt1" height="400" width="680"/></div>

                        <p>Winterhold was once a great, powerful and wealthy hold, and its relationship with the College of Winterhold was good.

                        <p>In 4E 122, an unprecedented, cataclysmic event struck Winterhold and most of the areas along the coastline. A massive storm came in from the Sea of Ghosts, which brought huge waves which crashed into Winterhold. Most of the city fell into the sea, leaving the city in ruins both physically in terms of the destruction of the city itself, and the emotional and psychological damage to Winterhold's people. This event would eventually be referred to as "The Great Collapse." The disaster left Winterhold in ruins, and some had said that things would never be the same again, including Winterhold's relationship with the College. The people of Winterhold would eventually begin to blame the College for causing the Great Collapse. Winterhold has yet to recover from the Great Collapse.</p>

                        <p>As the College was independent from the Mages Guild, Necromancy was never made illegal by the College, unlike the Mages Guild in Cyrodiil. For the College of Winterhold, the practice was generally regarded as a tool, not a weapon, although practicing it outside of the College was and is not advised.[6] Like Cyrodiil, there were still wandering groups of Necromancers that did not function alongside the College. Since the College was independent of the jurisdiction of the Mages Guild, it was unaffected by the Necromancy Ban of 3E 431 and the subsequent eradication of that ban which led to battles against Mannimarco.</p> 

                        <div class="image_content"><img src="./dist/img/quests/college/college_sign3.png" alt="alt1" height="400" width="400"/></div>

                        <p>This quest automatically starts at the end of First Lessons, when Tolfdir suggests that visiting the ruins of Saarthal would be an excellent opportunity to learn more about the "various applications of magic throughout history". Saarthal's location is added to your map (if you have not yet discovered it yourself), and Tolfdir and the other College of Winterhold students will start travelling there. They walk the entire distance, meaning that it is easily possible to travel to Saarthal more quickly than any of your companions. It takes them at least four in-game hours to make the trip, longer if they have to deal with multiple enemies (however, all of the students are given protected status at the start of the quest, meaning they are not at risk of being killed along the way). If you are trying to find them en route, they walk from the College into the town of Winterhold, then turn onto a path that leads west from behind the Jarl's Longhouse. You may find it convenient to do another quest in between First Lessons and Under Saarthal, instead of waiting at the ruins for Tolfdir to show up.</p> 

                        <p>When Tolfdir arrives at Saarthal, you can advance the quest by selecting the dialogue option, "I'm ready. Let's go." At that point, the door to Saarthal unlocks and you can enter. You can select the "I'm ready" dialogue before Tolfdir actually gets all the way to the entrance — the dialogue option becomes available at the top of the stairs leading down into the excavation pit (at the same point where you are first told that you have discovered Saarthal). You do not need to wait for the other students before proceeding with the quest; any missing students will appear as soon as you enter Saarthal.</p> 

                        <p>If you choose to delay before proceeding with this quest, Tolfdir and the students will stand around outside Saarthal, indefinitely. Tolfdir will still offer services, including selling Alteration spell books, without triggering the quest</p>

                        <p>Based in Skyrim and headquartered in The Ratway beneath the city of Riften, members of the Thieves Guild are renowned for causing trouble in the city and are held largely responsible for the corruption of the city's markets. Members of the guild specialize in stealing objects of varying value or loaning septims to potential entrepreneurs or to help someone pay off their debts, in hopes of a payback. Most citizens view them unfavorably; Mjoll the Lioness has made it her duty to maintain order in Riften and pledges to dismantle the guild. Maven Black-Briar, the affluent and unscrupulous owner of the popular Black-Briar Meadery, consorts with the guild in exchange for their financial aid and protection. The guild has an uncanny luck due to certain members striking up a deal with the Daedric Prince, Nocturnal, to serve as her guardians.</p>

                        <p>The guild has a strong hold in politics and law enforcement due to their ability to bribe, intimidate and extort the officials and guards of any hold by exploiting their greed or by threatening to reveal embarrassing and potentially damning secrets to the public. </p>

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
                        //MyUser user = (MyUser) session.getAttribute(UserConstants.CMSUSER);
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
                                <p><a href="incrementLike?id=<%=showcomment.getId()%>&PAGENAME=college_of_winterhold"><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%>   </a> </p>
                                <%}else{%>
                                    <p><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%></p>
                                    <%}%>
                            </div>
                            <div class="delete_comment">
                                <%if(adminUser != null){%>
                                <a href="deletecomment?id=<%=showcomment.getId()%>&PAGENAME=college_of_winterhold"><img src="./dist/img/delete.png" alt="alt1" height="20" width="20" /></a>
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
                        <input type="hidden" name="PAGENAME" value="WINTERHOLD"/>
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