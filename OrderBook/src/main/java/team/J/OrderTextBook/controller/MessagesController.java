package team.J.OrderTextBook.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.J.OrderTextBook.pojo.Message;
import team.J.OrderTextBook.pojo.Messageup;
import team.J.OrderTextBook.service.MessageupService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * create by linjunli on 2019/6/24 0024 15:40
 */
@Controller
@RequestMapping("/messages")
public class MessagesController {
    @Autowired
    private MessageupService messageService;

    @RequestMapping("/add")
    @ResponseBody
    public Message add(Messageup messageup){
        Message msg=new Message();
        try {
            messageService.add(messageup);
            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作繁忙");
            return msg;
        }
    }

    @RequestMapping("/initpage")
    public String initpage(HttpServletRequest request) {
        List<Messageup> list1 = messageService.getMessages();
        request.setAttribute("messageup", list1);
        return "message";
    }

    @RequestMapping("/del")
    @ResponseBody
    public Message del(Integer id){
        Message msg=new Message();
        try {
            messageService.del(id);
            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作异常");
            return msg;
        }
    }
    //by ljl
    @RequestMapping("/getMessageInfo")
    public String getTagInfo(Model model){
        List<Messageup> message_list = messageService.getMessageInfo();
        model.addAttribute("messages",message_list);
        return "messages";

    }
    //by ljl
    @RequestMapping("/getmessage")
    public String getmessage(Model model,Integer get){
        List<Messageup> message_list = messageService.getmessage(get);
        model.addAttribute("messages",message_list);
        return "messages";
    }
}
