package tarunwebsite.memberInfo;

import java.io.*;
import java.sql.*;

public class MemberDAO {
    Connection con;

    public MemberDAO() {
    }

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tarunramaniwebsite", "root", "mikado");
        return con;
    }

    public void closeConnection() throws SQLException {
        con.close();
    }

    public Member getMember(String username) throws ClassNotFoundException, SQLException {
        Member member = new Member();
        getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from members where username = '" + username + "'");
        if (rs.next()) {
            member.setUsername(rs.getString(1));
            member.setEmail(rs.getString(3));
            member.setFirstName(rs.getString(4));

            if(rs.getString(5) == null)
                member.setLastName("");
            else
                member.setLastName(rs.getString(5));
            
            if(rs.getString(6) == null)
                member.setMobile("");
            else
                member.setMobile(rs.getString(6));
        }

        rs.close();
        stmt.close();
        closeConnection();
        return member;
    }

    public Member login(String username, String password) throws ClassNotFoundException, SQLException {

        Member member = new Member();
        String pass = "";

        getConnection();

        Statement stmt = con.createStatement();

        ResultSet rs = stmt.executeQuery("select * from members where username='" + username + "';");
        while(rs.next()) {
            pass = (rs.getString(2));
        }

        rs.close();
        stmt.close();
        closeConnection();

        if(pass == null || pass.equals("")) {
            return null;
        }
        else if(pass.equals(password))
            member = getMember(username);
        else
            return null;

        return member;
    }

    public Member registerMember(String username, String email, String firstName, String lastName, String mobile, String password) throws ClassNotFoundException, SQLException{

        Member member = new Member();

        getConnection();
        PreparedStatement pstmt = con.prepareStatement("insert into members values(?, ?, ?, ?, ?, ?)");
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        pstmt.setString(3, email);
        pstmt.setString(4, firstName);
        if(lastName.equals(""))
            lastName = null;
        pstmt.setString(5, lastName);
        if(mobile.equals(""))
            mobile = null;
        pstmt.setString(6, mobile);

        int i = pstmt.executeUpdate();

        if(i == 1) {
            member = getMember(username);
        }

        pstmt.close();
        closeConnection();
            
        return member;
    }

    public String updateMember(String username, String parameter, String value) throws ClassNotFoundException, SQLException {

            getConnection();
            String message = "";
            String index = "";

            Statement stmt = con.createStatement();
            if (parameter.equals("password") || parameter.equals("username")) {
                message = "Changes could not be done";
            }
            else if(parameter.equals("email") && (value.equals(""))) {
                message = "Email not entered";
            }
            else if(parameter.equals("firstName") && (value.equals(""))) {
                message = "First Name not entered";
            }

            else if ((parameter.equals("email"))) {
                try {
                    int i = stmt.executeUpdate("update members set " + parameter + " = '" + value + "' where username = '" + username + "';");
                if(i ==1) {
                    message = "Email changed successfully";
                }
                }
                catch(Exception e) {
                    message = "Email already exists";
                }
            }

            else {
                int i = stmt.executeUpdate("update members set " + parameter + " = '" + value + "' where username = '" + username + "';");
                if(i ==1) {
                    if(parameter.equals("mobile"))
                        message = "Mobile changed successfully";
                    else if(parameter.equals("firstName") || parameter.equals("lastName"))
                        message = "Name changed successfully";
                }
            }
            stmt.close();
            closeConnection();

            return message;
    }

    public boolean updatePassword(String username, String oldPassword, String newPassword) throws ClassNotFoundException, SQLException {
        getConnection();
        Statement stmt = con.createStatement();
        String pass = "";
        Statement stmt1 = con.createStatement();
        ResultSet rs = stmt1.executeQuery("select * from members where username='" + username + "';");

        while(rs.next()) {
            pass = (rs.getString(2));
        }
        rs.close();
        stmt1.close();
        int i = 0;
        if(pass.equals(oldPassword))
            i = stmt.executeUpdate("update members set password = '" + newPassword + "' where username = '" + username + "';");
        stmt.close();
        closeConnection();

        return (i == 1);
    }
}