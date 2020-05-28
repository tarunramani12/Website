package tarunwebsite.shopInfo;

import javax.servlet.*;
import java.io.*;
import java.util.*;

import javax.servlet.http.*;
import tarunwebsite.memberInfo.*;

public class AddToCartServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        HttpSession session = request.getSession();
        Member member = (Member)session.getAttribute("member");
        String username = member.getUsername();

        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int varientId = Integer.parseInt(request.getParameter("varientId"));


        if(quantity <= 0) {
            request.setAttribute("addToCartMessage", "Items could not be added to cart");
		    request.getRequestDispatcher("/Merchandise").include(request, response);
        }
        else {

            try {
                MerchDAO dao = new MerchDAO();
                if(dao.addToCart(String.valueOf(varientId), String.valueOf(quantity), username)) {
                    request.setAttribute("addToCartMessage", "Items successfully added to cart");
		            request.getRequestDispatcher("/Merchandise").include(request, response);
                }
                else {
                    request.setAttribute("addToCartMessage", "Items could not be added to cart");
		            request.getRequestDispatcher("/Merchandise").include(request, response);
                }
            }
            catch(Exception e) {
                pw.println(e);
            }
        }
	}
}