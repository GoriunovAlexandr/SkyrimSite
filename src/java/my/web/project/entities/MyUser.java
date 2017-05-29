/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package my.web.project.entities;

/**
 *
 * @author iucosoft10
 */


public class MyUser {
    
    private int id;
    private String username;
    private String password;
    
    private String nikuser;
    private String userlastname;
    private String emailuser;     
    private byte[] avatar;
    private boolean enabled;

    public MyUser() {
    }

    public MyUser(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public MyUser(int id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }
    public MyUser(int id, String username, String password, String nikuser, String userlastname, String emailuser, boolean enabled) {
        this.id = id;
        this.username = username;
        this.password = password;
        
        this.nikuser = nikuser;
        this.userlastname = userlastname;
        this.emailuser = emailuser;
        
        this.enabled = enabled;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "MyUser{" + "id=" + id + ", username=" + username + '}';
    }

    public String getNikuser() {
        return nikuser;
    }

    public void setNikuser(String nikuser) {
        this.nikuser = nikuser;
    }

    public String getUserlastname() {
        return userlastname;
    }

    public void setUserlastname(String userlastname) {
        this.userlastname = userlastname;
    }

    public String getEmailuser() {
        return emailuser;
    }

    public void setEmailuser(String emailuser) {
        this.emailuser = emailuser;
    }

    public byte[] getAvatar() {
        return avatar;
    }

    public void setAvatar(byte[] avatar) {
        this.avatar = avatar;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
    
    
}
