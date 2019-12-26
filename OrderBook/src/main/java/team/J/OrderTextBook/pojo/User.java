package team.J.OrderTextBook.pojo;

import java.io.Serializable;

public class User implements Serializable {
    private Integer id;

    private String username;

    private String password;

    private String phonenum;

    private String truthname;

    private String img;

    private String address;

    private String email;

    private String entertime;
    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum == null ? null : phonenum.trim();
    }

    public String getTruthname() {
        return truthname;
    }

    public void setTruthname(String truthname) {
        this.truthname = truthname == null ? null : truthname.trim();
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getEntertime() {
        return entertime;
    }

    public void setEntertime(String entertime) {
        this.entertime = entertime == null ? null : entertime.trim();
    }
}