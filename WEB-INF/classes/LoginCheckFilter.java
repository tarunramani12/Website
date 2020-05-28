package tarunwebsite.memberInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import tarunwebsite.memberInfo.*;

public class LoginCheckFilter implements Filter {

    public void init(FilterConfig fc) throws ServletException {
    }

    public void doFilter (ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        HttpSession session = ((HttpServletRequest)request).getSession();

        Member member = (Member)session.getAttribute("member");
        if(member == null) {
            ((HttpServletResponse)response).sendRedirect("http://localhost:8080/Website/Login");
        }
        else {
            chain.doFilter(request, response);
        }
    }

    public void destroy() {

    }
}