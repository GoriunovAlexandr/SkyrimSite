/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package my.web.project.frontend.userin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import my.web.project.db.MD5;
import my.web.project.entities.MyUser;
import my.web.project.frontend.registration_process;
import my.web.project.users.LoginValidationException;
import my.web.project.users.MyUserServiceImpl;
import my.web.project.users.MyUserServiceIntf;
import my.web.project.users.UserConstants;

/**
 *
 * @author user1
 */
public class update_profile_process extends HttpServlet {
    private static final Logger LOG = Logger.getLogger(update_profile_process.class.getName());

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
              List<String> errors = new ArrayList<>();
        String parolaCriptata = "";
        String page="login";
        
        HttpSession session =request.getSession();
        int ursid = ((MyUser)session.getAttribute(UserConstants.CMSUSER)).getId();
        try {
            String idStr = request.getParameter("id");
            String nikuser=request.getParameter("NIK_USER");
            String username=request.getParameter("NAME_USER");
            String userlastname=request.getParameter("LASTNAME_USER");
            String emailuser=request.getParameter("EMAIL_USER");
            String password1=request.getParameter("PASSWORD1");
            String password2=request.getParameter("PASSWORD2");

            LOG.info("**********Username: "+username+"    Password: "+password1);
            
        
            //2.
            valideazaLoginForm(nikuser, username, userlastname, emailuser,  password1, password2, errors);
            
            
            if(password1.equals(password2)){
                parolaCriptata =MD5.checkMD5(password1);
                MyUserServiceIntf userservice = MyUserServiceImpl.getInstance();
                //String  idStr = request.getParameter("id");
                //int id = Integer.parseInt(idStr);
                MyUser user = userservice.findUserById(ursid);

                user.setNikuser(nikuser);
                user.setUsername(username);
                user.setUserlastname(userlastname);
                user.setEmailuser(emailuser);
                user.setPassword(parolaCriptata);
                
                
                //userservice.registerNewUser(nikuser, username, userlastname, emailuser,  parolaCriptata, null,true);
                userservice.updateUser(user);
            }else{
                request.setAttribute("NUMEUTILIZATOR", username);
                errors .add("No Access!!!");
                //throw new AuthentificationException();
                //throw new Exception();
                page="register";
                request.getRequestDispatcher(page).forward(request, response);// pasul 2
            }
            
            
            
            
            request.getRequestDispatcher(page).forward(request, response);
            
            
            
        } catch (LoginValidationException ex) {
            Logger.getLogger(registration_process.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(registration_process.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void valideazaLoginForm(String nikuser,
                                    String username,
                                    String userlastname,
                                    String emailuser, 
                                    String password1, 
                                    String password2,
                                    List<String> errors) throws LoginValidationException{
        
        if(nikuser ==null ||(nikuser !=null && username.isEmpty())){
                errors.add("NIK NAME IS NULL");   
        }
        
        if(username ==null ||(username !=null && username.isEmpty())){
                errors.add("NAME IS NULL");     
        }
        
        if(userlastname ==null ||(userlastname !=null && userlastname.isEmpty())){
                errors.add("LASTNAME IS NULL");     
        }
        
        if(emailuser ==null ||(emailuser !=null && emailuser.isEmpty())){
                errors.add("USER EMAIL IS NULL");         
        }
        
        if(password1 ==null ||(password1 !=null && password1.isEmpty())){
                errors.add("PASSWORD IS NULL");          
        }
        
        if(password2 ==null ||(password2 !=null && password2.isEmpty())){
                errors.add("PASSWORD CONFIRMATION IS NULL");          
        }
        
        if(errors.size() > 0){
            throw new LoginValidationException(" username not good");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
