/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package my.web.project.frontend;
/*
import com.iucosoft.mvcsite.cms.servicii.Impl.MyUserServiceImpl;
import com.iucosoft.mvcsite.cms.servicii.MyUserServiceIntf;
import com.iucosoft.mvcsite.db.MD5;
import com.iucosoft.mvcsite.entities.MyUser;
import com.iucosoft.mvcsite.util.LoginValidationException;
import com.iucosoft.mvcsite.util.UserConstants;*/
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import my.web.project.db.MD5;
import my.web.project.entities.MyUser;
import my.web.project.users.LoginValidationException;
import my.web.project.users.MyFileUtil;
import my.web.project.users.MyUserServiceImpl;
import my.web.project.users.MyUserServiceIntf;
import my.web.project.users.UserConstants;

/**
 *
 * @author iucosoft10
 */
public class login_process extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final Logger LOG = Logger.getLogger(login_process.class.getName());

    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        LOG.info("******************************I'm in login_process****************************");
        
        String page= "homepage";//userhome
        List<String> errors = new ArrayList<>();
        String dir = MyFileUtil.USER_IMAGES_FOLDER;
        String path = request.getServletContext().getRealPath("") + dir;

        FileOutputStream out = null;
        
        
        //1. preluarea valorilor parametrilor 
        //2. validarea datelor
        //3. autentificarea prin DataBase
        //4. create http session
        //5. put in session a control variable  ->siteuser == User
        //6. trecem la main page p/u CMS
            
        
        try {
            
            
            //1.
            String username=request.getParameter("NUMEUTILIZATOR");
            String password=request.getParameter("PASSWORD");
            LOG.info("**********Username: "+username+"    Password: "+password);
            
            //2.
            valideazaLoginForm(username, password,errors);
            
            //3.
//            String numebun="admin";
//            String parolaBuna = "gdyb21LQTcIANtvYMT7QVQ==";//1234
//            
            LOG.info("*****Validare Reusita*****");
            String parolaCriptata =MD5.checkMD5(password);
            
            //if(numebun.equals(username) && parolaBuna.equals(parolaCriptata)){
            MyUserServiceIntf userservice = MyUserServiceImpl.getInstance();
            MyUser myUser= userservice.getByUsernameAndPassword(username, parolaCriptata);
            
            
            
            LOG.info("*****Autorizare Reusita*****");
            
            if(myUser != null){
                if(myUser.isEnabled() == true){
                 HttpSession session = request.getSession();
                 
               // if("admin".equals(myUser.getUsername())){
                 String name = myUser.getNikuser();
                 if(name.equals("Admin")){
                    session.setAttribute(UserConstants.CMSADMIN, myUser);
                    page = "adminhome";
                }else{
                     session.setAttribute(UserConstants.CMSUSER, myUser);
                 }
                //4
                //HttpSession session = request.getSession(true);///to do a check for admin-user
                
                
                int usrid = myUser.getId();
                byte[] bytes = userservice.getImageDataById(usrid);
                //Load Image!!!
               if(bytes.length > 0){
                    
                    out = new FileOutputStream(new File(path + File.separator + "imageName"+myUser.getId()+".jpg"));
                    if (bytes != null) {
                        out.write(bytes);
                        out.close();
                    }
                }
                
               //get&put user_count
                Integer count_users=0;
                ServletContext context = request.getSession().getServletContext();
                if(context.getAttribute("count_users") !=null)
                    count_users = (Integer)context.getAttribute("count_users");
                count_users++;
                context.setAttribute("count_users", count_users);
               
               
                userservice.updateLoginDate(myUser);
                }else{
                    request.setAttribute("NUMEUTILIZATOR", username);
                    errors .add("User is Banned or Disconected!");
                    //throw new AuthentificationException();
                    throw new Exception();
                }
            }
            else{
                request.setAttribute("NUMEUTILIZATOR", username);
                errors .add("Incorect Password or Username");
                //throw new AuthentificationException();
                throw new Exception();
            }
            
        } catch (Exception ex) {
            
            
            request.setAttribute("errors", errors);
           
            page = "/WEB-INF/frontend/login.jsp";
            
        }
        
        request.getRequestDispatcher(page).forward(request, response);// pasul 2
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

    private void valideazaLoginForm(String username, String password, List<String> errors) throws LoginValidationException{
        
        if(username ==null ||(username !=null && username.isEmpty())){
                errors.add("NUME LIPSESTE");
                
        }
        if(password ==null ||(password !=null && password.isEmpty())){
                errors.add("PASSWORD LIPSESTE");
                
        }
        
        if(errors.size() > 0){
            throw new LoginValidationException(" username not good");
        
        }
    }
}
