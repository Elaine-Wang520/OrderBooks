package team.J.OrderTextBook.service;

import team.J.OrderTextBook.pojo.Messageup;

import java.util.List;
import java.util.Map;

/**
 * Created by "ZH" on 2019/6/25  15:10
 */
public interface MessageupService {
    /**
     * 添加公告
     * @param messageup
     */
    void add(Messageup messageup);

    /**
     * 删除公告
     * @param id
     */
    void del(Integer id);

    /**
     * 获取所有公告
     * @return
     */
    List<Messageup> getMessages();
    /**
     * 获得所有发布的信息，在首页显示导航 by ljl
     * @return
     */
    Map<Integer, String> getAllMessages();


    /**
     * 获得所有发布的信息，显示详尽的信息  by ljl
     * @return
     */
    List<Messageup> getMessageInfo();

    /**
     * 根据id获得发布消息的内容 by ljl
     * @param get
     * @return
     */
    List<Messageup> getmessage(Integer get);
}
