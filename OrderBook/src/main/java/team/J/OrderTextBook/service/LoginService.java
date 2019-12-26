package team.J.OrderTextBook.service;


import team.J.OrderTextBook.pojo.User;

/**
 * create by linjunli on 2019/6/24 0024 13:13
 */
public interface LoginService {
    /**
     * 登录  by ljl
     * @param username
     * @param password
     * @return
     */
    User login(String username, String password);
}
