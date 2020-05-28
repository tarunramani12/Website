package tarunwebsite.memberInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import tarunwebsite.memberInfo.*;

public class LoginServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/Register.jsp").include(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        String username = request.getParameter("username");
        HttpSession session = request.getSession();
        MemberDAO dao = new MemberDAO();

        try {
            if(username.equals("")) {
                request.setAttribute("loginMessage", "Username not entered");
                request.getRequestDispatcher("/Register.jsp").include(request, response);
            }
            else {
                Member member = dao.login(username, request.getParameter("password"));

                if(member == null) {
                    request.setAttribute("loginMessage", "Invalid username or password");
                    request.setAttribute("enteredValue", username);
                    request.getRequestDispatcher("/Register.jsp").include(request, response);
                }
                else {
                    session.setAttribute("member", member);
                    response.sendRedirect("/Website/Welcome");
                }
            }
        }
        catch(Exception e) {
            request.setAttribute("loginMessage", e.toString());
            request.getRequestDispatcher("/Login").include(request, response);
        }

    }
}