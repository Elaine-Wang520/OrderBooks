package team.J.OrderTextBook.service;


import team.J.OrderTextBook.pojo.User;

import java.util.List;

/**
 * create by 王镜 on 2019/6/24 0024 16:49
 */
public interface UserService {
    /**
     * 获取网站用户列表
     * @return
     */
    List<User> getAllusers();

    /**
     * 根据id删除用户
     * @param id
     */
    void deleteUser(Integer id);

    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    User getUserByName(String username);

    /**
     * 获取分页数据
     * @param page
     * @param count
     * @return
     */
    List<User> getpage(Integer page, Integer count);
    /**
     * 注册用户  by ljl
     * @param user
     * @return
     */
    int add(User user);

    /**
     * wj
     * 通过用户ID获取用户基本信息
     * @param id
     * @return
     */
    User getUserInfoById(Integer id);

    /**
     * wj
     * 修改用户信息
     * @param user
     */
    void update(User user, Integer id);



    /**
     * wj
     * 修改用户密码
     * @param password
     */
    void updatepwd(User user, String password);

}
