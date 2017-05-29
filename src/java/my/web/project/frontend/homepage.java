/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package my.web.project.frontend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
import my.web.project.entities.Comment;
import my.web.project.entities.MyUser;
import my.web.project.frontend.userin.userhome;
import my.web.project.users.MyUserServiceImpl;
import my.web.project.users.MyUserServiceIntf;
import my.web.project.users.UserConstants;

/**
 *
 * @author user1
 */
public class homepage extends HttpServlet {

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
        
        //TexteServiceIntf service = MockTextServiceImpl.getInstance();
        String pageText = "Home Sweet Home!";//service.getPageText("home");
        request.setAttribute("pageText", pageText);
       
       
       MyUserServiceIntf userservice = MyUserServiceImpl.getInstance();
       List<Comment> com = new ArrayList<>();
       String requestPage="HOME";
       
        HttpSession session = request.getSession();
        if(null != session.getAttribute(UserConstants.CMSUSER)){
            String userName = ((MyUser) session.getAttribute(UserConstants.CMSUSER)).getUsername();
            session.setAttribute("userName", userName);
        }
        
       
       Integer count_vision=0;
       ServletContext context = request.getSession().getServletContext();
       if(context.getAttribute("count_vision") != null)
        count_vision = (Integer)context.getAttribute("count_vision");
       count_vision++;
       context.setAttribute("count_vision", count_vision);
       
       
        try {
            com = userservice.loadAllComments(requestPage);
            request.setAttribute("comment", com);
            request.setAttribute("pageText", pageText);
            //request.setAttribute("leaveComment", leaveComment);
        } catch (SQLException ex) {
            Logger.getLogger(userhome.class.getName()).log(Level.SEVERE, null, ex);
        }
        
       request.getRequestDispatcher("/WEB-INF/frontend/homepage.jsp").forward(request, response);
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
