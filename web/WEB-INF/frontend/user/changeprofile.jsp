
<%@page import="my.web.project.users.MyFileUtil"%>
<%@page import="my.web.project.users.UserConstants"%>
<%@page import="my.web.project.entities.MyUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Profile</title>
        <link href="dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="signin.css" rel="stylesheet">
        <link rel="stylesheet" href="dist/css/style.css">
    </head>
    <body>
        <div id="wrapper">
     <jsp:include page="./common/header.jsp"/>
     <div id="change_profile_block"> 
         <center><h1>Update Profile</h1></center>

        <form action="update_profile_process" method="POST" class="form-signin">
            <p>User Name:   <input type="text" name="NIK_USER" value="" size="10" class="form-control"/>
            <p>First Name:  <input type="text" name="NAME_USER" value="" size="10" class="form-control"/>
            <p>Last Name:  <input type="text" name="LASTNAME_USER" value="" size="10" class="form-control"/>
            <p>Email:      <input type="text" name="EMAIL_USER" value="" size="20" class="form-control"/>
            <p>Password:   <input type="password" name="PASSWORD1" value="" size="10" class="form-control"/>
            <p>Confirm Password:  <input type="password" name="PASSWORD2" value="" size="10" class="form-control"/>
                <input type="submit" style="margin-top: 10px;" value="UPDATE" class="btn btn-lg btn-primary btn-block"/><input type="reset" value="CLEAR" class="btn btn-lg btn-primary btn-block" />
        </form>
     <!--   <div style="width: 45%; float:left;">   --><!--   <p>id <input type="hidden" name="PRODUS_ID" value="" size="6" readonly="readonly" /></p>  width="300px" -->
     <%MyUser user = (MyUser)session.getAttribute(UserConstants.CMSUSER);%>
        <form action="saveupdateimage" method="POST" enctype="multipart/form-data" >
         
            <p><input type="file" name="IMAGE_NAME" value="${user.imageName}" width="100" /></p>

            <p><input type="submit" value="SAVE/PDATE" /> </p>

            <p><img src="../<%=MyFileUtil.USER_IMAGES_FOLDER %>/${user.avatar}"     
                    alt="${produs.imageName}" /></p><!-- width="300px" -->

        </form>
     <!--         </div>   -->
        </div> 
        <jsp:include page="common/footer.jsp"/>
        </div>
    </body>
</html>
