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
                
                <p>The Thieves Guild is dedicated to the gathering and training of those who are stealthy and shadowy in nature. Although criminal by its very definition, for untold years, local authorities in places throughout Tamriel have tolerated the existence of the guild for its role as "crime regulator", as it does not tolerate competition or egregious conduct from its members (not to mention the personal financial benefits for authorities who play nice). It is usually considered to be a distinctly Imperial entity, though of course other organizations of the Empire do not officially condone their actions.</p>

                <p>Like any trade guild, the Thieves Guild is an organization of professionals, except that in this case the professionals are burglars, robbers, pickpockets, smugglers, and other enterprising operators. They typically don't have public guild halls, but sometimes have safe-houses, and members tend to gather at a single location in large towns, such as at a cornerclub, inn, or tavern. Typically, members are bound not to rob each other, kill anyone while thieving, or rob the poor. The Thieves Guild usually has the resources to bribe officials, establish a black market of stolen goods, and maintain a network of informants.For historical information, see the Lore article.</p>

                <p>Based in the city of Riften, the Thieves Guild's headquarters can be initially accessed through the Ratway, a network of tunnels that runs under the city.</p>
                
                <p>At the beginning of the quest, the Dragonborn must enter the Cistern of the Ratway, however they will find the entrance by the Hall of the Dead Mausoleum locked, making the only point of entrance the Ratway. Karliah will be waiting in the Ragged Flagon. She has Gallus's translated journal ready to show to the guild members, who require convincing. Agreeing to back her up will result in Karliah proceeding into the Cistern. As expected, Brynjolf, Vex and Delvin Mallory are waiting for Karliah and the Dragonborn with their weapons drawn. Karliah hands over Gallus's journal as proof that it was Mercer that had been stealing from the guild. Brynjolf, refusing to believe that Mercer has been stealing from the Guild, orders Delvin to open the vault, which is found empty.</p>

                <p>It takes two keys to unlock the vault, leading to Brynjolf's confusion, although Karliah mentions that he did not need a key. Delvin, Brynjolf, and Mercer are the only ones who own the needed keys. Although vindicated, Karliah is just as angered by this as the rest of the Thieves Guild, except perhaps for the seething Vex, who vows to kill Mercer immediately. Brynjolf calms the guild members down and orders Vex to guard the Ragged Flagon along with Delvin. He then asks the Dragonborn what they have learned from Karliah. The Dragonborn needs to explain to him that Mercer killed Gallus, that the three of them were Nightingales and that Karliah was behind Goldenglow and Honningbrew, which was a cunning plan to try and make Mercer look weak in front of Maven Black-Briar.</p>

                <p>After that, Brynjolf assigns the Dragonborn to an important task: They are to break into Mercer's house in Riften - Riftweald Manor - and gather any information that may indicate where the traitor has gone. Before leaving Brynjolf, the Dragonborn may ask him what the best way is into Riftweald Manor. If the Dragonborn asked Brynjolf for additional information before leaving, they find out about a watchdog and an exterior ramp with a mechanism to lower it, which could aid in the Dragonborn's  escape. Also, asking about the watchdog named Vald will make Brynjolf indicate Vex may have more information to provide.</p>

                <p>If the Dragonborn asks Vex about him, she tells them that Vald has a debt and that Vald he is only interested in gold, so buying him off is a possibility, but it will not be cheap and Vald might not betray Mercer. Consequently, Vex suggests speaking to Maven Black-Briar about erasing Vald's debt, or running him through with a blade and taking what is needed off his body.</p>
                Riftweald ManorEdit
                Getting into the ManorEdit

                <p>When the Dragonborn reaches the rear of the Riftweald Manor, they may find many entrances into the area. Going through the expert level lock into the back, or a gate that requires a key, on which the Unrelenting Force shout can be used to take down the ramp, or the trigger can be shot (hitting it with a magelight spell also works). Then, they can hide from Vald and sneak into the manor, pickpocket Vald for the key or kill him and claim the key. Alternatively, if the Dragonborn has cleared Vald's debt by retrieving the Quill of Gemination for Maven, going through the novice level lock in the front of the manor, and then the one after that. It is important not to pick the expert locked gate. The Dragonborn must stay outside of the gate and wait for Vald to approach. Then, they must talk to him, and he will leave Riften, allowing the Dragonborn to do as they please.</p>
                In the ManorEdit

                <p>Immediately after entering the manor, the Dragonborn can hear multiple voices. Beyond the next door is a guard that is looking in the opposite direction. The Dragonborn can either sneak past him to the bedroom or kill him, which will, obviously alert the others. Then, they are to go down the stairs and ignore the guard at the other end of the area, and go through a closed set of doors. On the far left of the room there will be a suspicious-looking cabinet, the Dragonborn needs to open it and push the back out to find another set of stairs to go down. Here, a large opening is found, leading into a series of tunnels.</p>
                The TunnelsEdit

                <p>It is not difficult to navigate through the tunnels, but one should be wary of a tripwire that activates a series of lethal blades. Upon reaching the doorway, the Dragonborn needs to stand next to it, as when it is opened, poison darts are shot forth. There is a lot of valuable loot in the room - a hoard of jewels in a bowl, The Red Kitchen Reader,  as well as a larceny target, the Bust of the Gray Fox, which after being sold to Delvin Mallory for some septims, becomes a decoration in the Cistern. In addition, Chillrend may be taken from its display case. This unique weapon is one of the most powerful one-handed swords in Skyrim, if the manor is entered once the Dragonborn is at least level 46. With the loot taken, the Dragonborn must make sure to pick up Mercer's Plans.</p>
                Back in the CisternEdit

                <p>Continuing on through the last tunnel, the Dragonborn will find themselves at the door to The Ratway Vaults. Following the quest objective marker back to Brynjolf and talking to him completes the quest. </p>
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