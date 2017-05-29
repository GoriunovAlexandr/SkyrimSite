<%-- 
    Document   : homepage
    Created on : Nov 17, 2015, 8:44:59 PM
    Author     : user1
--%>

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
            <%MyUser user = (MyUser)session.getAttribute(UserConstants.CMSUSER);
            MyUser adminUser = (MyUser) session.getAttribute(UserConstants.CMSADMIN);

                //int userid=someuser.getId();
                if (user != null || adminUser != null) {
                %>
            
                <jsp:include page="./user/common/header.jsp"/>
            
            <%
            }else{
                %>
            <jsp:include page="common/header.jsp"/>
                
           <% }
            %>

        <!--<jsp : include page="common/header.jsp"/>-->
        
       
        <img src="./dist/img/head.jpg" alt="Logo" height="650" width="1000"/>
        
        <div id="main_content">
            <jsp:include page="common/leftmenu.jsp"/>
            <div id="for_slider">
        <!--                <h2>Fade Example</h2>-->

                  <!--  Outer wrapper for presentation only, this can be anything you like -->
                  <div id="banner-fade">

                    <!-- start Basic Jquery Slider -->
                    <ul class="bjqs">
                        <li><a href="main_story"><img src="dist/slider/img/skyrim-hero.jpg" height="420" width="800"></a></li>
                        <li><a href="companions"><img src="dist/slider/img/0953582.jpg" height="500" width="800"></a></li>
                        <li><a href="college_of_winterhold"><img src="dist/slider/img/college_sign.png" height="550" width="800"></a></li>
                        <li><a href="thieves_guild"><img src="dist/slider/img/thief_sign.jpg" height="550" width="800"></a></li>
                        <li><a href="imperial_legion"><img src="dist/slider/img/Legion_Stormcloaks.png.jpg" height="450" width="800"></a></li>
                        <li><a href="dark_brotherhood"><img src="dist/slider/img/6616-1-1327053549.jpg" height="450" width="800"></a></li>
                        <li><a href="stormcloaks"><img src="dist/slider/img/storm.jpg" height="450" width="800"></a></li>
                        <li><a href="bards_college"><img src="dist/slider/img/bards.png" height="450" width="800"></a></li>
                    </ul>
                    <!-- end Basic jQuery Slider -->

                  </div>
                  <!-- End outer wrapper -->
                  <p>The Elder Scrolls V: Skyrim is an action role-playing open world video game developed by Bethesda Game Studios and published by Bethesda Softworks. It is the fifth installment in The Elder Scrolls series, following The Elder Scrolls IV: Oblivion. Skyrim was released worldwide on November 11, 2011, for Microsoft Windows, PlayStation 3, and Xbox 360. Three downloadable content (DLC) add-ons were released—Dawnguard, Hearthfire, and Dragonborn—which were repackaged into The Elder Scrolls V: Skyrim – Legendary Edition, which was released on June 4, 2013.</p>

            <p>Skyrim's main story revolves around the player character and their effort to defeat Alduin the World-Eater, a dragon who is prophesied to destroy the world. The game is set two hundred years after the events of Oblivion and takes place in the fictional province of Skyrim. Over the course of the game, the player completes quests and develops the character by improving skills. Skyrim continues the open world tradition of its predecessors by allowing the player to travel anywhere in the game world at any time, and to ignore or postpone the main storyline indefinitely.</p>

            <p>The game was developed using the Creation Engine, rebuilt specifically for the game. The team opted for a unique and more diverse game world than Oblivion's Cyrodiil, which game director and executive producer Todd Howard considered less interesting by comparison. Skyrim was released to critical acclaim, with reviewers particularly mentioning the refined character development and the great setting, and is considered to be one of the greatest video games of all time. The game shipped over seven million copies to retailers within the first week of its release, and sold over 20 million copies across all three platforms.</p>
        

          </div>
            <div style="clear:both"></div>
            
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

        <jsp:include page="common/footer.jsp"/>
    </div>
    </div>
    </body>
</html>