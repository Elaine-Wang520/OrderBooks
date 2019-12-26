package team.J.OrderTextBook.dao;

import team.J.OrderTextBook.pojo.Bookcart;

import java.util.List;

public interface BookcartMapper {
    int deleteByPrimaryKey(Integer xid);

    int insert(Bookcart record);

    Bookcart selectByPrimaryKey(Integer xid);

    List<Bookcart> selectAll();

    int updateByPrimaryKey(Bookcart record);

    List<Bookcart> selectByUserId(Integer id);

    void deleteByxid(Integer id);

    void deleteAll(Integer id);

    Bookcart selectBookCartByxId(Integer id);
}