package team.J.OrderTextBook.controller;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import team.J.OrderTextBook.pojo.*;
import team.J.OrderTextBook.service.*;
import team.J.OrderTextBook.utils.filetupch;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * create by 王镜 on 2019/6/24 0024 16:43
 */
@Controller
@RequestMapping("/users")
public class UserController {
    @Autowired
    private LoginService loginService;
    @Autowired
    private BookService bookService;
    @Autowired
    private MessageupService messageupService;
    @Autowired
    private BuyedService buyedService;
    @Autowired
    private UserService userService;
    @Autowired
    private BookCartService bookCartService;

    //by ljl
    @RequestMapping("/index")
    public String home(HttpServletRequest request){
        initMyblog(request);
        return "main";

    }

    //by ljl
    private void initMyblog(HttpServletRequest request) {
        List<Book> book_list=bookService.getAllBooks();
        request.getSession().setAttribute("book_list",book_list);
        Map<Integer,String> message_list=messageupService.getAllMessages();
        request.getSession().setAttribute("message_list",message_list);
        final List<Bookbuyed> books = buyedService.getAllBuyedBooks();
        request.getSession().setAttribute("books",books);

    }
    //by ljl
    @RequestMapping("/syLogin")
    public String syLogin(HttpServletRequest request){

        User user=(User) request.getSession().getAttribute("user");
        if (user!=null){
            //我们在域中添加user对象的时候，会给session设置过期时间
            //有一个redis的nosql数据库会存储我们的user值  uuId的函数生成一个随机的字符串
            request.getSession().setAttribute("user",user);
            //初始化主页面信息
            initMyblog(request);
            return "main";

        }
        else{
            return "login";
        }
    }



    //by ljl
    @RequestMapping("/login")

    public String login(String username, String password, HttpServletRequest request){
        //Integer id=2;
        //String password="123";
        User user=loginService.login(username,password);
        if(user!=null){
            request.getSession().setAttribute("user",user);
            initMyblog(request);
            return "main";
        }
        else{
            request.setAttribute("msg","用户密码错误");
            return "login";
        }

    }


    //by ljl
    @RequestMapping("/loginOut")
    public String logout(HttpServletRequest request){
        if(request.getSession().getAttribute("user")!=null)//判断用户名是不是为空
        {
            request.getSession().removeAttribute("user");//注销
        }
        return "main";
    }


    //by ljl
    @RequestMapping("/register")
    public String register(User user,HttpServletRequest request){
        int flag=5;
        System.out.println(user.getUsername()+"/"+user.getAddress()+"/"
                        +user.getPassword()+
                "/"+user.getPhonenum()+"/"+user.getImg()+user.getEmail()+
                        "/"+user.getEntertime()+"/"+
                user.getEmail());
        try {
            if(user.getUsername()!=""&&user.getPassword()!=""
                    &&user.getAddress()!=""&&user.getPhonenum()!=""
                    &&user.getTruthname()!=""&&user.getEmail()!="")
            {
                flag=userService.add(user);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        if(flag==0){
            return "login";
        }
        else{
            request.setAttribute("msg","用户信息输入错误");
        }
        return "register";
    }



    /**
     * wj
     * 获取当前登录用户的基本信息
     * @param request
     * @return
     */
    @RequestMapping("/getUserInfo")
    public String UserInfo(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        User user1=userService.getUserInfoById(user.getId());
        request.setAttribute("user",user1);
        request.getSession().setAttribute("user",user);
        return "userPersonal";
    }

    /**
     * wj
     * 修改数据基本信息（初试加载）
     * @param request
     * @return
     */
    @RequestMapping("/alterData")
    public String UserAlterData(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        User user1=userService.getUserInfoById(user.getId());
        request.setAttribute("user",user1);
        request.getSession().setAttribute("user",user);
        return "userAlterData";
    }

    @RequestMapping("/fileUp")
    public String fileup(MultipartFile file, Integer id, HttpServletRequest request){

        String name=id.toString()+".jpg";
        String url = filetupch.getUrl(file,name,request);

        request.setAttribute("img",url);
        request.setAttribute("msg","头像上传成功");
        return "userAlterData";
    }

    /**
     * wj
     * 修改用户基本信息
     * @param user
     * @param request
     * @return
     */
    @RequestMapping("/alter")
    @ResponseBody
    public Message alter(User user,HttpServletRequest request){
        User user1=(User)request.getSession().getAttribute("user");
        request.removeAttribute("msg");
        if(user.getImg()==""){
            user.setImg(user1.getImg());
        }
        Message msg=new Message();
        try{
            userService.update(user,user1.getId());
            msg.setMsg("success");
            request.getSession().setAttribute("user",user1);
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作繁忙");
            return msg;
        }
    }

    /**
     * 修改用户密码（初试加载）
     * @param request
     * @return
     */
    @RequestMapping("/userAlterPwd")
    public String userAlterPwd(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        User user1=userService.getUserInfoById(user.getId());
        request.setAttribute("userInfo",user1);
        request.getSession().setAttribute("user",user);
        return "userAlterPwd";
    }

    /**
     * 修改用户密码
     * @param oldpwd
     * @param newpwd
     * @param password
     * @param request
     * @return
     */
    @RequestMapping("/alterPwd")
    public String alterPwd(String oldpwd,String newpwd,String password,HttpServletRequest request){
        if(oldpwd.equals(newpwd)){
            request.setAttribute("msg","新密码与旧密码相同");
            return "userAlterPwd";
        }
        if(oldpwd==""){
            request.setAttribute("msg","请填写旧密码");
            return "userAlterPwd";
        }
        if(newpwd==""){
            request.setAttribute("msg","请填写新密码");
            return "userAlterPwd";
        }
        if(password==""){
            request.setAttribute("msg","请确认新密码");
            return "userAlterPwd";
        }
        if(newpwd.equals(password)){
            try{
                User user=(User)request.getSession().getAttribute("user");
                User user1=userService.getUserInfoById(user.getId());
                request.setAttribute("user1",user1);
                Md5Hash md5Hash = new Md5Hash(oldpwd,user.getUsername(),100);
                oldpwd=md5Hash.toString();
                if(oldpwd.equals(user1.getPassword())){
                    Md5Hash pwd = new Md5Hash(password,user.getUsername(),100);
                    userService.updatepwd(user1,pwd.toString());
                    request.setAttribute("msg","密码修改成功");
                }else {
                    request.setAttribute("msg","旧密码错误");
                    return "userAlterPwd";
                }
            }catch (Exception e){
                e.printStackTrace();
            }
            return "login";
        }
        else {
            request.setAttribute("msg","新密码两次输入不一致");
            return "userAlterPwd";
        }
    }


    /**
     * wj
     * 购买某一本书
     * @param id
     * @return
     */
    @RequestMapping("/buyOneBook")
    @ResponseBody
    public Message buyOneBook(Integer id){
        Message msg=new Message();
        try{
            bookCartService.buyOneBook(id);
            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作异常");
            return msg;
        }
    }

    /**
     * wj
     * 购买购物车中所有书籍
     * @return
     */
    @RequestMapping("/buyCartBooks")
    @ResponseBody
    public Message buyCartBooks(HttpServletRequest request){
        Message msg=new Message();
        try{
            User user=(User)request.getSession().getAttribute("user");
            Integer id=user.getId();
            bookCartService.delBuyCartBooks(id);
            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作异常");
            return msg;
        }
    }

    /**
     * wj
     * 加载用户购物车信息
     * @param request
     * @return
     */
    @RequestMapping("/userBuyCart")
    public String UserBuyCart(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        List<Bookcart> bookcarts=bookCartService.getBuyCart(user.getId());
        User user1=userService.getUserInfoById(user.getId());
        request.setAttribute("user",user1);
        request.setAttribute("bookcart_list",bookcarts);
        float buycart_money=bookCartService.getBuyCart_money(user.getId());
        request.setAttribute("buycart_money",buycart_money);
        request.getSession().setAttribute("user",user);
        return "userBuyCart";
    }

    /**
     * 获取所有订单列表
     * @param request
     * @return
     */
    @RequestMapping("/userOrders")
    public String UserOrders(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        List<Bookbuyed> bookbuyedlist=buyedService.getBuyedBooksById(user.getId());
        request.setAttribute("bookbuyed_list",bookbuyedlist);
        request.getSession().setAttribute("user",user);
        return "userOrders";
    }

    /**
     * 删除购物车中某条记录
     * @param id
     * @return
     */
    @RequestMapping("/delBuyCart")
    @ResponseBody
    public Message delBuyCart(Integer id){
        Message msg=new Message();
        try{
            bookCartService.delBuyCart(id);
            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作异常");
            return msg;
        }
    }


}
