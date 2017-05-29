/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package my.web.project.frontend.userin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import my.web.project.entities.MyUser;
import my.web.project.users.MyUserServiceImpl;
import my.web.project.users.MyUserServiceIntf;

/**
 *
 * @author user1
 */
public class deleteuser extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
       
        String page = null;
        String idStr = null;
        MyUser user=null;
        
        try {
            MyUserServiceIntf userservice = MyUserServiceImpl.getInstance();
            idStr = request.getParameter("id");

            int id = Integer.parseInt(idStr);
            MyUser myUser= userservice.findUserById(id);
            
            if(myUser != null){
                userservice.deleteUser(myUser);
            }else{
                 throw new Exception();
            }
            
            userservice.updateUserStatus(myUser);

           page="adminhome";

        } catch (Exception e) {
            page = "/error.jsp";
            request.setAttribute("error", "invalid user id " + idStr);
            //request.setAttribute("moveback", "cmsproduse.html");
        }
        
         request.getRequestDispatcher(page).forward(request, response);
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
