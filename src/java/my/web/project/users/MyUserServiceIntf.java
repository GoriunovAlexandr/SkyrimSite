/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package my.web.project.users;


import java.sql.SQLException;
import java.util.List;
import my.web.project.entities.Comment;
import my.web.project.entities.MyUser;

/**
 *
 * @author iucosoft10
 */
public interface MyUserServiceIntf {
    
    MyUser getByUsernameAndPassword(String username, String password) throws SQLException;
    public void registerNewUser(String nikuser,String username, String userlastname, String emailuser, String password, byte[] avatar, boolean enabled)throws SQLException;
    public void updateLoginDate(MyUser myUser);
    public List<MyUser> findAllUser();
    public void updateUserStatus(MyUser user);
    public void deleteUser(MyUser user);
    public MyUser findUserById(int id);
    public void saveUserComment(String page, String userName, String comment,int like)throws SQLException ;
    public void deleteUserComment(Comment comment) throws SQLException ;
    public List<Comment> loadAllComments(String page) throws SQLException;
    public void updateComentLike(Comment comment);
    public Comment findCommentById(int id);
    public void updateUser(MyUser user) throws SQLException;
    public byte[] getImageDataById(int id);
    
    
}
