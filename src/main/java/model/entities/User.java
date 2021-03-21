package model.entities;

public class User {
    private int id;
    private String userName;
    private String firstname;
    private String lastname;
    private String youremail;
    private String password;

    public User(String userName, String firstname, String lastname, String youremail, String password) {
        userName = userName;
        this.firstname = firstname;
        this.lastname = lastname;
        this.youremail = youremail;
        this.password = password;
    }

    public User(int id, String userName, String firstname, String lastname, String youremail, String password) {
        this.id = id;
        userName = userName;
        this.firstname = firstname;
        this.lastname = lastname;
        this.youremail = youremail;
        this.password = password;
    }

    public User(String username, String password) {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getYouremail() {
        return youremail;
    }

    public void setYouremail(String youremail) {
        this.youremail = youremail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

