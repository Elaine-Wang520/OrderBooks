package team.J.OrderTextBook.dao;

import java.util.List;
import team.J.OrderTextBook.pojo.Messageup;

public interface MessageupMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Messageup record);

    Messageup selectByPrimaryKey(Integer id);

    List<Messageup> selectAll();

    int updateByPrimaryKey(Messageup record);
}