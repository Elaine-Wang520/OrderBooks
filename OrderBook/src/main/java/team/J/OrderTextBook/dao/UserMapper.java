package team.J.OrderTextBook.dao;

import org.apache.ibatis.annotations.Param;
import team.J.OrderTextBook.pojo.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);

    User selectByUsername(String username);

    List<User> selectUserByPage(@Param(value = "page") Integer page, @Param(value = "count") Integer count);
}