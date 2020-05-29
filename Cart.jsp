<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="MainStyle.css">
        <%@ page import = "java.util.*, java.io.*, tarunwebsite.memberInfo.*, tarunwebsite.shopInfo.*" %>
        <%
            Member member = (Member)session.getAttribute("member");
            try {
                if(member.getFirstName() == null) {
                    request.getRequestDispatcher("/Login").include(request, response);
                }
            }
            catch(Exception e) {
                request.getRequestDispatcher("/Login").include(request, response);
            }
        %>

        <style>
            .dropdown {font-weight: normal; text-decoration: none;}
            .dropdown-content { display: none; position: absolute; z-index: 1; padding: 5px;}
            .dropdown-content a { color: gray; font-weight: normal; font-size: 11px; text-decoration: none; line-height: 20px; display: block;}
            .dropdown-content a:hover { color: lightgray;}
            .dropdown:hover .dropdown-content { display: block;}
        </style>

        <title>Your Cart | TARUN RAMANI</title>
    </head>
    <body>

        <table width="100%" height="100%" align=center>

            <tr width="100%" height="10%">
            <td style="background-color: white; padding: 10px;">
                <div class="top-div">
                <span style="line-height: 10px;">
                    <h1>TARUN RAMANI</h1>
                    <h1 style="font-weight: normal;">CINEMATOGRAPHER</h1>
                </span>

                <span class="menu-tabs-span">
                    <a href="Home.jsp" class="inactive">HOME</a>
                            
                    <a href="Cinematography.jsp" class="inactive">CINEMATOGRAOHY</a>
                            
                    <a href="CV&Contact.jsp" class="inactive">CV & CONTACT</a>

                    <a href="/Website/Merchandise" class="inactive">MERCHANDISE</a>

                    <%
                    if(member.getFirstName() == null) {
                    %>
                        <a href="Register.jsp" class="active">REGISTER/LOG IN</a>
                    <% } else { %>
                        <span class="dropdown"><a href="WelcomePage.jsp" class="active">Hi, <%=member.getFirstName()%></a>
                            <div class="dropdown-content">
                                <a href="/Website/Cart">Your Cart</a>
                                <a href="/Website/Settings">Account Settings</a>
                                <a href="/Website/Logout">Log Out</a>
                            </div>
                        </span>
                    <% } %>
                        
                </span>
                </div>
            </td>
            </tr>

            <tr width="100%" height="80%">
            <td style="padding: 10px; max-width: 1200px">
                <div class="middle-div">

                <div style="width: 800px; margin-left: auto; margin-right: auto;">

                    <%
                    Vector cart = (Vector)request.getAttribute("cart");
                    double totalAmount = 0;
                    int totalItems = 0;
                    if(cart == null) {
                        out.println("<p style=\"color: red; text-align: center;\">There was an error in getting your cart information</p>");
                    }

                    else if (cart.size() == 0) {
                    out.println("<p style=\"color: red; text-align: center;\">Your cart is empty</p>");
                    }

                    else {

                        Enumeration<CartProduct> en = cart.elements();
                    %>

                    <table style="padding-top: 20px; border-collapse: collapse;">
                    <%
                    while(en.hasMoreElements()) {
                        CartProduct pro = en.nextElement();
                    %>

                    <form method="POST" action="/Website/UpdateCart">

                        <tr style="border-bottom:1px solid lightgray; font-size: 13px;">
                            <td style="width: 100px; padding: 20px;">
                                <img src="<%=pro.getImagePath()%>" style="max-width: 75px; max-height: 75px;">
                            </td>

                            <td style="width: 350px; padding: 20px;">
                                <h4><%=pro.getMerchName()%></h4>
                                Qty.: <input type="number" name="qty<%=pro.getCartId()%>" value="<%=pro.getQuantity()%>" style="width: 30px;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Varient: <b><%=pro.getVarientDescription()%></b>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <b>Rs. <%=pro.getCost()%></b><br>
                                
                                <br>
                                <input type="submit" value="UPDATE" name="update" style="font-family: montserrat,sans-serif;">
                            
                            </td>
                            <td style="width: 100px; vertical-align: bottom; padding: 20px;">
                                <input type="submit" value="REMOVE FROM CART" name="remove" style="font-family: montserrat,sans-serif;">
                            </td>
                            <%
                            totalAmount = totalAmount + pro.getCost();
                            totalItems = totalItems + pro.getQuantity();
                            %>
                        </tr>
                    </form>
                    <%
                    }
                    %>
                    <form>
                        <tr style="font-size: 13px;">
                            <td colspan="2"style="padding-top: 20px;">
                                Total Items: &nbsp;&nbsp;&nbsp;&nbsp;<b><%=totalItems%></b>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Amount: &nbsp;&nbsp;&nbsp;&nbsp;<b>Rs. <%=totalAmount%></b>
                            </td>
                        </tr>
                        <tr style="border-bottom:1px solid black; font-size: 13px;">
                            <td colspan="3"style="padding-top: 10px; padding-bottom: 10px;">
                                <input type="submit" value="PURCHASE CART" name="purchase" style="font-family: montserrat,sans-serif; width: 100%;">
                            </td>
                        </tr>
                    </form method="POST" action="/PurchaseCart">

                    </table>
                    <%
                    }
                    %>
                        
                </div>
                </div>
                
            </td>
            </tr>
            
            <tr width="100%" height="10%">
            <td style="background-color: white; padding: 10px;">
                <div class="bottom-div">
                
                    <span class="contact-links"> 
                        <a href="https://www.imdb.com/name/nm7049244/" target="_blank"><img src="IMDb.png" title="IMDb" style="width: 18px"></a>
                        <a href="https://www.instagram.com/instarunramani/" target="_blank"><img src="Instagram.png" title="Instagram" style="width: 18px"></a>
                        <a href="mailto:tarunramani12@gmail.com"><img src="Email.png" title="Email" style="width: 18px"></a>
                    </span>

                </div>
            </td>
            </tr>
        </table>
    </body>
</html>