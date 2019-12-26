package team.J.OrderTextBook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import team.J.OrderTextBook.pojo.*;
import team.J.OrderTextBook.service.*;
import team.J.OrderTextBook.utils.TomcatFileUtils;
import team.J.OrderTextBook.utils.UpFileUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by "ZH" on 2019/6/23  19:59
 */
@Controller
@RequestMapping("/admins")
public class AdminController {

    @Autowired
    private AdminLoginService adminLoginService;
    @Autowired
    private UserService userService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private BookService bookService;
    @Autowired
    private BookorderService bookorderService;

    @Autowired
    private FinancialService financialService;
    @RequestMapping("/index")
    public String index(HttpServletRequest request){
        //先从域中获取对象
        Administer administer = (Administer) request.getSession().getAttribute("admin");
        if (administer!=null) {
            //设置session域中的对象时，会设置过期时间
            //Redis 的MySQL数据库，会存储我们的user值，UUID的函数生成一个token
            request.getSession().setAttribute("admin", administer);
            //初始化主页面信息
            //initMyblog(request);
            return "admin";
        }
        else
            return "adminlogin";
    }
    @RequestMapping("/adminlogin")
    public String login(String adminName, String adminPassword, HttpServletRequest request){
        Administer administer = adminLoginService.login(adminName,adminPassword);
        if (administer!=null){
            request.getSession().setAttribute("admin",administer);
            //初始化页面 获取网站用户列表
           // List<User> list=userService.getAllusers();
            initpage(1,request);
            //request.setAttribute("users_list",list);
//            进行页面跳转（转发）
            return "admin";
        }
        else{
            request.setAttribute("msg","用户名或密码错误");
            return "adminlogin";
        }
    }
    @RequestMapping("/loginOut")
    public String loginOut(HttpServletRequest request){
        request.getSession().removeAttribute("admin");
        return "adminlogin";
    }
    @RequestMapping("/initpage")
    public String initpage(Integer page ,HttpServletRequest request){
        //初始化页面 获取网站用户列表
        List<User> list=userService.getAllusers();

        Integer totlecount=list.size();  //总数据记录
        Integer count=3;  //一页显示多少数据
        Integer currentpage;   //当前页
        if(page==null)
            currentpage=1;
        else
            currentpage=page;
        Integer totalPage = totlecount%count==0?totlecount/count:(totlecount/count)+1; //总页数
        request.getSession().setAttribute("currentPage",currentpage);
        request.getSession().setAttribute("totalPage",totalPage);

        List<User> users = userService.getpage(count*(currentpage-1),count);
        request.setAttribute("users_list",users);
//      进行页面跳转（转发）
        return "admin";
    }
    @RequestMapping("/deleteuser")
    @ResponseBody
    public Message deleteuser(Integer id){
        Message message = new Message();
        try {
            userService.deleteUser(id);
            message.setMsg("success");
            return message;
        }catch (Exception e){
            e.printStackTrace();
            message.setMsg("操作异常");
            return message;
        }
    }
    @RequestMapping("/searchuser")
    //@ResponseBody
    public String searchuser(String username,HttpServletRequest request){
        initpage(1,request);
        User user = userService.getUserByName(username);
       // System.out.println(user);
        request.setAttribute("search_user",user);

        return "admin";

    }

    @RequestMapping("manageadmin")
    public String manageadmin(HttpServletRequest request){
        List<Administer> admins_list = adminService.getAlladmin();
        request.setAttribute("admins_list",admins_list);
        return "adminad";
    }

    @RequestMapping("/deleteadmin")
    @ResponseBody
    public Message deleteadmin(Integer id){
        Message message = new Message();
        try {
            adminService.deleteAdmin(id);
            message.setMsg("success");
            return message;
        }catch (Exception e){
            e.printStackTrace();
            message.setMsg("操作异常");
            return message;
        }
    }

    @RequestMapping("/add")
    @ResponseBody
    public Message add(Administer administer){
        Message message = new Message();
        try {
            adminService.add(administer);
            message.setMsg("success");
            return message;
        }catch (Exception e){
            e.printStackTrace();
            message.setMsg("操作繁忙");
            return message;
        }
    }
    @RequestMapping("/addbook")
    @ResponseBody
    public Message addbook(Book book){
        Message message = new Message();
        try {
            bookService.addbook(book);
            message.setMsg("success");
            return message;
        }catch (Exception e){
            e.printStackTrace();
            message.setMsg("操作繁忙");
            return message;
        }
    }

    @RequestMapping("/updatebook")
    public String updatebook(Integer page,HttpServletRequest request){
        List<Book> books_list = bookService.getAllbooks();

        Integer totlecount=books_list.size();  //总数据记录
        Integer count=5;  //一页显示多少数据
        Integer currentpage;   //当前页
        if(page==null)
            currentpage=1;
        else
            currentpage=page;

        Integer totalPage = totlecount%count==0?totlecount/count:(totlecount/count)+1; //总页数
        request.getSession().setAttribute("currentPage",currentpage);
        request.getSession().setAttribute("totalPage",totalPage);

        List<Book> booklist = bookService.getpage(count*(currentpage-1),count);

        request.setAttribute("books_list",booklist);
        return "updatebook";
    }

    @RequestMapping("/searchbookorder")
    //@ResponseBody
    public String searchbookorder(Integer page,String username,HttpServletRequest request){
        List<Bookbuyed> search_bookorders_list= bookorderService.getOrderByName(username);
        Integer totlecount=search_bookorders_list.size();  //总数据记录
        Integer count=5;  //一页显示多少数据
        Integer currentpage;   //当前页
        if(page==null)
            currentpage=1;
        else
            currentpage=page;

        Integer totalPage = totlecount%count==0?totlecount/count:(totlecount/count)+1; //总页数
        request.getSession().setAttribute("currentPage",currentpage);
        request.getSession().setAttribute("totalPage",totalPage);

        List<Book> booklist = bookorderService.getpage(count*(currentpage-1),count);
        request.setAttribute("search_bookorders_list",search_bookorders_list);

        return "bookorder";

    }

    @RequestMapping("/deletebook")
    @ResponseBody
    public Message deletebook(Integer id){
        Message message = new Message();
        try {
            bookService.deleteBook(id);
            message.setMsg("success");
            return message;
        }catch (Exception e){
            e.printStackTrace();
            message.setMsg("操作异常");
            return message;
        }
    }

    @RequestMapping("/updatebookinfo")
    public String updatebookinfo(Integer id,HttpServletRequest request){
        Book book = bookService.getBookById(id);
        request.setAttribute("book",book);
        return "updatebookinfo";
    }

    @RequestMapping("/bookInfo")
    @ResponseBody
    public Message updatebookInfo(Book book){
        Message message = new Message();
        try {
//            System.out.println("888888888888888");
//            System.out.println(book.getId());
//            System.out.println(book.getBookname());
//            System.out.println(book.getPrice());
            bookService.updatebookInfo(book);
            message.setMsg("success");
            return message;
        }catch (Exception e){
            e.printStackTrace();
            message.setMsg("操作异常");
            return message;
        }
    }

    @RequestMapping("/financialrecord")
    public String Financialrecord(Integer page,HttpServletRequest request){
        List<Financialrecord> record_list = financialService.getAllRecords();

        Integer totlecount=record_list.size();  //总数据记录
        Integer count=5;  //一页显示多少数据
        Integer currentpage;   //当前页
        if(page==null)
            currentpage=1;
        else
            currentpage=page;

        Integer totalPage = totlecount%count==0?totlecount/count:(totlecount/count)+1; //总页数
        request.getSession().setAttribute("currentPage",currentpage);
        request.getSession().setAttribute("totalPage",totalPage);

        List<Financialrecord> financialRecords = financialService.getpage(count*(currentpage-1),count);
        request.setAttribute("record_list",financialRecords);
        return "financialrecord";
    }
    @RequestMapping("/buybooks")
    public String Buybooks(Integer id,HttpServletRequest request){
        //request.setAttribute("",);
        bookService.updateNumber(id);
        Book book = bookService.getBookById(id);
//        System.out.println(book.getId());
        Administer administer = (Administer)request.getSession().getAttribute("admin");
        financialService.addRecord(book,administer.getId(),administer.getName());
        updatebook(1,request);
        return "updatebook";
    }

    @RequestMapping("/up")
    public String file(MultipartFile file, HttpServletRequest request){
        String url= UpFileUtils.getUrl(file,request);
        String url1= TomcatFileUtils.getTomcatUrl(file,request);
        request.setAttribute("img_path",url);
        System.out.println(url);
        return "addbook";
    }

}
