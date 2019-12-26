package team.J.OrderTextBook.dao;

import java.util.List;
import team.J.OrderTextBook.pojo.Bookneeded;

public interface BookneededMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Bookneeded record);

    Bookneeded selectByPrimaryKey(Integer id);

    List<Bookneeded> selectAll();

    int updateByPrimaryKey(Bookneeded record);
}