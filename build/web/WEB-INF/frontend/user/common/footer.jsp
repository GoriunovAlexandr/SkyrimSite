<%-- 
    Document   : footer
    Created on : Nov 17, 2015, 8:33:41 PM
    Author     : user1
--%>

<!--<hr/>-->
<div id="footer">
<center><h3>All Right Reserved</h3></center>

<%
    Integer count_vision=0;
    ServletContext context = request.getSession().getServletContext();
    if(context.getAttribute("count_vision") != null)
        count_vision = (Integer)context.getAttribute("count_vision"); 

    Integer count_users=0;
    if(context.getAttribute("count_users") !=null)
        count_users = (Integer)context.getAttribute("count_users");
%>


        
        <p>Users Visited this Site: <%=count_vision%></p>
        <p>Users OnLine: <%=count_users%></p>
        
</div>