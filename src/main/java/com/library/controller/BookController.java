package com.library.controller;

import com.library.bean.Book;
import com.library.bean.Lend;
import com.library.bean.Reader;
import com.library.service.BookService;
import com.library.service.LendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private LendService lendService;

  

    /**
     * admin展示所有图书books
     * @return
     */
    @RequestMapping("/admin/books.html")
    public ModelAndView adminBooks() {
        ArrayList<Book> list = bookService.findAll();
        ModelAndView modelAndView = new ModelAndView("admin/books");
        modelAndView.addObject("list", list);
        return modelAndView;
    }
   /**
    * admin搜索图书book
    * @param searchWord
    * @return
    */
    @RequestMapping("/admin/querybook.html")
	public ModelAndView queryBookDo(String searchWord) {
		List<Book>  list=bookService.query(searchWord);
	    if (list!=null) {
	        ModelAndView modelAndView = new ModelAndView("admin/books");
	        modelAndView.addObject("list", list);
	        return modelAndView;
	    } else {
	        return new ModelAndView("admin/books", "error", "没有匹配的图书");
	    }
	}

    /**
     * admin得到添加图书页面
     * @return
     */
    @RequestMapping("/admin/book_add.html")
    public ModelAndView addBook() {
        return new ModelAndView("admin/book_add");
    }
    /**
     * admin添加图书book
     * @param book
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/admin/book_add_do.html")
    public String addBookDo(Book book, RedirectAttributes redirectAttributes) {
        if (bookService.add(book)) {
            redirectAttributes.addFlashAttribute("succ", "图书添加成功！");
        } else {
            redirectAttributes.addFlashAttribute("succ", "图书添加失败！");
        }
        return "redirect:/admin/books.html";
    }

    

    /**
     * admin得到编辑图书页面
     * @param bookId
     * @return
     */
    @RequestMapping("/admin/book_edit.html")
    public ModelAndView bookEdit(long bookId) {
        Book book = bookService.findByBookId(bookId);
        ModelAndView modelAndView = new ModelAndView("admin/book_edit");
        modelAndView.addObject("book", book);
        return modelAndView;
    }
    /**
     * admin编辑图书
     * @param book
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/admin/book_edit_do.html")
    public String bookEditDo(Book book, RedirectAttributes redirectAttributes) {
        if (bookService.edit(book)) {
            redirectAttributes.addFlashAttribute("succ", "图书修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "图书修改失败！");
        }
        return "redirect:/admin/books.html";
    }
    
    
    
    /**
     * admin删除图书
     * @param bookId
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/admin/deletebook.html")
    public String deleteBook(long bookId, RedirectAttributes redirectAttributes) {
        if (bookService.deleteByBookId(bookId)) {
            redirectAttributes.addFlashAttribute("succ", "图书删除成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "图书删除失败！");
        }
        return "redirect:/admin/books.html";
    }
    
    
    
    
    /**
     * reader展示所有图书
     * @param session
     * @return
     */
    @RequestMapping("/reader/books.html")
    public ModelAndView readerBooks(HttpSession session) {
        ArrayList<Book> list = bookService.findAll();
        Reader reader = (Reader) session.getAttribute("sessionReader");
        ArrayList<Lend> myAllLendList = lendService.findAllByReaderId(reader.getReaderId());
        ArrayList<Long> myLendList = new ArrayList<>();
        for (Lend lend : myAllLendList) {
            // 是否已归还
            if (lend.getBackDate() == null) {
                myLendList.add(lend.getBookId());
            }
        }
        ModelAndView modelAndView = new ModelAndView("reader/books");
        modelAndView.addObject("list", list);
        modelAndView.addObject("myLendList", myLendList);
        return modelAndView;
    }
    
    
    /**
     * reader搜索图书
     * @param searchWord
     * @return
     */
	@RequestMapping("/reader/querybook.html")
	public ModelAndView readerQueryBookDo(String searchWord) {
		List<Book>  list=bookService.query(searchWord);
	    if (list!=null) {
	        ModelAndView modelAndView = new ModelAndView("reader/books");
	        modelAndView.addObject("list", list);
	        return modelAndView;
	    } else {
	        return new ModelAndView("reader_books", "error", "没有匹配的图书");
	    }
	}
    
    /**
     * reader得到图书详情页面
     * @param bookId
     * @return
     */
    @RequestMapping("/reader/book_detail.html")
    public ModelAndView readerBookDetail(long bookId) {
        Book book = bookService.findByBookId(bookId);
        ModelAndView modelAndView = new ModelAndView("reader/book_detail");
        modelAndView.addObject("book", book);
        return modelAndView;
    }

  

  
}
