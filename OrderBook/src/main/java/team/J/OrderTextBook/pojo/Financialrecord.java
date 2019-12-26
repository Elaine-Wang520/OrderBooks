package team.J.OrderTextBook.pojo;

import java.io.Serializable;

public class Financialrecord implements Serializable {
    private Integer id;

    private Integer bookid;

    private String bookname;

    private Integer number;

    private Float price;

    private Float moneytotal;

    private Integer userid;

    private String username;

    private String inputdate;

    private String buydate;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname == null ? null : bookname.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getMoneytotal() {
        return moneytotal;
    }

    public void setMoneytotal(Float moneytotal) {
        this.moneytotal = moneytotal;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getInputdate() {
        return inputdate;
    }

    public void setInputdate(String inputdate) {
        this.inputdate = inputdate == null ? null : inputdate.trim();
    }

    public String getBuydate() {
        return buydate;
    }

    public void setBuydate(String buydate) {
        this.buydate = buydate == null ? null : buydate.trim();
    }
}