<%@page import="my.web.project.users.UserConstants"%>
<%@page import="my.web.project.entities.MyUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.web.project.entities.Comment"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="dist/css/bootstrap.min.css" rel="stylesheet">
        

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
        <jsp:include page="../common/header.jsp"/>
        
       
        <img src="./dist/img/head.jpg" alt="Logo" height="650" width="1000"/>
        
        <jsp:include page="../common/leftmenu.jsp"/>
        <div id="content_container">
            <div id="quest_content">
                
               <p>The Dark Brotherhood is an organization of highly trained assassins who carry out assassination contracts. The Dark Brotherhood is called upon by those who wish to utilize their deadly services through a ritual called "The Black Sacrament." They were once the most feared organization in all of Tamriel, but have lost their reputation over time. At one point, they were governed by The Five Tenets, which set the ground rules for the Brotherhood, but those tenets have long since been abandoned.</p>

                <p>The Dark Brotherhood has been operating in Tamriel for many Eras, at one time having many clandestine sanctuaries across the Empire. They revere Sithis, the avatar of entropy and chaos, as well as the Night Mother, who is their spiritual leader. </p>
                
                <p>The Dark Brotherhood has been struggling for survival ever since the end of the Third Era. Due to the events of The Elder Scrolls IV: Oblivion, the Dark Brotherhood in Cyrodiil was crippled. They managed to survive until the Great War, when, one after one, each Brotherhood Sanctuary was destroyed. By the end of the war, the Brotherhood was near total destruction once again. Cicero, one of two remaining Dark Brotherhood assassins outside of Skyrim (the other believed to be a deserter), took the Night Mother's corpse from Bravil to the last remaining Dark Brotherhood Sanctuary. In The Elder Scrolls V: Skyrim, the Dark Brotherhood has no listener to hear the Night Mother and thus hears about The Black Sacrament through rumors. This type of life for the Brotherhood continues until the Dragonborn joins them.</p> 
                
                <p>Any man or woman may join the Dark Brotherhood. Initiates must display the ability to kill mercilessly, without regret or sorrow. As a result, their ranks include vampires, werewolves, bandits, and mages.</p>

                <p>A high sneak skill is recommended before joining the Dark Brotherhood. Jobs done for them often require stealth, to kill an enemy without being detected. A very useful perk for this is Assassin's Blade. To get this, the Dragonborn must have a level 50 sneak skill (along with the other perks leading up to it). It will allow successful sneak attacks with daggers to do 15 times normal damage.</p>

                <p>Using stealth, however, is not the only way to assassinate a target without being noticed or given a bounty. One can use both Destruction and Illusion magic to take down targets. To do this, one has to have the Quiet Casting perk, and at least a Fire bolt/Lightning bolt/ice spike spell in the destruction school. With these requirements, while in stealth mode, one can fire a spell at a target to kill them, without receiving a bounty. An alternative way for mages to use magic to kill a target, is, while in stealth mode, cast a fury spell at one's target in a public place; this way, characters in-game will kill the target and thus no bounty will be received. Also, if the Dragonborn is a werewolf, they can transform, putting themselves into an unidentifiable state; this way, they can kill their target without getting a bounty, but they must transform without being noticed.</p> 
            
                <p>24 hours after Innocence Lost has been completed, a courier will appear to the Dragonborn in any city, with a note saying, "We know." A black hand-print is above the words. After receiving the note, sleeping in any bed for any amount of time will begin the next phase of the quest (the acquisition of this note is optional). While sleeping, the Dragonborn is abducted by a Dark Brotherhood assassin and wakes up in an Abandoned Shack. This is where the decision to join or destroy the Dark Brotherhood must be made.</p>

                 <p>There, the Dragonborn is asked by Astrid, the Dark Brotherhood assassin, to kill one of three people in the room, initiating the quest With Friends Like These.... Killing one, two, or even all of the potential victims will earn the Dragonborn an invitation to join the Dark Brotherhood. The Dragonborn may also take the opportunity to destroy the organization by attacking Astrid. This will initiate the quest Destroy the Dark Brotherhood!. Note that this is the only chance to destroy the Dark Brotherhood, because after joining, the Brotherhood members are otherwise unable to be killed. </p>
            
            
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
        <p><%= request.getAttribute("pageText") %>
            <%List<Comment> com = new ArrayList();
            MyUser user = (MyUser)session.getAttribute(UserConstants.CMSUSER);
            com = (List<Comment> ) request.getAttribute("comment");
            if(com == null){
                %><p>No comments for this Page</p><%
            }else{/*(com.size() > 0)*/
                    Comment showcomment = null;
                    for (int i = 0; i < com.size(); i++) {
                        showcomment = com.get(i);
                    %>
                    <div id="show_comment">
                        <p><%=showcomment.getComment()%></p>
                        <p><%=showcomment.getUserName()%></p>
                        <%if(user != null){%>
                        <p>Likes:   <a href="incrementLike?id=<%=showcomment.getId()%>">  <%=showcomment.getLike()%>   </a> </p>
                        <%}else{%>
                            <p><%=showcomment.getLike()%></p>
                            <%}%>
                        <hr/>
                    </div><br>      
                        <%
                }
            %> 
                <%
                }
       %> 
       
        <jsp:include page="../common/footer.jsp"/>
    </div>
    </div>
    </body>
</html>