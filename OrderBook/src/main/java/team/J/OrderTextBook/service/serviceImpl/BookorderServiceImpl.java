package team.J.OrderTextBook.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.J.OrderTextBook.dao.BookbuyedMapper;
import team.J.OrderTextBook.pojo.Book;
import team.J.OrderTextBook.pojo.Bookbuyed;
import team.J.OrderTextBook.service.BookorderService;

import java.util.List;

/**
 * Created by "ZH" on 2019/6/25  10:03
 */
@Service
public class BookorderServiceImpl implements BookorderService {
    @Autowired
    private BookbuyedMapper bookbuyedMapper;

    @Override
    public List<Bookbuyed> getOrderByName(String username) {
       return bookbuyedMapper.selectByName(username);
    }

    @Override
    public List<Book> getpage(Integer page, Integer count) {

        return bookbuyedMapper.selectOrderByPage(page, count);

    }
}
