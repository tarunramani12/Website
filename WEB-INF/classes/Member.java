package tarunwebsite.memberInfo;

public class Member {

    String username, firstName, lastName, email, mobile;

    public Member () {
    }

    public Member(String username, String email, String firstName, String lastName, String mobile) {
        this.username = username;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.mobile = mobile;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    public String getUsername() {
        return username;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String getEmail() {
        return email;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getFirstName() {
        return firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getLastName() {
        return lastName;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public String getMobile() {
        return mobile;
    }

    public boolean equals(Object o) {
        if (o instanceof Member) {
            return ((((Member)o).username).equals(username));
        }
        return false;
    }
}