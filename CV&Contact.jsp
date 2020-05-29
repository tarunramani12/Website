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

        <title>CV & CONTACT | TARUN RAMANI</title>
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
                            
                    <a href="CV&Contact.jsp" class="active">CV & CONTACT</a>

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
            <td style="padding: 10px; max-width: 1200px">
                <div class="middle-div">
                <div class="cv-img-div">
                    <img src="T_R.jpg" width="100%">
                </div>

                <div style="width: 600px; margin-left: auto; margin-right: auto;">

                    <span style=" float: right; padding-left: 20px; border-left: 1px solid lightgray;">
                        <h3>CONTACT FOR BUSINESS:</h3>
                        <p class="list">
                            <a href="mailto:tarunramani12@gmail.com" class="link" title="Email">tarunramani12@gmail.com</a> <br>
                            +919820304000
                        </p>
                    </span>

                    <span style=" float: left;">
                        <h3>SELECTED WORK:</h3>
                        <p class="list">
                            <b>Director Of Photography:</b><br>
                                Murk(Upcoming) <br>
                                Aanand, 2018 <br>
                                Biryani, 2017
                        </p>
                        <p class="list">
                            <b>Cinematographer at Corporate Companies:</b><br>
                                Painting Films Productions<br>
                                Studios Sound Garage<br>
                                Thatz It Private Limited<br>
                                Laboratory Now<br>
                                4degreesC Entertainment Pvt. Ltd.<br>
                                Anahatam Media
                        </p>
                        <p class="list">
                            <b>Associate Cinematographer:</b><br>
                                M.O.M., 2018<br>
                                Moon On The Man, 2019
                        </p>
                        <p class="list">
                            <b>Other Films(Assistant DOP):</b><br>
                                Bramhastra(Upcoming)<br>
                                Houseful 4, 2019<br>
                                Thackeray, 2019<br>
                                Lupt, 2018<br>
                                Wajah Tum Ho, 2016<br>
                                Dr. Rakhmabai, 2016<br>
                                Pyar Ka Punchnama 2, 2015<br>
                                Bang Bang, 2014
                        </p>
                    </span>
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