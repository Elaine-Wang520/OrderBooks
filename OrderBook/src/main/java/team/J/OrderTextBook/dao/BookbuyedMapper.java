package team.J.OrderTextBook.dao;

import org.apache.ibatis.annotations.Param;
import team.J.OrderTextBook.pojo.Book;
import team.J.OrderTextBook.pojo.Bookbuyed;

import java.util.List;

public interface BookbuyedMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Bookbuyed record);

    Bookbuyed selectByPrimaryKey(Integer id);

    List<Bookbuyed> selectAll();

    int updateByPrimaryKey(Bookbuyed record);

    List<Bookbuyed> selectAllBuyedBooks();

    List<Bookbuyed> selectBuyedBooksById(Integer id);

    List<Bookbuyed> selectByName(String username);

    List<Book> selectOrderByPage(@Param(value = "page") Integer page, @Param(value = "count") Integer count);
}