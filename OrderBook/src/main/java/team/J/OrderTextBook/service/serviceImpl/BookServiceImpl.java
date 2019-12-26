package team.J.OrderTextBook.service.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import team.J.OrderTextBook.dao.*;
import team.J.OrderTextBook.pojo.*;
import team.J.OrderTextBook.service.BookService;

import java.util.Date;
import java.util.List;

/**
 * create by linjunli on 2019/6/24 0024 14:42
 */
@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private BookbuyedMapper bookbuyedMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private FinancialrecordMapper financialrecordMapper;

    @Autowired
    private BookcartMapper bookcartMapper;


    @Override
    public List<Book> getAllBooks() {
        return bookMapper.selectAll();
    }

    @Override
    public Book getById(Integer id) {
        return bookMapper.selectByPrimaryKey(id);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void add(Bookcart bookcart) {
        Bookbuyed bookbuyed = new Bookbuyed();
        User user = userMapper.selectByPrimaryKey(bookcart.getId());
        Book book = bookMapper.selectByPrimaryKey(bookcart.getBookid());
        Financialrecord financialrecord=new Financialrecord();
        if (book.getNumber()>=bookcart.getNumber()){
            Date date=new Date();
            bookbuyed.setAddress(user.getAddress());
            bookbuyed.setBookid(book.getId());
            bookbuyed.setBookname(book.getBookname());
            bookbuyed.setDate(date.toString());
            bookbuyed.setNumber(bookcart.getNumber());
            bookbuyed.setUsername(user.getUsername());
            bookbuyed.setPhonenum(user.getPhonenum());
            bookbuyed.setUserid(user.getId());
            bookbuyedMapper.insert(bookbuyed);

            book.setNumber(book.getNumber()-bookcart.getNumber());
            bookMapper.updateByPrimaryKey(book);

            financialrecord.setBookid(book.getId());
            financialrecord.setBookname(book.getBookname());
            financialrecord.setBuydate(date.toString());
            financialrecord.setInputdate(book.getInputdate());
            financialrecord.setMoneytotal(book.getPrice()*bookcart.getNumber());
            financialrecord.setNumber(bookcart.getNumber());
            financialrecord.setUserid(user.getId());
            financialrecord.setPrice(book.getPrice());
            financialrecord.setUsername(user.getUsername());
            financialrecordMapper.insert(financialrecord);
        }
        else{
            int i=1/0;
        }



    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void collect(Bookcart bookcart) {

        Bookbuyed bookbuyed = new Bookbuyed();
        Book book = bookMapper.selectByPrimaryKey(bookcart.getBookid());
        if (book.getNumber()>=bookcart.getNumber()){
            bookcartMapper.insert(bookcart);
        }
        else{
            int i=1/0;
        }
    }

    @Override
    public List<Book> search(String s) {
        String sx="%"+s+"%";
        return bookMapper.search(sx,sx,sx);
    }

    @Override
    public Book getBook_next(Integer id) {
        List<Book> books = bookMapper.selectAll();
        Integer ix=0;
        for (int i = 0; i <books.size() ; i++) {
            if(books.get(i).getId()==id&&i!=0){
                ix=books.get(i-1).getId();
            }
        }
        Book book = bookMapper.selectByPrimaryKey(ix);
        return book;
    }

    @Override
    public Book getBook_pre(Integer id) {
        List<Book> books = bookMapper.selectAll();
        Integer ix=0;
        for (int i = 0; i <books.size() ; i++) {
            if(books.get(i).getId()==id&&i!=books.size()-1){
                ix=books.get(i+1).getId();
            }
        }
        Book book = bookMapper.selectByPrimaryKey(ix);
        return book;
    }
    @Override
    public void addbook(Book book) {
      //  book.setImgpath("img/github.png");
        Date date = new Date();
        book.setInputdate(date.toString());
        book.setVisit(0);
        bookMapper.insert(book);
    }

    @Override
    public List<Book> getAllbooks() {
        return bookMapper.selectAll();
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void deleteBook(Integer id) {
        bookMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Book getBookById(Integer id) {

        return bookMapper.selectByPrimaryKey(id);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void updatebookInfo(Book book) {
        bookMapper.updateByPrimaryKey(book);
        Book book1 = bookMapper.selectByPrimaryKey(book.getId());
//        System.out.println(book1.getId());
//        System.out.println(book1.getPrice());
    }

    @Override
    public List<Book> getpage(Integer page, Integer count) {
        List<Book> books = bookMapper.selectByPage(page,count);
        return books;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void visit(Integer id) {
        Book book = bookMapper.selectByPrimaryKey(id);
        book.setVisit(book.getVisit()+1);
        bookMapper.updateByPrimaryKey(book);
    }

    @Override
    public void updateNumber(Integer id) {
        bookMapper.updateNumber(id);
    }

}
