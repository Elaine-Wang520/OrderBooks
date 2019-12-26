package team.J.OrderTextBook.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.J.OrderTextBook.dao.MessageupMapper;
import team.J.OrderTextBook.pojo.Messageup;
import team.J.OrderTextBook.service.MessageupService;

import java.util.*;

/**
 * Created by "ZH" on 2019/6/25  15:11
 */
@Service
public class MessageupServiceImpl implements MessageupService {
    @Autowired
    private MessageupMapper messageupMapper;

    @Override
    public void add(Messageup messageup) {
//        messageup.setTitle(null);
        Date date=new Date();
        messageup.setDate(date.toString());
        messageupMapper.insert(messageup);
    }

    @Override
    public void del(Integer id) {

        messageupMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Messageup> getMessages() {
        return messageupMapper.selectAll();
    }

    @Override
    public Map<Integer, String> getAllMessages() {
        List<Messageup> messageups=messageupMapper.selectAll();
        Map<Integer,String> map=new HashMap<>();
        for (Messageup messageup : messageups) {
            map.put(messageup.getId(),messageup.getTitle());
        }
        return map;
    }

    @Override
    public List<Messageup> getMessageInfo() {
        return messageupMapper.selectAll();
    }

    @Override
    public List<Messageup> getmessage(Integer get) {
        List<Messageup> messageups=new ArrayList<>();
        messageups.add(messageupMapper.selectByPrimaryKey(get));

        return messageups;
    }
}
