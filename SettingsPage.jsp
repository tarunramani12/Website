<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="MainStyle.css">
        <%@ page import = "java.util.*, java.io.*, tarunwebsite.memberInfo.*" %>
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

        <title>Account Settings | TARUN RAMANI</title>
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
                    <div style="width: 600px; margin-left: auto; margin-right: auto;">

                    <p><b>Click on the your attributes below to change<b></p>

                        <br>
                        <h3>PERSONAL INFORMATION:</h3>
                        <p class="list" id="name-settings" style="cursor: pointer" title="Change Name">
                            <b style="padding-right: 20px;">Name:</b> <%=member.getFirstName()%> <%=member.getLastName()%>
                            <%
                            String messageName = (String)request.getAttribute("messageName");
                            if(messageName != null || messageName == "") {
                                if(messageName == "Name changed successfully")
                                    out.println("<span style=\"color: green; padding-left: 20px;\">Name changed successfully</span>");
                                else
                                    out.println("<span style=\"color: red; padding-left: 20px;\">" + messageName + "</span>");
                            }
                            %>

                            <br>
                            <form id="name-settings-form" style="display: none;" method="POST" action="/Website/UpdateSettings">
                            <table style="font-size: 13px;  color: gray;">
                                <tr><td>First Name:</td><td><input type="text" name="firstName" value="<%=member.getFirstName()%>"></td></tr>
                                <tr><td>Last Name:</td><td><input type="text" name="lastName" value="<%=member.getLastName()%>"></td></tr>
                                <tr><td colspan="2" ><input type="submit" value="UPDATE" style="width: 100%; font-family: montserrat,sans-serif;"></td></tr>
                            </table>
                            </form>
                        </p>
                        <script>
                            document.getElementById("name-settings").onclick = function() {nameSettings()};
                            function nameSettings() {
                                var check = document.getElementById("name-settings-form");
                                if (check.style.display == "block") {
                                    check.style.display = "none";
                                }
                                else
                                    check.style.display = "block";
                            }
                        </script>

                        <br>
                        <h3>ACCOUNT INFORMATION:</h3>
                        <p class="list" id="username-settings" style="cursor: pointer">
                            <b style="padding-right: 20px;">Username:</b> <%=member.getUsername()%><br>
                            <span id="username-settings-message" style="display: none; color: gray;">
                                Username cannot be changed as it is used to identify your account.
                            </span>
                        </p>
                        <script>
                            document.getElementById("username-settings").onmouseover = function() {doDisplay()};
                            document.getElementById("username-settings").onmouseout = function() {doNotDisplay()};
                            function doDisplay() {
                                document.getElementById("username-settings-message").style.display = "block";
                            }
                            function doNotDisplay() {
                                document.getElementById("username-settings-message").style.display = "none";
                            }
                        </script>

                        <p class="list" style="cursor: pointer" id="password-settings" title="Change Password">
                            <b style="padding-right: 20px;">Password:</b> ********** 
                            <%
                            String messagePassword = (String)request.getAttribute("messagePassword");
                            if(messagePassword != null || messagePassword == "") {
                                if(messagePassword == "Password changed successfully")
                                    out.println("<span style=\"color: green; padding-left: 20px;\">Password changed successfully</span>");
                                else
                                    out.println("<span style=\"color: red; padding-left: 20px;\">" + messagePassword + "</span>");
                            }
                            %>
                            <br>

                            <form id="password-settings-form" style="display: none;" method="POST" action="/Website/UpdatePassword">
                            <table style="font-size: 13px;  color: gray;">
                                <tr><td>Old Password:</td><td><input type="password" name="oldPassword"></td></tr>
                                <tr><td>New Password:</td><td><input type="password" name="password"></td></tr>
                                <tr><td>Re-enter Password:</td><td><input type="password" name="rePassword"></td></tr>
                                <tr><td colspan="2" ><input type="submit" value="UPDATE" style="width: 100%; font-family: montserrat,sans-serif;"></td></tr>
                            </table>
                            </form>
                        </p>
                        <script>
                            document.getElementById("password-settings").onclick = function() {passwordSettings()};
                            function passwordSettings() {
                                var check = document.getElementById("password-settings-form");
                                if(check.style.display == "none") {
                                    check.style.display = "block";
                                }
                                else {
                                    check.style.display = "none";
                                }
                            }
                        </script>

                        <br>
                        <h3>CONTACT INFORMATION:</h3>
                        <p class="list" id="email-settings" style="cursor: pointer" title="Change Email">
                            <b style="padding-right: 20px;">Email:</b> <%=member.getEmail()%>
                            <%
                            String messageEmail = (String)request.getAttribute("messageEmail");
                            if(messageEmail != null || messageEmail == "") {
                                if(messageEmail == "Email changed successfully")
                                    out.println("<span style=\"color: green; padding-left: 20px;\">Email changed successfully</span>");
                                else
                                    out.println("<span style=\"color: red; padding-left: 20px;\">" + messageEmail + "</span>");
                            }
                            %>

                            <br>
                            <form id="email-settings-form" style="display: none;" method="POST" action="/Website/UpdateSettings">
                            <table style="font-size: 13px;  color: gray;">
                                <tr><td>Email:</td><td><input type="text" name="email" value="<%=member.getEmail()%>"></td></tr>
                                <tr><td colspan="2" ><input type="submit" value="UPDATE" style="width: 100%; font-family: montserrat,sans-serif;"></td></tr>
                            </table>
                            </form>
                        </p>
                        <script>
                            document.getElementById("email-settings").onclick = function() {emailSettings()};
                            function emailSettings() {
                                var check = document.getElementById("email-settings-form");
                                if (check.style.display == "block") {
                                    check.style.display = "none";
                                }
                                else
                                    check.style.display = "block";
                            }
                        </script>

                        <p class="list" id="mobile-settings" style="cursor: pointer" title="Change Mobile">
                            <b style="padding-right: 20px;">Mobile:</b> <%=member.getMobile()%>
                            <%
                            String messageMobile = (String)request.getAttribute("messageMobile");
                            if(messageMobile != null || messageMobile == "") {
                                if(messageMobile == "Mobile changed successfully")
                                    out.println("<span style=\"color: green; padding-left: 20px;\">Mobile changed successfully</span>");
                                else
                                    out.println("<span style=\"color: red; padding-left: 20px;\">" + messageMobile + "</span>");
                            }
                            %>

                            <br>
                            <form id="mobile-settings-form" style="display: none;" method="POST" action="/Website/UpdateSettings">
                            <table style="font-size: 13px;  color: gray;">
                                <tr><td>Mobile:</td><td><input type="number" name="mobile" value="<%=member.getMobile()%>"></td></tr>
                                <tr><td colspan="2" ><input type="submit" value="UPDATE" style="width: 100%; font-family: montserrat,sans-serif;"></td></tr>
                            </table>
                            </form>
                        </p>
                        <script>
                            document.getElementById("mobile-settings").onclick = function() {mobileSettings()};
                            function mobileSettings() {
                                var check = document.getElementById("mobile-settings-form");
                                if (check.style.display == "block") {
                                    check.style.display = "none";
                                }
                                else
                                    check.style.display = "block";
                            }
                        </script>

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

                    <span style="text-align: right; font-size: 13;"><a href="#" class="link">CHAT</a></span>

                </div>
            </td>
            </tr>
        </table>
    </body>
</html>