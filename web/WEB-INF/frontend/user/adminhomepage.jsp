<%-- 
    Document   : adminhomepage
    Created on : Nov 24, 2015, 12:31:41 AM
    Author     : user1
--%>

<%@page import="my.web.project.users.UserConstants"%>
<%@page import="my.web.project.entities.MyUser"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="wrapper">
            <%MyUser user = (MyUser) session.getAttribute(UserConstants.CMSADMIN);

                    if (user != null) {
                %>

                <jsp:include page="./common/header.jsp"/>

                <%
                } else {
                %>
                <jsp:include page="../common/header.jsp"/>

                <% }
                %>
        <div id="adminpage">
            
            <h1>You Are in ADMIN Home Page</h1>

            <%
                List<MyUser> userList = (List<MyUser>) request.getAttribute("users");

                if (userList.size() > 0) {

            %> 
            <h2>Users Table: </h2>
            <table id="admin_table">
                <thead>
                <th>ID</th>             
                <th>NIKNAME</th>             
                <th>NAME</th>             
                <th>LASTNAME</th>    
                <th>EMAIL</th>    
                <th>PASSWORD</th>   
                <th>Enabled</th>  
                <th>Edit Status</th> 
                <th>Delete User</th> 
            </thead>
            <tbody>
                <%  MyUser usr = null;
                    for (int i = 0; i < userList.size(); i++) {
                        usr = userList.get(i);
                %>
                <tr>
                    <td><%=usr.getId()%></td>
                    <td><%=usr.getNikuser()%></td>
                    <td><%=usr.getUsername()%></td>
                    <td><%=usr.getUserlastname()%></td>
                    <td><%=usr.getEmailuser()%></td>
                    <td><%=usr.getPassword()%></td>
                    <td><%=usr.isEnabled()%></td>
                    <td><a class="admin_table_link" href="editstatus?id=<%=usr.getId()%>">Edit Status</a></td>
                    <td><a class="admin_table_link" href="deleteuser?id=<%=usr.getId()%>">Delete User</a></td>
                </tr>
                <%
                    }
                %>   
            </tbody>
        </table>

            <%
            } else {
                out.println("<h3>There are no registered user found! </h3>");

            }

        %>
        </div>
    <jsp:include page="common/footer.jsp" />
    </div>
    </body>
</html>
