package tarunwebsite.memberInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("message", "");
        request.setAttribute("firstName", "");
        request.setAttribute("lastName", "");
        request.setAttribute("email", "");
        request.setAttribute("mobile", "");
        request.getRequestDispatcher("/Register.jsp").include(request, response);
    }
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        PreparedStatement pstmt = null;
        Connection con = null;
        
        HttpSession session = request.getSession();
        
        String lastName = request.getParameter("lastName");
        request.setAttribute("lastName", lastName);
        String mobile = request.getParameter("mobile");
        request.setAttribute("mobile", mobile);
        
        String firstName = request.getParameter("firstName");
        request.setAttribute("firstName", firstName);
        if ((firstName.equals(""))) {
            request.setAttribute("message", "First name not entered");
            request.getRequestDispatcher("/Register.jsp").include(request, response);
        }
        else {
            String email = request.getParameter("email");
            request.setAttribute("email", email);
            if(email.equals("")) {
                request.setAttribute("message", "Email not entered");
                request.getRequestDispatcher("/Register.jsp").include(request, response);
            }
            else {
                    String username = request.getParameter("username");
                    request.setAttribute("username", username);
                    if (username.equals("")) {
                        request.setAttribute("message", "Username not entered");
                        request.getRequestDispatcher("/Register.jsp").include(request, response);
                    }
                    else {
                        String password = request.getParameter("password");
                        if (password.equals("")) {
                            request.setAttribute("message", "Password not entered");
                            request.getRequestDispatcher("/Register.jsp").include(request, response);
                        }
                        else {
                            String rePassword = request.getParameter("rePassword");
                            if (!(password.equals(rePassword))) {
                                request.setAttribute("message", "Passwords don't match");
                                request.getRequestDispatcher("/Register.jsp").include(request, response);
                            }
                            else {
                                MemberDAO dao = new MemberDAO();
                                Member member;
                                try {
                                    member = dao.registerMember(username, email, firstName, lastName, mobile, password);
                                }
                                catch (Exception e) {
                                    member = null;
                                }
                                if(member == null) {
                                    request.setAttribute("message", "You are already a member");
                                    request.getRequestDispatcher("/Register.jsp").include(request, response);
                                }
                                else {
                                    session.setAttribute("member", member);
                                    response.sendRedirect("/Website/Welcome");
                                }
                            }
                        }
                    }
                }
            }
    }
}