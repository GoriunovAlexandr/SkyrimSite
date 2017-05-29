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
                        <p>The Companions are a group of warriors who take on private and public contracts for the people of Skyrim, and who purportedly carry on the tradition of the Five Hundred Companions of Ysgramor. It fulfills the same role the Fighters Guild does in other parts of Tamriel. They are based in the city of Whiterun, within the mead hall Jorrvaskr. The most elite members are included in the Circle of Jorrvaskr, and the chief councilor and arbitrator is known as the Harbinger, after Ysgramor, the "harbinger of us all" and the only real recognized leader of the Companions. Each new Harbinger is chosen by the last.

                            To learn more of the Companions and their history, see the lore article.</p>
                        <p>Taking Up Arms is the first quest you are given after going to the ancient hall Jorrvaskar, in Whiterun, and expressing a desire to join the The Companions. Essentially it just conists of doing some training withVilkas, giving Vilka’s sword to Eorlund, fetching Aela her shield and following Farkas to your quarters within The Companions headquarters.</p>

                        <div class="image_content"><img src="./dist/img/quests/companions/comp1.jpg" alt="alt1" height="400" width="680"/></div>

                        <p>After you speak to The Companion’s leader about joining them, he’ll tell you to go outside and train with another Companion named Vilkas. Follow him out to the courtyard, and if you lose sight of him, he’ll be outside practicing with one of the target dummies until you arrive. Speak with him and he will tell you that the “old man” told him to have a look at you. He will then instruct you to take a few swings at him so he can gauge your skill. Vilkas will draw his sword and shield but does not attack you, so swing away all you want. After about three swings, and a few humbling remarks, this first task of the quest ends with Vilkas giving you his sword to take to Eorlund the blacksmith.</p>

                        <p>Eorlund Gray-Mane is found right next to the courtyard, up some stairs and next to a large blacksmith’s forge that is something of a local landmark and is known as the ‘skyforge’. Talk to him and explain that Vilkas sent you with his sword. After offering you some advice, Eorlund tells you that he is not a Companion, but since no one else can work the forge, he helps them out as best he can. After talking some more about his thoughts on The Companions, he asks you to take Aela’s shield back to her as his wife is in mourning. Once you accept, he gives the shield to you.</p>

                        <p>Leave the skyforge and go back into Jorrvaskr. Head down to the living quarters, where you will find Aela the Huntress in her room with Skjor. Talk to her and return her shield. Skjor makes mention that he saw you training in the courtyard with Vilkas, and Aela says she wonders whether you could take Vilkas in a real fight. If you answer with the second choice, she explains that Companion shield-brothers do not kill each other over a dispute, but is impressed with the passion that burns in you, expressing the belief that you will make a fierce Companion. They then summon Farkas to show you where you will be living and sleeping while you are among them.</p>

                        <div class="image_content"><img src="./dist/img/quests/companions/codlac.png" alt="alt1" height="400" width="500"/></div>

                        <p>Follow Farkas as he takes you to where you’ll be staying in Jorrvaskr. After some conversation, he tells you that if you’re looking for work, you should speak to Aela or himself. Once you start making a name for yourself, he tells you to see Skjor or Vilkas for additional work. Before you part, Farkas will tell you about some trouble they’re having in Whiterun Hold. It appears there is a problem with the Forsworn, and he warns you to be careful. If you accept this job, it will start the quest Trouble in Skyrim. Before you leave Farkas will also offer you the Hired Muscle quest.</p>           

                        <p>After successfully completing Take Up Arms and one of the radiant quests, speaking to most of the other Companions will point you in the direction of Skjor to get your next major assignment. Go see him and Skjor will tell you that a scholar has discovered another fragment of the mythical Wuuthrad, and will introduce Farkas as your shield-sibling on this job.

                        <div class="image_content"><img src="./dist/img/quests/companions/Jorrvaskr_Skyrim.png" alt="alt1" height="400" width="500"/></div>

                        <p>Farkas will explain more about the Wuuthrad as well as fill you in on your destination; Dustman’s Cairn, a barrow far west of Whiterun. You can either have him follow you as you make your way there, or just ask him to rendezvous with you and travel alone. Either way, he will follow you inside. He’s a powerful ally and will make sure that you make it safely through the huge cave system, just be sure to support him in combat whenever he needs it.

                        <p>The barrow is crawling with Draugr, both living and dead, so be prepared to get your hands dirty. Be sure to read or pick up the Two-handed skill book The Battle of Sancre Tor, which you will find in the first room, then move forward and fight the hordes of undead. The second chamber contains an Arcane Enchanter and two thrones, with the only available path blocked by a gate. Locate the northernmost room, take the potions and pull a lever that will instantly lower another gate and trap you in the small room. On the other side, Farkas promises to find a way to release you, but will then be surrounded by an unexpected group of Silver Hand members who come pouring into the room.

                        <p>The Silver Hand turns out to be here for a reason. While you watch, just as it seems that Farkas is surrounded and probably about to die, Farkas will transform himself into a werewolf and literally tear his attackers apart. After opening the gate, Farkas will explain about the “blessing” given to most Companions. While not being particularly informative, he will tell you that only certain members are blessed with that ability, before suggesting that you both proceed with the mission. Loot the corpses of the Silver Hand members and move forward through the cave system until you reach the entrance to the second area of this dungeon, Dustman’s Crypt.

                        <div class="image_content"><img src="./dist/img/quests/companions/smith.jpg" alt="alt1" height="400" width="500"/></div>

                        <p>As you move through this second area you will face more Draugr and more Silver Hand members. Of the Silver Hand you encounter here, two have very high one or two hand weapon skill, and might eliminate you in a few hits if you don’t defend yourself carefully. You might try luring the Silver Hand members to where the Draugr lie in their crypts waiting to come alive; let the two groups of enemies reduce each other’s numbers before you mop up the survivors. If you struggle at any point, stay in the background and let Farkas engage the enemy in close combat while you hit them with arrows or spells.

                        <p>You will eventually come to a chamber with many sealed alcoves and coffins that will hint at what you’ll be facing. Loot the many minor containers for treasure, then follow the map marker to the alter where the Fragment of Wuuthrad lies. Look on the wall behind the fragment and learn the Fire Breath Dragon Shout from the inscription.

                        <p>Take the fragment from the alter and watch as numerous Draugrs emerge from the coffins and attack you and Farkas. This can be quite a fight depending on your level. If you have a stored dragon soul, you might want to use it to unlock the shout you just learned, as Draugr are vulnerable to fire. Alternately, if you have a high enough Sneak skill you can stay hidden on the alter where you got the fragment and shoot at the attacking Draugr from there. You can greatly increase your Archery and Sneak skills doing this. Farkas will usually end up fighting three or four Draugrs by the stairs on the right.

                        <p>After the battle, a path will open from the balcony above that will lead you back near the entrance to Skyrim.
                            Back in Whiterun, you will find Vilkas waiting for you outside the
                            Back in Whiterun, you will find Vilkas waiting for you outside the Companions’ headquaters of Jorrvaskr. He will then lead you around the building to where the whole group of Companions are gathered in waiting. Guild head Kodlak Whitemane will give a short speech and welcome you to the Companions, while Farkas will swear eternal loyalty to you. You are now an official member of the Companions, but will have to complete another radiant quest before you receive another major assignment.</p>
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
                        //MyUser user = (MyUser)session.getAttribute(UserConstants.CMSUSER);
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
                                <p><a href="incrementLike?id=<%=showcomment.getId()%>&PAGENAME=companions"><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%>   </a> </p>
                                <%}else{%>
                                    <p><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%></p>
                                    <%}%>
                            </div>
                            <div class="delete_comment">
                                <%if(adminUser != null){%>
                                <a href="deletecomment?id=<%=showcomment.getId()%>&PAGENAME=companions"><img src="./dist/img/delete.png" alt="alt1" height="20" width="20" /></a>
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
                        <input type="hidden" name="PAGENAME" value="COMPANIONS"/>
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