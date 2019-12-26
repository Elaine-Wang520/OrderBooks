package team.J.OrderTextBook.service.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.J.OrderTextBook.dao.*;
import team.J.OrderTextBook.pojo.*;
import team.J.OrderTextBook.service.BookCartService;

import java.util.Date;
import java.util.List;

/**
 * create by 王镜 on 2019/6/24 0024 20:22
 */
@Service
public class BookCartServiceImpl implements BookCartService {
    @Autowired
    private BookcartMapper bookcartMapper;
    @Autowired
    private BookbuyedMapper bookbuyedMapper;
    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private FinancialrecordMapper financialrecordMapper;
    @Override
    public List<Bookcart> getBuyCart(Integer id) {
        List<Bookcart> bookcarts=bookcartMapper.selectByUserId(id);
        return bookcarts;
    }

    @Override
    public Float getBuyCart_money(Integer id) {
        float money=0;
        List<Bookcart> bookcarts=bookcartMapper.selectByUserId(id);
        for (Bookcart bookcart : bookcarts) {
            money+=bookcart.getNumbers()*bookcart.getPrice();
        }
        return money;
    }

    @Override
    public void delBuyCart(Integer id) {
        bookcartMapper.deleteByxid(id);
    }

    @Override
    public void delBuyCartBooks(Integer id) {
        List<Bookcart> bookcarts=bookcartMapper.selectAll();
        Book book;
        User user;
        Bookbuyed bookbuyed;
        Financialrecord financialrecord;
        for (Bookcart bookcart : bookcarts) {
            bookbuyed = new Bookbuyed();
            user = userMapper.selectByPrimaryKey(bookcart.getId());
            book = bookMapper.selectByPrimaryKey(bookcart.getBookid());
            financialrecord=new Financialrecord();
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
        bookcartMapper.deleteAll(id);
    }

    @Override
    public void buyOneBook(Integer id) {
        Bookcart bookcart=bookcartMapper.selectBookCartByxId(id);
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
        bookcartMapper.deleteByxid(id);
    }

}
