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
               
                <p>Natives of the cosmopolitan province of Cyrodiil, the Imperials are some of the most well-educated, wealthy and well-spoken of the races in Tamriel. Imperials are also known for their discipline and training of their citizen armies. Because of this, the Imperials have dominated Tamriel for more than 2,000 years. </p>

                <div class="image_content"><img src="./dist/img/races/imperial/imperial1.jpg" alt="alt1" height="375" width="500"/></div>
                
                <p>Imperials can be differentiated from Bretons and Nords by their fair to swarthy skin, as opposed to the typically fairer complexion of Bretons and Nords. However, Imperial skin tone is not as dark as that of Redguards. Imperials also have slightly sharper faces than other races of men. In The Elder Scrolls V: Skyrim, if they are not part of the Imperial Legion, they typically serve as diplomats, traders, stewards, and craftsmen — which is well-suited, since Imperials are known for their diplomatic skills and cosmopolitan ideology.</p>

                <p>The phrase "Imperial Race" is a bit of a misnomer. The people of Cyrodiil are divided into two ethno-cultural groups: Nibeneans and Colovians. Both descend from the native Nedic and Cyro-Nordic peoples that were enslaved by the Ayleids, but diverged a bit after consecutive invasions and interactions with other races. Colovian Imperials in Western Cyrodiil are more Nordic, sharing similar beliefs such as a heavy martial and seafaring tradition. Nibeneans have an Akaviri and, to a lesser degree, elven heritage. They have a greater appreciation for magic, art, commerce, and spirituality, in spite of being staunchly loyal to Alessian traditions. Both groups reflect the Empire's culture — a hybrid of Nordic, Aldmeri, and Akaviri culture. </p>
                
               
                <div class="image_content"><img src="./dist/img/races/imperial/imperial2.jpg" alt="alt1" height="250" width="400"/></div>
                
                <h3>Skill bonuses</h3>

                    +10 Restoration (25)<br/>
                    +5 Block (20)<br/>
                    +5 Destruction (20)<br/>
                    +5 Enchanting (20)<br/>
                    +5 Heavy Armor (20)<br/>
                    +5 One-Handed (20) <br/>

                <h3>Starting spells</h3>

                    > Flames (Destruction)<br/>
                    > Healing (Restoration) 

                <p>The starting spells are more important than in the past games as the only way to learn additional spells is to find spell tomes or buy them from merchants or court mages. The Flames spell, which when cast produces a continuous stream of fire, is a starting spell for all races, as is Healing.
                
                <h3>Special abilities</h3>

                    Voice of the Emperor: calms nearby humanoids for 60 seconds.<br/>
                    Imperial Luck: anywhere gold might be found, Imperials always seem to find a few more. 


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
                                <%if (user != null) {%>
                                <p><a href="incrementLike?id=<%=showcomment.getId()%>&PAGENAME=races_imperial"><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%>   </a> </p>
                                        <%} else {%>
                                <p><img src="./dist/img/checkbox.png" alt="alt1" height="14" width="14" /> <%=showcomment.getLike()%></p>
                                    <%}%>
                            </div>
                            <div class="delete_comment">
                                <%if (adminUser != null) {%>
                                <a href="deletecomment?id=<%=showcomment.getId()%>&PAGENAME=races_imperial"><img src="./dist/img/delete.png" alt="alt1" height="20" width="20" /></a>
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
                        <input type="hidden" name="PAGENAME" value="IMPERIAL"/>
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


