package tarunwebsite.memberInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class UpdatePasswordServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldPassword = request.getParameter("oldPassword");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");
        MemberDAO dao = new MemberDAO();
        HttpSession session = request.getSession();
        Member member = (Member)session.getAttribute("member");
        String username = member.getUsername();

        if(oldPassword == null || password == null || rePassword == null || oldPassword.equals("") || password.equals("") || rePassword.equals("")) {
            request.setAttribute("messagePassword", "Passwords incorrectly entered");
            request.getRequestDispatcher("/SettingsPage.jsp").include(request, response);
        }
        else if(!(password.equals(rePassword))) {
            request.setAttribute("messagePassword", "Passwords don't match");
            request.getRequestDispatcher("/SettingsPage.jsp").include(request, response);
        }
        else {
            try {
                if (dao.updatePassword(username, oldPassword, password)) {
                    member = dao.getMember(username);
                    session.setAttribute("member", member);
                    request.setAttribute("messagePassword", "Password changed successfully");
                    request.getRequestDispatcher("/SettingsPage.jsp").include(request, response);
                }
                else {
                    request.setAttribute("messagePassword", "Password could not be changed");
                    request.getRequestDispatcher("/SettingsPage.jsp").include(request, response);
                }
            }
            catch(Exception e) {
                request.setAttribute("message", e.toString());
            }
        }
    }
}