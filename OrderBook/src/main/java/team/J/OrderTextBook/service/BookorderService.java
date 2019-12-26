package team.J.OrderTextBook.service;


import team.J.OrderTextBook.pojo.Book;
import team.J.OrderTextBook.pojo.Bookbuyed;

import java.util.List;

/**
 * Created by "ZH" on 2019/6/25  10:03
 */
public interface BookorderService {
    /**
     * 根据用户名获取订单
     * @param username
     * @return
     */
    List<Bookbuyed> getOrderByName(String username);

    /**
     * 获取分页数据
     * @param page
     * @param count
     * @return
     */
    List<Book> getpage(Integer page, Integer count);
}
