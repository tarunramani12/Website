package tarunwebsite.shopInfo;

import javax.servlet.*;
import java.io.*;
import java.util.*;

import javax.servlet.http.*;
import tarunwebsite.memberInfo.*;

public class MerchandiseServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        try {
            MerchDAO dao = new MerchDAO();
            Vector products = dao.getAllProducts();

            request.setAttribute("products", products);
		    request.getRequestDispatcher("/Merchandise.jsp").include(request, response);
        }
        catch(Exception e) {
            pw.println(e);
        }
	}
}