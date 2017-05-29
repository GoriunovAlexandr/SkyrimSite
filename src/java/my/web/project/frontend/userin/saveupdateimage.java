/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package my.web.project.frontend.userin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import my.web.project.db.MyDataSource;
import my.web.project.entities.MyUser;
import my.web.project.users.MyFileUtil;
import my.web.project.users.MyUserServiceImpl;
import my.web.project.users.MyUserServiceIntf;
import my.web.project.users.UserConstants;

/**
 *
 * @author user1
 */
public class saveupdateimage extends HttpServlet {
    private static final Logger LOG = Logger.getLogger(saveupdateimage.class.getName());

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
        
  

    // Create path components to save the file
    String dir = MyFileUtil.USER_IMAGES_FOLDER;
    
    Object obj = request.getPart("IMAGE_NAME");
    final Part filePart = request.getPart("IMAGE_NAME");
    
    final String fileName = getFileName(filePart);

    
    /*final String produIdStr = request.getParameter("PRODUS_ID");
    
    int produsId = Integer.parseInt(produIdStr);*/
    HttpSession session =request.getSession();
    int ursid = ((MyUser)session.getAttribute(UserConstants.CMSUSER)).getId();
    
        LOG.log(Level.INFO, "produIdStr **************************=  "+ursid );
    
    String path =  request.getServletContext().getRealPath("")+dir; // 1+2+3;
    
    
    FileInputStream fis=null;
    
    OutputStream out = null;
    InputStream filecontent = null;
    final PrintWriter writer = response.getWriter();

    try {
        out = new FileOutputStream(new File(path + File.separator + fileName));
        filecontent = filePart.getInputStream();

        int read = 0;
        final byte[] bytes = new byte[1024];

        while ((read = filecontent.read(bytes)) != -1) {
            out.write(bytes, 0, read);
        }
        
        File f=new File(path + File.separator  + fileName);
        
        fis=new FileInputStream(f);
        
        
        int fileSize= (int)f.length();
        
        byte[] dataDinFile =new byte[fileSize];
        
        fis.read(dataDinFile);
        
        
        fis.close();
        
        
        
        MyDataSource mds  = (MyDataSource)request.getServletContext().getAttribute("dataSource");
       /* ProduseServiceIntf produseService=ProduseServiceImpl.getInstance(mds);*/
        
        MyUserServiceIntf userservice = MyUserServiceImpl.getInstance();
        //MyUser myUser= userservice.getByUsernameAndPassword(username, parolaCriptata);
    
        
        MyUser user=userservice.findUserById(ursid);
        
        //user.setImageName(fileName);
        user.setAvatar(dataDinFile);
        
        try {
            userservice.updateUser(user);
            
            //1 daoProdus.updateImage(idProdus, fileName, dataDinFile);
            // 2. dao.readImage(idProdus)
            // 3. sinchronize images - a) servlet   // b)listener deploy
            //4. id imaginii din formular
            
            //5 formular comun datele produsului + datele Imagnii
        } catch (SQLException ex) {
            Logger.getLogger(saveupdateimage.class.getName()).log(Level.SEVERE, null, ex);
        }
         
        
        
        LOG.log(Level.INFO, "File{0}being uploaded to {1}", 
                new Object[]{fileName, path});
    } catch (FileNotFoundException fne) {
//        writer.println("You either did not specify a file to upload or are "
//                + "trying to upload a file to a protected or nonexistent "
//                + "location.");
//        writer.println("<br/> ERROR: " + fne.getMessage());

        LOG.log(Level.SEVERE, "Problems during file upload. Error: {0}", 
                new Object[]{fne.getMessage()});
    } finally {
        if (out != null) {
            out.close();
        }
        if (filecontent != null) {
            filecontent.close();
        }
       
    }
    
    
    
   // String page = "update_profile_process?id="+ursid;
    String page = "login";
    request.getRequestDispatcher(page).forward(request, response);
      
    
}

private String getFileName(final Part part) {
    final String partHeader = part.getHeader("content-disposition");
    LOG.log(Level.INFO, "Part Header = {0}", partHeader);
    for (String content : part.getHeader("content-disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring(
                    content.indexOf('=') + 1).trim().replace("\"", "");
        }
    }
    return null;
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
