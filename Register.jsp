<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="MainStyle.css">
        <%@ page import = "java.util.*, java.io.*, tarunwebsite.memberInfo.*" %>
        <%
            session.removeAttribute("member");
        %>

        <title>REGISTER/SIGN IN | TARUN RAMANI</title>
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

                    <a href="Register.jsp" class="active">REGISTER/SIGN IN</a>
                </span>
                </div>
            </td>
            </tr>

            <tr width="100%" height="80%">
            <td style="padding: 10px; max-width: 1200px">
                <div class="middle-div">

                    <p style="text-align: center;">Register with your details to become a member or log in if you arlready are a member</p>

                    <table align="center">
                    <tr>
                        <td valign="top" style="padding-right: 40px; border-right: 1px solid lightgray;">

                            <%
                            String message = (String)request.getAttribute("message");
                            if (message != null || message == "") {
                                out.println("<p style=\"color: red; text-align: center; font-size: 13px;\">" + message + "</p>");
                            }
                            String firstName = (String)request.getAttribute("firstName");
                            if(firstName == null)
                                firstName = "";
                            String lastName = (String)request.getAttribute("lastName");
                            if(lastName == null)
                                lastName = "";                            
                            String email = (String)request.getAttribute("email");
                            if(email == null)
                                email = "";
                            String username = (String)request.getAttribute("username");
                            if(username == null)
                                username = "";
                            String mobile = (String)request.getAttribute("mobile");
                            if(mobile == null)
                                mobile = "";
                            if(message == null)
                                message = "";
                            %>

                            <form method="POST" action="/Website/Register">
                            <table>
                                <tr>
                                    <td style="font-size: 13px; height: 35px; padding-right: 15px;">First Name(<span style="color: red;">*</span>)</td>
                                    <%
                                    if(!(message.equals("First name not entered")))
                                    {
                                    %>
                                        <td><input type="text" name="firstName" value="<%=firstName%>"></td>
                                    <% } else { %>
                                        <td><input type="text" name="firstName"></td>
                                    <% } %>
                                </tr>
                                <tr>
                                    <td style="font-size: 13px; height: 35px; padding-right: 15px;">Last Name</td>
                                    <td><input type="text" name="lastName" value="<%=lastName%>"></td>
                                </tr>
                                <tr>
                                    <td style="font-size: 13px; height: 35px; padding-right: 15px;">Email(<span style="color: red;">*</span>)</td>
                                    <%
                                    if(!(message.equals("Email not entered")))
                                    {
                                    %>
                                        <td><input type="email" size="40px" name="email" value="<%=email%>"></td>
                                    <% } else { %>
                                            <td><input type="email" size="40px" name="email"></td>
                                    <% } %>
                                </tr>
                                <tr>
                                    <td style="font-size: 13px; height: 35px; padding-right: 15px;">Username(<span style="color: red;">*</span>)</td>
                                    <%
                                    if(!(message.equals("Username not entered")))
                                    {
                                    %>
                                        <td><input type="text" size="40px" name="username" value="<%=username%>"></td>
                                    <% } else { %>
                                        <td><input type="text" size="40px" name="username"></td>
                                    <% } %>
                                </tr>
                                <tr>
                                    <td style="font-size: 13px; height: 35px; padding-right: 15px;">Password(<span style="color: red;">*</span>)</td>
                                    <td><input type="password" name="password"></td>
                                </tr>
                                <tr>
                                    <td style="font-size: 13px; height: 35px; padding-right: 15px;">Re-enter Password(<span style="color: red;">*</span>)</td>
                                    <td><input type="password" name="rePassword"></td>
                                </tr>
                                <tr>
                                    <td style="font-size: 13px; height: 35px; padding-right: 15px;">Mobile</td>
                                    <td><input type="number" name="mobile" value="<%=mobile%>"></td>
                                </tr>
                                <tr>
                                    <th colspan="3" style="height: 50px;"><input type="submit" value="REGISTER" style="width: 100%; font-family: montserrat,sans-serif;"></th>
                                </tr>
                            </table>
                            </form>
                        </td>
                            
                        <td valign="top">

                            <%
                            String loginMessage = (String)request.getAttribute("loginMessage");
                            String enteredValue = (String)request.getAttribute("enteredValue");
                            if(enteredValue == null)
                                enteredValue = "";
                            if (loginMessage != null)
                                out.println("<p style=\"color: red; text-align: center;\">" + loginMessage + "</p>");
                            if(loginMessage == null)
                                loginMessage = "";
                            %>
                            
                            <form method="POST" action="/Website/Login">
                            <table style="padding-left: 40px;">
                                <tr>
                                    <td style="font-size: 13px; height: 35px; padding-right: 15px;">Username</td>
                                    <td><input type="text" name="username" value="<%=enteredValue%>"></td>
                                </tr>
                                <tr>
                                    <td style="font-size: 13px; height: 35px; padding-right: 15px;">Password</td>
                                    <td><input type="password" name="password"></td>
                                </tr>
                                <tr>
                                    <th colspan="2" style="height: 50px;"><input type="submit" value="LOG IN" style="width: 100%; font-family: montserrat,sans-serif;"></th>
                                </tr>
                            </table>
                            </form>
                        </td>

                    </tr>
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