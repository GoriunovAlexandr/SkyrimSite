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
               
                <p>Redguards hail from the great desert province of Hammerfell. They are descended from a long line of warriors and mystic seers. Legend has it that Redguards are innately more proficient with the use of weaponry than any other race. They excel in all arts concerning blade and shield.</p>

                <div class="image_content"><img src="./dist/img/races/redguard/red1.jpg" alt="alt1" height="350" width="500"/></div>
                
                <p>The most naturally talented warriors in Tamriel, the dark skinned Redguards of Hammerfell seem born to battle, though their pride and fierce independence of spirit makes them more suitable as scouts or skirmishers, or as free ranging heroes and adventurers, than as rank and file soldiers. In addition to their cultural affinities for many weapon and armor styles, Redguards are also blessed with hardy constitutions and fleetness of foot. </p>
                
                <p>Hammerfell, the Redguard's homeland, had recently survived a massive invasion by the Aldmeri Dominion. Though they were aided by the Imperial Legion, the following peace treaty gave a large chunk of the region to the elves. The Redguards refused to accept those terms, and succeeded in reclaiming their homeland from the Dominion, which lead to the separation of Hammerfell from the Mede Empire as an independent nation. There is now distrust between the Redguard and the Imperials.</p>

                <p>It is interesting to note that the Redguards pushed back the Elven armies twice before, and would have dominated Tamriel if not for the opposition in Cyrodiil during the Empire's formation. With the signing of the Second Treaty of Stros M'kai in 4E 180, the Aldmeri Dominion completely withdrew from Hammerfell. This makes Hammerfell the only country to have actually defeated the Aldmeri Dominion, and this largely without the aid of the Empire. The history of Hammerfell was filled with war until finally, because of forced cooperation between Forebears and Crowns, the civil war in Hammerfell has ended, which is likely to lead to a prosperous future. </p>
               
                <p>The main religion of Hammerfell is a mix between ancestor worship and faith in the traditional Yokudan pantheon. According to Trayvond the Redguard, in Hammerfell, they "don't much like spellcasters, because Wizards steal souls and tamper with minds. If you use magic, you're weak or wicked." They are not fond of Conjuration, relating it to Necromancy, or Illusion, because it unwillingly alters the mind of an opponent. However, he does mention that he and other Redguards are rather fond of Destruction spells, as that school of magic suits their culture well. </p>
                
                <div class="image_content"><img src="./dist/img/races/redguard/red2.jpg" alt="alt1" height="400" width="250"/></div>
                
                <h3>Skill bonuses</h3>
                    +10 One-Handed (25)<br/>
                    +5 Alteration (20)<br/>
                    +5 Archery (20)<br/>
                    +5 Block (20)<br/>
                    +5 Destruction (20)<br/>
                    +5 Smithing (20) <br/>

                <h3>Starting spellsEdit</h3>

                    > Flames (Destruction)<br/>
                    > Healing (Restoration) 

                <h3>Special abilitiesEdit</h3>

                    Adrenaline Rush: Stamina regenerates 10x faster for 60 seconds.<br/>
                    Resist Poison: Your Redguard blood gives you 50% resistance to poison. 

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
                                <p><a href="incrementLike?id=<%=showcomment.getId()%>&PAGENAME=races_redguard"><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%>   </a> </p>
                                <%}else{%>
                                    <p><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%></p>
                                    <%}%>
                            </div>
                            <div class="delete_comment">
                                <%if(adminUser != null){%>
                                <a href="deletecomment?id=<%=showcomment.getId()%>&PAGENAME=races_redguard"><img src="./dist/img/delete.png" alt="alt1" height="20" width="20" /></a>
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
                        <input type="hidden" name="PAGENAME" value="REDGUARD"/>
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


