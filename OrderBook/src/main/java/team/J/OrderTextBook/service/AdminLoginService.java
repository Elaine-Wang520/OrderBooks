package team.J.OrderTextBook.service;


import team.J.OrderTextBook.pojo.Administer;

/**
 * Created by "ZH" on 2019/6/23  21:27
 */
public interface AdminLoginService {

    Administer login(String adminName, String adminPassword);
}
