package team.J.OrderTextBook.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.J.OrderTextBook.pojo.Book;
import team.J.OrderTextBook.pojo.Bookcart;
import team.J.OrderTextBook.pojo.Message;
import team.J.OrderTextBook.service.BookService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * create by linjunli on 2019/6/24 0024 11:59
 */
@Controller
@RequestMapping("/books")
public class BookController {
    @Autowired
    private BookService bookService;


    //by ljl
    @RequestMapping("/getById")
    public String getById(Integer id, Model model){
        try {
            bookService.visit(id);
        }catch (Exception e){
            e.printStackTrace();
        }

        Book book_next = bookService.getBook_next(id);
        Book book_pre = bookService.getBook_pre(id);

        model.addAttribute("book_next",book_next);
        model.addAttribute("book_pre",book_pre);
        model.addAttribute("book",bookService.getById(id));
        return "bookdetail";
    }


    //by ljl
    @RequestMapping("/buyBooks")
    @ResponseBody
    public Message buyBooks(Bookcart bookcart){
        Message msg = new Message();
        try {
            bookService.add(bookcart);
            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作繁忙");
            return msg;
        }

    }

    //by ljl
    @RequestMapping("/addshopCart")
    @ResponseBody
    public Message collect(Bookcart bookcart){
        Message msg = new Message();
        try {
            bookService.collect(bookcart);
            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作繁忙");
            return msg;
        }

    }

    //by ljl
    @RequestMapping("/booksearch")

    public String booksearch(String sea, HttpServletRequest request){
        List<Book> book_lists = bookService.search(sea);
        request.setAttribute("book_lists",book_lists);
        return "booksearch";
    }

}
