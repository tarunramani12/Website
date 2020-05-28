package tarunwebsite.memberInfo;

import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import tarunwebsite.memberInfo.*;

public class WelcomeServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		response.sendRedirect("/Website/WelcomePage.jsp");
	}
}