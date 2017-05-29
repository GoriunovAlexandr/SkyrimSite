package my.web.project.login.fb;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpSession;
import my.web.project.entities.MyUser;
import my.web.project.users.UserConstants;

////@Path("/users")
//@WebServlet(
//        name="fb3",
//        urlPatterns={"/fb"}
//) 

@WebServlet("/callback")
public class MainMenu extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private String code="";
        private MyUser myUser = new MyUser();
        private HttpSession session = null;
        
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {		
		code = req.getParameter("code");
		if (code == null || code.equals("")) {
			throw new RuntimeException(
					"ERROR: Didn't get code parameter in callback.");
		}
		FBConnection fbConnection = new FBConnection();
		String accessToken = fbConnection.getAccessToken(code);

		FBGraph fbGraph = new FBGraph(accessToken);
		String graph = fbGraph.getFBGraph();
		Map<String, String> fbProfileData = fbGraph.getGraphData(graph);
		/*ServletOutputStream out = res.getOutputStream();
		out.println("<h1>Facebook Login using Java</h1>");
		out.println("<h2>Application Main Menu</h2>");
		out.println("<div>Welcome "+fbProfileData.get("name"));
		out.println("<div>Your Email: "+fbProfileData.get("email"));
		out.println("<div>You are "+fbProfileData.get("gender"));*/
                
                session = req.getSession();
                //myUser = (MyUser)session.getAttribute(UserConstants.CMSUSER);
                if(session.getAttribute(UserConstants.CMSUSER) == null){
                    String name = fbProfileData.get("name");
                    //Long id = Long.parseLong(fbProfileData.get("id"));
                    int id = 90;
                    myUser.setId(id);
                    myUser.setUsername(name);
                    myUser.setNikuser(name);
                    session.setAttribute(UserConstants.CMSUSER, myUser);
                    //processRequest(req, res);
                }
                //processRequest(req, res);
                //req.getRequestDispatcher("homepage").forward(req, res);
                req.getRequestDispatcher("homepage").forward(req, res);
	}
        
        /*
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            request.getRequestDispatcher("homepage").forward(request, response);
        }*/

}
