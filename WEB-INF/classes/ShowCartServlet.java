package tarunwebsite.shopInfo;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import tarunwebsite.memberInfo.*;

public class ShowCartServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        MerchDAO dao = new MerchDAO();
        HttpSession session = request.getSession();
        Member member = (Member)session.getAttribute("member");
        String username = member.getUsername();

        try {
            Collection cartItems = dao.getCartItems(username);
            if(cartItems == null) {
                request.setAttribute("cartMessage", "Your cart is empty");
                request.getRequestDispatcher("/Cart.jsp").include(request, response);
            }
            else {
                request.setAttribute("cartItems", cartItems);
                request.getRequestDispatcher("/Cart.jsp").include(request, response);
            }
        }
        catch(Exception e) {
            pw.println(e);
        }
    }
    
}