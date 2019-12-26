package team.J.OrderTextBook.service;

import team.J.OrderTextBook.pojo.Administer;

import java.util.List;

/**
 * Created by "ZH" on 2019/6/24  17:04
 */
public interface AdminService {
    /**
     * 获取所有后台管理员
     * @return
     */
    List<Administer> getAlladmin();

    /**
     * 删除管理员
     * @param id
     */
    void deleteAdmin(Integer id);

    /**
     * 添加管理员
     * @param administer
     */
    void add(Administer administer);


}
