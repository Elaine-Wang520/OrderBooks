package team.J.OrderTextBook.service.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.J.OrderTextBook.dao.BookbuyedMapper;
import team.J.OrderTextBook.pojo.Bookbuyed;
import team.J.OrderTextBook.service.BuyedService;

import java.util.List;

/**
 * create by linjunli on 2019/6/24 0024 15:03
 */
@Service
public class BuyedServiceImpl implements BuyedService {
    @Autowired
    private BookbuyedMapper bookbuyedMapper;
    @Override
    public List<Bookbuyed> getAllBuyedBooks() {
        return bookbuyedMapper.selectAllBuyedBooks();
    }

    @Override
    public List<Bookbuyed> getBuyedBooksById(Integer id) {
        List<Bookbuyed> bookbuyedList=bookbuyedMapper.selectBuyedBooksById(id);
        return bookbuyedList;
    }
}
