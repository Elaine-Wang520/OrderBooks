package team.J.OrderTextBook.service;


import team.J.OrderTextBook.pojo.Bookbuyed;

import java.util.List;

/**
 * create by linjunli on 2019/6/24 0024 15:03
 */
public interface BuyedService {
    /**
     * 获取所有购买的图书信息，进行排行 by ljl
     * @return
     */
    List<Bookbuyed> getAllBuyedBooks();

    /**
     * wj
     * 根据用户Id查看所有已经购买的商品
     * @param id
     * @return
     */
    List<Bookbuyed> getBuyedBooksById(Integer id);
}
