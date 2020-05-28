<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="MainStyle.css">
        <%@ page import = "java.util.*, java.io.*, tarunwebsite.memberInfo.*" %>
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

        <title>CINEMATOGRAOHY | TARUN RAMANI</title>
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
                            
                    <a href="Cinematography.jsp" class="active">CINEMATOGRAOHY</a>
                            
                    <a href="CV&Contact.jsp" class="inactive">CV & CONTACT</a>

                    <a href="/Website/Merchandise" class="inactive">MERCHANDISE</a>

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

                    <span style="text-align: right; font-size: 13;"><a href="#" class="link">CHAT</a></span>

                </div>
            </td>
            </tr>
        </table>
    </body>
</html>