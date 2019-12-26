package team.J.OrderTextBook.pojo;

import java.io.Serializable;

public class Book implements Serializable {
    private Integer id;

    private String bookname;

    private Integer number;

    private String author;

    private Float price;

    private String press;

    private String pressdate;

    private String inputname;

    private String inputdate;

    private String imgpath;

    private Integer visit;

    private String content;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
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
        this.press = press == null ? null : press.trim();
    }

    public String getPressdate() {
        return pressdate;
    }

    public void setPressdate(String pressdate) {
        this.pressdate = pressdate == null ? null : pressdate.trim();
    }

    public String getInputname() {
        return inputname;
    }

    public void setInputname(String inputname) {
        this.inputname = inputname == null ? null : inputname.trim();
    }

    public String getInputdate() {
        return inputdate;
    }

    public void setInputdate(String inputdate) {
        this.inputdate = inputdate == null ? null : inputdate.trim();
    }

    public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath == null ? null : imgpath.trim();
    }

    public Integer getVisit() {
        return visit;
    }

    public void setVisit(Integer visit) {
        this.visit = visit;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}