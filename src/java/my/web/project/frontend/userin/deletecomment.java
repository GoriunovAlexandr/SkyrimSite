/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package my.web.project.frontend.userin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import my.web.project.entities.Comment;
import my.web.project.entities.MyUser;
import my.web.project.users.MyUserServiceImpl;
import my.web.project.users.MyUserServiceIntf;
import my.web.project.users.UserConstants;

/**
 *
 * @author user1
 */
public class deletecomment extends HttpServlet {

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
        
        String page = request.getParameter("PAGENAME");
        //String commentId = request.getParameter("id");
        Integer commentId = Integer.parseInt(request.getParameter("id"));
        /*
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet deletecomment</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet deletecomment at " + request.getContextPath() + "</h1>");
            out.println("<h1>Servlet Page: " + page + "</h1>");
            out.println("<h1>Servlet Page: " + commentId + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
        
        //String comment  = request.getParameter("TEXTPAGE");

       // HttpSession session =request.getSession();

        /*MyUser myUser = ((MyUser)session.getAttribute(UserConstants.CMSUSER));

        String userName = myUser.getUsername();*/

        String commentPage = request.getParameter("PAGENAME");
        
        
        MyUserServiceIntf userservice = MyUserServiceImpl.getInstance();
        try {
            Comment comment = userservice.findCommentById(commentId);
            userservice.deleteUserComment(comment);
        } catch (SQLException ex) {
            Logger.getLogger(savecomment.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        request.getRequestDispatcher(commentPage).forward(request, response);
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
