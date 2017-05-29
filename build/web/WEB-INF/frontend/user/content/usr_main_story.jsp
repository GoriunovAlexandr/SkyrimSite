<%@page import="my.web.project.users.UserConstants"%>
<%@page import="my.web.project.entities.MyUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.web.project.entities.Comment"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
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

                <p>In the tradition of Elder Scrolls games, you begin Skyrim as a prisoner, one of four prisoners being transported on the back of a cart. The other prisoners are Ralof; a Stormcloak rebel, Lokir; a horse thief and Ulfric Stormcloak, who, according to Ralof, is the true High King of Skyrim and leader of the Stormcloak rebellion against The Empire.</p>

 

<p>You are all in the custody of The Empire and eventually arrive at Helgen, a fortified hamlet in Falkreath Hold. You pass by General Tullius, leader of the Imperial forces in Skyrim, and some of his advisers. The cart stops at a place where soldiers are standing guard around a block on the ground with a man standing next to it wearing a black mask and carrying a large ax. You have arrived at a place of execution and are all about to die.</p>

<p>Lokir attempts to flee and is shot down by archers. One of the Imperial soldiers beckons you toward him and asked your name. This is where you create your character. The soldier, Hadavar, turns to his superior and asks her what is to be done with you, as your name is not on the list of captured rebels. She tells Hadavar to ignore the list and just execute you.</p>

<p>At this point General Tullius begins speaking to Ulfric Stormcloak; a one sided dialogue as Ulfric has his mouth gagged. He is soon interrupted, however, by a strange guttural sound somewhere in the distance. Following a blessing from a Priestess of Arkay who is on hand, someone is taken to the block and decapitated. You are then summoned to the block, as a second roaring sound is heard, closer this time.</p>

<p>As you kneel there with your head down about to die, a gigantic black dragon sweeps down from the sky, lands on Helgen’s central tower and emits a roaring shout (or Thu’um, as it is properly called) that scatters every Imperial and rebel present.</p>

<p>Amid the chaos, Ralof yells at you to follow him and Ulfric into a nearby keep and once inside, beckons you up the steps to the second level. The black dragon breaks through the wall at the top of the steps and covers the vicinity with flames before flying out of view. Jump through the gap in the ruined wall to what remains of the town’s inn. As you land in its upstairs area, descend the steps to ground level and step outside.</p>

<p>Hadvar is there and recommends you follow him. You should do so, and don’t bother stopping to try to help any of the soldiers fighting the dragon or search corpses as you both run through the town trying to find safety, as your hands are bound from when you were captive.</p>

<p>Eventually Hadvar will lead you to the main keep and you will both run into Ralof. After a brief stand off between the two, they turn and head off in separate directions, both calling for you to follow them.</p>

<p>At his point the quest splits into two paths: the first path is sticking with Hadvar and trying to escape the keep with him, the second path is the same, but with Ralof. </p>

<p>The distance and routes of your escapes are pretty much the same with each choice, but your enemies for the next few minutes will be different depending on who you choose to follow. The person you join with here will also affect who you travel with briefly in the next quest, as well as give you a prompt to join a particular side in the Civil War Quests that you will encounter later in this game. But you can still pick whatever side you want after this, if you do those quests, regardless of who you choose to follow now, so just follow whichever one of them you want and don’t worry about it.</p>

<p>Follow Hadvar further into the keep’s barracks, where he removes your bindings and advises you to search the vicinity for any weapons and armor you can find. Make sure you check inside the Warden’s Chest, which will have what you need. Also search the rest of the room as there are weapons on the rack and additional items in another chest. When you’re done, follow Hadvar over to a wooden grating that he opens, allowing you to continue onward to a space where you must pull a chain to open a second grating.</p>

<p>Make sure you’ve got the weapons and armor you just picked up equipped as there’s about to be a fight. Go forward into the next area and kill the Stormcloak soldiers you encounter there. After they’re dead, search their bodies for equipment before unlocking the gate to the west and proceeding on.</p>

<p>Follow Ralof deeper into Helgen’s Keep, where he will encounter the remains of his comrade, Gunjar. After wishing him a quick journey to Sovngarde (Nord afterlife), he cuts your bonds and instructs you to take Gunjar’s gear.</p>

<p>Ralof inspects both exits from the place and finds them locked. He then notices some approaching Imperials and crouches down ready to ambush them. Make sure you’ve got the weapons and armor you just picked up equipped, then attack the soldiers with Ralof. Ransack their corpses afterwards to find more useful items and the key to one of the locked exits. Open the gate to the West and depart.</p>
            </div>
        </div>

            
            
       
        
      <div style="clear:both"></div>
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