package team.J.OrderTextBook.dao;

import org.apache.ibatis.annotations.Param;
import team.J.OrderTextBook.pojo.Book;

import java.util.List;

public interface BookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Book record);

    Book selectByPrimaryKey(Integer id);

    List<Book> selectAll();

    int updateByPrimaryKey(Book record);

    List<Book> search(@Param(value = "s1") String sx, @Param(value = "s2") String sx1, @Param(value = "s3") String sx2);

    List<Book> selectByPage(@Param(value = "page") Integer page,@Param(value = "count") Integer count);

    void updateNumber(Integer id);

}