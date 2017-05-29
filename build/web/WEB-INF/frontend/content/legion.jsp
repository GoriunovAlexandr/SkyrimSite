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
                
                <p>Once the strongest fighting forces in Tamriel, the Imperial Legion has been reduced to a mere shadow of its former self by the time of the events of Skyrim. With the near annihilation of the Blades and the emergence of the Thalmor as a military power, many view the Legion as corrupt and decaying, much like the condition of the Empire.</p>

                <div class="image_content"><img src="./dist/img/quests/imperial/tulius.jpg" alt="alt1" height="400" width="350"/></div>
                
                <p>The Imperial Legion is based in Solitude, and the Dragonborn may join and fight to keep Skyrim in the Empire. The Legion is comprised mostly of Nord and Imperial legionnaires and Legates, though there are Breton and Redguard legionnaires, along with Altmer, Dunmer, and Breton Legates.</p>

                <div class="image_content"><img src="./dist/img/quests/imperial/camp.png" alt="alt1" height="400" width="700"/></div>
                
                <p>The Stormcloaks are at odds with the Imperial Legion, as proclaimed liberators of the Nordic people. Because of this, the Legion is also at odds with the influential Gray-Mane family, an old and renowned Whiterun clan, whose views oppose those of the Empire of Tamriel. However, they have the support of the influential Battle-Born clan, also in Whiterun. </p>
                
                <p>The Imperial Legion is the military force of the Empire of Tamriel. Serving under the authority of the Emperor, the Legion, with its vast numbers, quality training, and rigid discipline, is considered one of the most powerful fighting forces ever assembled. A history and detailed description of the Legion is provided here.</p>

                <div class="image_content"><img src="./dist/img/quests/imperial/Legate_Quentin_Cipius.png" alt="alt1" height="400" width="250"/></div>
                
                <p>The Legion is a joinable faction in Skyrim, and its conflict with the Stormcloak Rebellion plays an integral role in the main quest. The Imperial Legion is in conflict with the Stormcloaks during Skyrim's Civil War, and is charged with hunting down and eradicating its members throughout the province and quelling the rebellion. The Imperial Legion in Skyrim is led by General Tullius.</p>

                <p>Following your narrow escape from execution at Helgen during the quest Unbound, and just after Alduin flies off, you will have a choice to follow either Hadvar or Ralof into Helgen Keep. If you choose Hadvar, and then from the keep either accompany him on the road to, or leave and rejoin him in Riverwood, he will invite you to join the Imperial Legion, or he might make the offer in Alvor's house in Riverwood. If you instead follow Ralof, you will be asked to join the Stormcloaks.</p>

                <div class="image_content"><img src="./dist/img/quests/imperial/9370-3-1390697995.jpg" alt="alt1" height="400" width="700"/></div>
                
                <p>If you make no choice at that point, Imperial soldiers that you will encounter in your travels, or upon entering an Imperial camp will encourage you to join the Legion by going to Solitude, where you will be directed to Legate Rikke at Castle Dour. Speaking with her can initiate the quest Join the Imperial Legion.</p>

                <p>Before you complete that quest, however, (or before you start it) you may instead decide to join the Stormcloaks. If you do so, the Join the Imperial Legion quest will fail if it has been initiated; however, you will have an opportunity to join the Legion later. At the end of the second quest for the Stormcloaks, The Jagged Crown, you can take the crown to General Tullius, who will admit you to the Legion.</p>
                
                <div class="image_content"><img src="./dist/img/quests/imperial/TESV_Banner_Legion.png" alt="alt1" height="400" width="200"/></div>
               
                <p>After the conclusion of the civil war in favor of the Imperial Legion, the Dragonborn will be told there are still Stormcloak camps out there to destroy. However, when visiting said camps, the commanders will still be flagged as essential and cannot be killed. Furthermore, the Stormcloak soldiers at these camps will eventually respawn. Additionally, citizens still mention the war. A number of notable changes occur after completing the Imperial Legion campaign:</p>

                <p>All Jarls that supported the Stormcloaks are replaced with those loyal to Empire. Imperial Legion soldiers replace the Hold Guards in all cities that previously were under the control of the Stormcloaks.</p>
    
                <p>Jarls who have been removed from their throne due to the Imperial Legion's take over are all kept in the main hall of the Palace of the Kings in Windhelm along with their housecarls, stewards, and a few other notable persons who supported the Stormcloaks.</p>
   
                <p>The Forts scattered around Skyrim will be occupied by Imperial Legion Soldiers.Imperial Legion Soldiers aid the Dragonborn in battle, if they are attacked by a foe. They do not lend assistance if the Dragonborn initiated the fight. </p>
                
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
                                <p><a href="incrementLike?id=<%=showcomment.getId()%>&PAGENAME=imperial_legion"><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%>   </a> </p>
                                <%}else{%>
                                    <p><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%></p>
                                    <%}%>
                            </div>
                            <div class="delete_comment">
                                <%if(adminUser != null){%>
                                <a href="deletecomment?id=<%=showcomment.getId()%>&PAGENAME=imperial_legion"><img src="./dist/img/delete.png" alt="alt1" height="20" width="20" /></a>
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
                        <input type="hidden" name="PAGENAME" value="LEGION"/>
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