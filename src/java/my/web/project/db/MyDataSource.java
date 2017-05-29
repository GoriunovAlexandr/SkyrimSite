/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package my.web.project.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author iucosoft10
 */
public class MyDataSource {
    
    private static final Logger LOG = Logger.getLogger(MyDataSource.class.getName());
    
    private static MyDataSource instance;
    
    public static MyDataSource getInstance(){
        if(instance == null){
            try {
                instance = new MyDataSource();
            } catch (SQLException ex) {
                Logger.getLogger(MyDataSource.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return instance;
    }
    
    private MyDataSource() throws SQLException{
        loadProperties();
        loadDriver();
        createConnection();
    
    }

    private void loadProperties() {
        LOG.info("load Properties");
    }

    private void loadDriver() {
        
        try {
            Class.forName(driverName);
            LOG.info("driver loaded . . ");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MyDataSource.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

    public Connection createConnection() throws SQLException {
        if(connection == null ||  (connection != null && connection.isClosed())){
            connection = DriverManager.getConnection(dburl, dbuser, dbpassword);
        }
        return connection;
    }
    /*
    private String driverName = "com.mysql.jdbc.Driver";
    private String dbuser = "root";//mvcdbuser
    private String dburl = "jdbc:mysql://localhost:3306/mvcdb";
    private String dbpassword = "root";//1234
    private Connection connection;
    */
    
    private String driverName = "com.mysql.jdbc.Driver";
    private String dbuser = "root";//mvcdbuser
    private String dburl = "jdbc:mysql://localhost:3306/mywork";
    private String dbpassword = "root";//1234
    private Connection connection;
    
    
    
   /* public static void main(String[] args) {
        LOG.info("test connection");
        
  
            MyDataSource ds = MyDataSource.getInstance();
            LOG.info("DataSource created");
            
            Connection conn = ds.createConnection();
            if(conn != null){
                LOG.info("Go!");
            }
            
            
       
    }*/
}
