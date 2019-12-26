package team.J.OrderTextBook.service;


import team.J.OrderTextBook.pojo.Book;
import team.J.OrderTextBook.pojo.Bookcart;

import java.util.List;

/**
 * create by linjunli on 2019/6/24 0024 14:41
 */

public interface BookService {
    /**
     * 获得所有图书 by ljl
     * @return
     */
    List<Book> getAllBooks();

    /**
     * 根据id获得图书详细信息 by ljl
     * @param id
     * @return
     */
    Book getById(Integer id);

    /**
     * 购买 by ljl
     * @param bookcart
     */
    void add(Bookcart bookcart);

    /**
     * 加入购物车 by ljl
     * @param bookcart
     */
    void collect(Bookcart bookcart);

    /**
     * 搜索图书信息 by ljl
     * @param s
     * @return
     */
    List<Book> search(String s);

    /**
     * ljl
     * 下一页
     * @param id
     * @return
     */
    Book getBook_next(Integer id);

    /**
     * 上一页
     * @param id
     * @return
     */
    Book getBook_pre(Integer id);
    /**
     * 添加教材
     * @param book
     */
    void addbook(Book book);

    /**
     * 查看所有教材
     * @return
     */
    List<Book> getAllbooks();

    /**
     * 删除教材
     * @param id
     */
    void deleteBook(Integer id);

    /**
     * 根据id获取教材信息
     * @param id
     * @return
     */
    Book getBookById(Integer id);

    /**
     * 更新教材信息
     * @param book
     */
    void updatebookInfo(Book book);

    /**
     * 获取分页数据
     * @param page
     * @param count
     * @return
     */
    List<Book> getpage(Integer page, Integer count);

    /**
     * 更新浏览次数
     * @param id
     */
    void visit(Integer id);

    /**
     * 更新教材数量
     * @param id
     */
    void updateNumber(Integer id);
}
