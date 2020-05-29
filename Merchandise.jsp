<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="MainStyle.css">
        <%@ page import = "java.util.*, java.io.*, tarunwebsite.memberInfo.*, tarunwebsite.shopInfo.*" %>
        <%
            Member member = (Member)session.getAttribute("member");
        %>

        <style>
            .dropdown {font-weight: normal; text-decoration: none;}
            .dropdown-content { display: none; position: absolute; z-index: 1; padding: 5px;}
            .dropdown-content a { color: gray; font-weight: normal; font-size: 11px; text-decoration: none; line-height: 20px; display: block;}
            .dropdown-content a:hover { color: lightgray;}
            .dropdown:hover .dropdown-content { display: block;}
        </style>

        <title>MERCHANDISE | TARUN RAMANI</title>
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

                    <a href="/Website/Merchandise" class="active">MERCHANDISE</a>

                    <%
                    if (member == null) {
                    %>
                        <a href="Register.jsp" class="inactive">REGISTER/LOG IN</a>
                    <% } else { %>
                        <span class="dropdown"><a href="WelcomePage.jsp" class="inactive">Hi, <%=member.getFirstName()%></a>
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
            <td style="padding: 10px; max-width: 1200px;">
                <div class="middle-div">

                    <%
                    String addToCartMessage = (String)request.getAttribute("addToCartMessage");
                    if(addToCartMessage != null)
                        if(addToCartMessage == "Items added to cart")
                            out.println("<p style=\"color: green; text-align: center;\">Items added to cart</p>");
                        else
                            out.println("<p style=\"color: red; text-align: center;\">" + addToCartMessage + "</p>");
                    Vector products = (Vector)request.getAttribute("products");
                    Enumeration<Product> en = products.elements();
                    %>

                    <table align=center style="padding-top: 20px; border-collapse: collapse;">
                    <%
                    while(en.hasMoreElements()) {
                        Product pro = en.nextElement();
                    %>

                    <form method="POST" action="/Website/AddToCart">

                        <tr style="border-bottom:1px solid lightgray; font-size: 13px;">
                            <td style="width: 200px; padding: 20px;">
                                <img src="<%=pro.getImagePath()%>" style="max-width: 150px; max-height: 150px;">
                            </td>

                            <td style="width: 500px; padding: 20px;">
                                <h4 style="font-weight: bold"><%=pro.getMerchName()%></h4>
                                <%=pro.getMerchDescription()%><br><br>
                                Rs. <%=pro.getPrice()%><br><br>
                                
                                <%
                                Vector i = pro.getImages();
                                Enumeration<String> en2 = i.elements();
                                 while(en2.hasMoreElements()) {
                                    String imagePath = en2.nextElement();
                                %>
                                <img src="<%=imagePath%>" style="max-width: 35px; max-height: 35px; border: 1px solid lightgray; padding: 1px;">&nbsp;
                                <%
                                 }
                                 %>

                                 <br><br>

                                    <%
                                    Vector v = pro.getVarients();
                                    %>
                                        <b>Available in: &nbsp;&nbsp;&nbsp;</b>
                                        <select name="varientId" style="font-family: montserrat,sans-serif;">
                                    <%
                                        Enumeration<Varient> en1 = v.elements();
                                        while(en1.hasMoreElements()) {
                                            Varient varient = en1.nextElement();
                                    %>
                                            <option value="<%=String.valueOf(varient.getVarientId())%>"><%=varient.getVarientDescription()%></option>
                                    <%
                                        }
                                    %>
                                    </select>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                    <b>Qty.: &nbsp;&nbsp;&nbsp;</b><input type="number" name="quantity" value="1" style="width: 30px;">

                            </td>
                            <td style="width: 100px; vertical-align: bottom; padding: 20px;">
                                <input type="submit" value="ADD TO CART" style="font-family: montserrat,sans-serif;">
                            </td>
                        </tr>

                    </form>

                    <%
                    }
                    %>

                    </table>
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