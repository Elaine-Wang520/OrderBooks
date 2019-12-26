package team.J.OrderTextBook.service;


import team.J.OrderTextBook.pojo.Bookcart;

import java.util.List;

/**
 * create by 王镜 on 2019/6/24 0024 20:22
 */
public interface BookCartService {

    /**
     * wj
     * 通过用户ID查看用户购物车信息
     * @param id
     * @return
     */
    List<Bookcart> getBuyCart(Integer id);

    /**
     * wj
     * 计算购物车中所有商品的价值
     * @param id
     * @return
     */
    Float getBuyCart_money(Integer id);

    /**
     * wj
     * 根据Id删除购物车的信息
     * @param id
     */
    void delBuyCart(Integer id);

    /**
     * 购买所有购物车的图书
     */
    void delBuyCartBooks(Integer id);

    void buyOneBook(Integer id);
}
