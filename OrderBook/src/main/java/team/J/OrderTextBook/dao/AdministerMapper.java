package team.J.OrderTextBook.dao;

import team.J.OrderTextBook.pojo.Administer;

import java.util.List;

public interface AdministerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Administer record);

    Administer selectByPrimaryKey(Integer id);

    List<Administer> selectAll();

    int updateByPrimaryKey(Administer record);

    Administer selectByAdminName(String adminName);
}