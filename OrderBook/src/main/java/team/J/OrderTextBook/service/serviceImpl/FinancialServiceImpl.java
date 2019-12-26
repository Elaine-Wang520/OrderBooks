package team.J.OrderTextBook.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.J.OrderTextBook.dao.FinancialrecordMapper;
import team.J.OrderTextBook.pojo.Book;
import team.J.OrderTextBook.pojo.Financialrecord;
import team.J.OrderTextBook.service.FinancialService;

import java.util.Date;
import java.util.List;

/**
 * Created by "ZH" on 2019/6/26  10:27
 */
@Service
public class FinancialServiceImpl implements FinancialService {
    @Autowired
    private FinancialrecordMapper financialRecordMapper;
    @Override
    public List<Financialrecord> getAllRecords() {
        return financialRecordMapper.selectAll();
    }

    @Override
    public List<Financialrecord> getpage(Integer page, Integer count) {

        return financialRecordMapper.selectByPage(page, count);
    }

    @Override
    public void addRecord(Book book, Integer id, String name) {
        Financialrecord financialrecord=new Financialrecord();
        financialrecord.setBookid(book.getId());
        financialrecord.setBookname(book.getBookname());
        financialrecord.setNumber(200);
        financialrecord.setPrice(book.getPrice());
        financialrecord.setMoneytotal(-1*200*book.getPrice());
        financialrecord.setUserid(id);
        financialrecord.setUsername(name+"/ad");
        Date date = new Date();
        financialrecord.setInputdate(date.toString());
        financialRecordMapper.insert(financialrecord);
    }
}
