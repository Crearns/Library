package Entity;

public class Reader {
    private String username;
    private String password;
    private String name;
    private String sex;
    private String status;
    private String mail;
    private int grade;
    private int classnum;
    private int borrow;

    public Reader(String username, String password, String name, String sex, String status, String mail, int borrow) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.status = status;
        this.mail = mail;
        this.borrow = borrow;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public int getBorrow() {
        return borrow;
    }

    public void setBorrow(int borrow) {
        this.borrow = borrow;
    }
}
