package team.J.OrderTextBook.pojo;

import java.io.Serializable;

public class Bookcart implements Serializable {
    private Integer id;
    private Integer xid;

    private Integer bookid;

    private Integer number;

    private Integer numbers;
    private String bookname;

    private String author;

    private Float price;

    private String press;

    private String pressdate;

    private String phonenum;

    private String truthname;

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getAuthor() {
        return author;
    }

    public Integer getXid() {
        return xid;
    }

    public void setXid(Integer xid) {
        this.xid = xid;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getPressdate() {
        return pressdate;
    }

    public void setPressdate(String pressdate) {
        this.pressdate = pressdate;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getTruthname() {
        return truthname;
    }

    public void setTruthname(String truthname) {
        this.truthname = truthname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    private String address;

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

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
    public Integer getNumbers() {
        return numbers;
    }

    public void setNumbers(Integer numbers) {
        this.numbers = numbers;
    }
}