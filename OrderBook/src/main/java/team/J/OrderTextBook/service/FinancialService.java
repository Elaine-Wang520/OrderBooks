package team.J.OrderTextBook.service;

import team.J.OrderTextBook.pojo.Book;
import team.J.OrderTextBook.pojo.Financialrecord;

import java.util.List;

/**
 * Created by "ZH" on 2019/6/26  10:27
 */
public interface FinancialService {
    /**
     * 获取所有财务记录
     * @return
     */
    List<Financialrecord> getAllRecords();

    /**
     * 获取分页 数据
     * @param page
     * @param count
     * @return
     */
    List<Financialrecord> getpage(Integer page, Integer count);

    /**
     * 添加教材进书记录
     * @param book
     * @param id
     * @param name
     */
    void addRecord(Book book, Integer id, String name);
}
