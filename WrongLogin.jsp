<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="MainStyle.css">
        <title>LOG IN | TARUN RAMANI</title>
    </head>
    <body>
        <%@ page import = "java.util.*, java.io.*, tarunwebsite.memberInfo.*" %>
        <%
            session.removeAttribute("member");
        %>

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

                    <a href="Register.jsp" class="active">REGISTER/LOG IN</a>
                </span>
                </div>
            </td>
            </tr>

            <tr width="100%" height="80%">
            <td style="padding: 10px; max-width: 1200px;">
                <div class="middle-div">

                    <%
                    String message = (String)request.getAttribute("message");
                    String enteredValue = (String)request.getAttribute("enteredValue");
                    if(enteredValue == null)
                        enteredValue = "";
                    out.println("<p style=\"color: red; text-align: center;\">" + message + "</p>");
                    %>

                    <form method="POST" action="/Website/Login">
                        <table align="center">
                            <tr>
                                <td style="font-size: 13px; height: 35px; padding-right: 15px;">Username</td>
                                <td><input type="text" name="username" value="<%=enteredValue%>"></td>
                            </tr>
                            <tr>
                                <td style="font-size: 13px; height: 35px; padding-right: 15px;">Password</td>
                                <td><input type="password" name="password"></td>
                            </tr>
                            <tr>
                                <th colspan="2" style="height: 50px;"><input type="submit" value="LOG IN" style="width: 100%; height: 25px;"></th>
                            </tr>
                        </table>
                    </form>

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