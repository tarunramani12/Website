package tarunwebsite.memberInfo;

import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UpdateSettingsServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        HttpSession session = request.getSession();
        Member member = (Member)session.getAttribute("member");
        String username = member.getUsername();
        MemberDAO dao = new MemberDAO();

        Enumeration en = request.getParameterNames();
        while(en.hasMoreElements()) {
            String parameter = (String)en.nextElement();
            String value = request.getParameter(parameter);
            try {
                String message = dao.updateMember(username, parameter, value);
                if(parameter.equals("email"))
                    request.setAttribute("messageEmail", message);
                else if(parameter.equals("mobile"))
                    request.setAttribute("messageMobile", message);
                else if(parameter.equals("firstName") || parameter.equals("lastName"))
                    request.setAttribute("messageName", message);
            }
            catch(Exception e) {
                if(parameter.equals("email"))
                    request.setAttribute("messageEmail", e.toString());
                else if(parameter.equals("mobile"))
                    request.setAttribute("messageMobile", e.toString());
                else if(parameter.equals("firstName") || parameter.equals("lastName"))
                    request.setAttribute("messageName", e.toString());
            }
        }
        try {
        member = dao.getMember(username);
        }
        catch(Exception e) {
            pw.println(e);
        }
        session.setAttribute("member", member);
        request.getRequestDispatcher("/SettingsPage.jsp").include(request, response);
        //response.sendRedirect("/Website/Settings");
    }
    
}