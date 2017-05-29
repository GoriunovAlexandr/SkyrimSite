/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package my.web.project.users;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import my.web.project.db.MyDataSource;
import my.web.project.entities.Comment;
import my.web.project.entities.MyUser;

/**
 *
 * @author iucosoft10
 */
public class MyUserServiceImpl implements MyUserServiceIntf{

    private static  MyUserServiceIntf instance;
    private MyDataSource datasource;
    private Connection conn;
    private static final Logger LOG = Logger.getLogger(MyUserServiceImpl.class.getName());
    

    private MyUserServiceImpl() {
        datasource = MyDataSource.getInstance();
    }
    
    
    
    

    public static MyUserServiceIntf getInstance() {
        if(instance == null){
            instance= new MyUserServiceImpl();
        }
        
        
        return instance;
    }
    
    
    @Override
    public MyUser getByUsernameAndPassword(String username, String password) {
        
        MyUser usr= null;
        String sql = "SELECT id, username, firstname, lastname, useremail, password, enabled FROM USERS WHERE username=? AND password=?";
        
        try{/*
            
            conn = datasource.createConnection();
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,username);
            psmt.setString(2,password);

            ResultSet rs = psmt.executeQuery();
//int id, String username, String password, String nikuser, String userlastname, String emailuser, boolean enabled) {

            if(rs.next()){
                myUser= new MyUser(rs.getInt(1), username, "");
               // myUser = new MyUser(rs.getInt(1),);--------------------------------------------------  Full Constructor
            }
            */
            conn = datasource.createConnection();

            PreparedStatement psmt = conn.prepareStatement(sql);;

            
            psmt.setString(1,username);
            psmt.setString(2,password);
            ResultSet rs = psmt.executeQuery();

            
            if (rs.next()) {
                usr = new MyUser();
                usr.setId(rs.getInt(1));
                usr.setNikuser(rs.getString(2));
                usr.setUsername(rs.getString(3));
                usr.setUserlastname(rs.getString(4));
                usr.setEmailuser(rs.getString(5));
                usr.setPassword(rs.getString(6));
                usr.setEnabled(rs.getBoolean(7));
                //lista.add(usr);
                // myUser= new MyUser(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getBoolean(7));
            }
        } catch(SQLException ex){
            LOG.info("SQL Exception!!!");
        }
        return usr;
    }
    
    
    
    public void updateLoginDate(MyUser myUser){
        String sql = "SELECT * FROM USERS WHERE username=? AND password=?";
         try{
            
            conn = datasource.createConnection();
            Statement psmt = conn.createStatement();
            psmt.executeUpdate(sql);
            
        } catch(SQLException ex){
            LOG.info("SQL Exception!!!");
        }
    }

    @Override
    public void registerNewUser(String nikuser, String username, String userlastname, String emailuser, String password, byte[] avatar, boolean enabled) throws SQLException {

         String sql = "INSERT INTO USERS (username, firstname, lastname, useremail, password, avatar, enabled) VALUES (?,?,?,?,?,?,?);";
        try {
            conn = datasource.createConnection();
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, nikuser);
            psmt.setString(2, username);
            psmt.setString(3, userlastname);
            psmt.setString(4, emailuser);
            psmt.setString(5, password);
            psmt.setBytes(6, avatar);
            psmt.setBoolean(7, enabled);

            psmt.executeUpdate();

        } catch (SQLException ex) {
            LOG.severe("save produs " + ex);
        }
    }
    
    
    @Override
    public void updateUser(MyUser user) throws SQLException {

         String sql = "UPDATE USERS SET username=?, firstname=?, lastname=?, useremail=?, password=?, avatar=?, enabled=? WHERE id=?;";
        try {
            conn = datasource.createConnection();
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, user.getNikuser());
            psmt.setString(2, user.getUsername());
            psmt.setString(3, user.getUserlastname());
            psmt.setString(4, user.getEmailuser());
            psmt.setString(5, user.getPassword());
            psmt.setBytes(6, user.getAvatar());
            psmt.setBoolean(7, user.isEnabled());
            psmt.setInt(8, user.getId());

            psmt.executeUpdate();

        } catch (SQLException ex) {
            LOG.severe("updateuser " + ex);
        }
       
    }
    
    @Override
    public List<MyUser> findAllUser() {

        List<MyUser> lista = new ArrayList<>();

        String sql = "SELECT id, username, firstname, lastname, useremail, password, enabled FROM USERS";
        try {
            conn = datasource.createConnection();

            Statement stat = conn.createStatement();

            ResultSet rs = stat.executeQuery(sql);

            MyUser usr = null;
            while (rs.next()) {
                usr = new MyUser();
                usr.setId(rs.getInt(1));
                usr.setNikuser(rs.getString(2));
                usr.setUsername(rs.getString(3));
                usr.setUserlastname(rs.getString(4));
                usr.setEmailuser(rs.getString(5));
                usr.setPassword(rs.getString(6));
                usr.setEnabled(rs.getBoolean(7));
                lista.add(usr);

            }

        } catch (SQLException ex) {
            LOG.severe("findAllUsers() " + ex.getMessage());
        }

        return lista;
    }
    
    
    
    
    
    @Override
    public void updateUserStatus(MyUser user) {
        String sql = "UPDATE USERS SET enabled=? WHERE id=? ;";

        try {
            conn = datasource.createConnection();
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(2, user.getId());
            psmt.setBoolean(1, user.isEnabled());

            psmt.executeUpdate();

        } catch (SQLException ex) {
            LOG.severe("update produs " + ex);
        }

    }

    @Override
    public void deleteUser(MyUser user) { //public void delete(int id) {
        String sql = "DELETE FROM USERS WHERE id=" + user.getId() + ";";

        try {
            conn = datasource.createConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);

        } catch (SQLException ex) {
            LOG.severe("delete produs " + ex);
        }

    }
    
    
    
    @Override
    public MyUser findUserById(int id) {
        MyUser usr = null;
        String sql = "SELECT id, username, firstname, lastname, useremail, password, enabled FROM USERS WHERE id=" + id;
        try {
            conn = datasource.createConnection();

            Statement stat = conn.createStatement();

            ResultSet rs = stat.executeQuery(sql);

            while (rs.next()) {
                usr = new MyUser();
                usr = new MyUser();
                usr.setId(rs.getInt(1));
                usr.setNikuser(rs.getString(2));
                usr.setUsername(rs.getString(3));
                usr.setUserlastname(rs.getString(4));
                usr.setEmailuser(rs.getString(5));
                usr.setPassword(rs.getString(6));
                usr.setEnabled(rs.getBoolean(7));

            }

        } catch (SQLException ex) {
            LOG.severe("findAllProduses() " + ex.getMessage());
        }

        return usr;

    }
    
    @Override
    public void saveUserComment(String page, String userName, String comment,int like) throws SQLException {

         String sql = "INSERT INTO COMMENTS (page, userName, comment,like_count) VALUES (?,?,?,?);";
        try {
            conn = datasource.createConnection();
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, page);
            psmt.setString(2, userName);
            psmt.setString(3, comment);
            psmt.setInt (4, like);

            psmt.executeUpdate();

        } catch (SQLException ex) {
            LOG.severe("save produs " + ex);
        }
    }
    
    @Override
    public void deleteUserComment(Comment comment) throws SQLException {
        
        String sql = "DELETE FROM COMMENTS WHERE id=" + comment.getId() + ";";

        try {
            conn = datasource.createConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);

        } catch (SQLException ex) {
            LOG.severe("delete produs " + ex);
        }
    }
    
    
    @Override
    public List<Comment> loadAllComments(String page) throws SQLException{

        List<Comment> commentslist = new ArrayList<>();

        String sql = "SELECT id, page, userName, comment, like_count FROM COMMENTS WHERE page=" + "'" + page + "'"+"ORDER BY like_count DESC";//   
        try {
            
            conn = datasource.createConnection();

            Statement stat = conn.createStatement();

            ResultSet rs = stat.executeQuery(sql);

            Comment coment = null;
            while (rs.next()) {
                coment = new Comment();
                coment.setId(rs.getInt(1));
                coment.setPage(rs.getString(2));
                coment.setUserName(rs.getString(3));
                coment.setComment(rs.getString(4));
                coment.setLike(rs.getInt(5));
                
                commentslist.add(coment);
            }

        } catch (SQLException ex) {
            LOG.severe("findAllProduses() " + ex.getMessage());
        }
        
        

        return commentslist;
    }
    
    
    
    @Override
    public void updateComentLike(Comment comment) {
        String sql = "UPDATE COMMENTS SET like_count=? WHERE id=? ;";

        try {
            /*int count = comment.getLike();
            count++;*/
            conn = datasource.createConnection();
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(2, comment.getId());
            psmt.setInt(1, comment.getLike());

            psmt.executeUpdate();

        } catch (SQLException ex) {
            LOG.severe("update produs " + ex);
        }
    }
    
    @Override
    public Comment findCommentById(int id) {
        Comment com = null;
        //String sql = "SELECT id, username, firstname, lastname, useremail, password, enabled FROM USERS WHERE id=" + id;
        String sql = "SELECT id, page, userName, comment, like_count FROM COMMENTS WHERE id=" + id;
        try {
            conn = datasource.createConnection();

            Statement stat = conn.createStatement();

            ResultSet rs = stat.executeQuery(sql);

            while (rs.next()) {
                com = new Comment();
                com.setId(rs.getInt(1));
                com.setPage(rs.getString(2));
                com.setUserName(rs.getString(3));
                com.setComment(rs.getString(4));
                com.setLike(rs.getInt(5));


            }

        } catch (SQLException ex) {
            LOG.severe("findAllProduses() " + ex.getMessage());
        }

        return com;

    }
    
    @Override
    public byte[] getImageDataById(int id) {

        byte[] bytes = null;
        String sql = "SELECT avatar FROM USERS WHERE id="+id;
        int size=0;
        try {
            conn = datasource.createConnection();

            Statement stat = conn.createStatement();

            ResultSet rs = stat.executeQuery(sql);

            //Blob bbytes=rs.getBlob(1);
            if (rs.next()) {

                InputStream is = rs.getBinaryStream(1);
                if(is != null){
                   size = is.available();
                }
                bytes = new byte[size];

                System.out.println("SIZE = " + size);
                if(is != null){
                    is.read(bytes);
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            LOG.severe("getImageDataByImageName()111 " + ex.getMessage());
        } catch (IOException ex) {
            LOG.log(Level.SEVERE, "getImageDataByImageName()", ex);
        }
        return bytes;
    }
    

}
