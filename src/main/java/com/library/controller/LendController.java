package com.library.controller;


import com.library.bean.Reader;
import com.library.service.LendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpSession;

@Controller
public class LendController {
    @Autowired
    private LendService lendService;
 
    /**
     * admin得到所有借还记录
     * @return
     */
    @RequestMapping("/admin/lendlist.html")
    public ModelAndView lendList() {
        ModelAndView modelAndView = new ModelAndView("admin/lendlist");
        modelAndView.addObject("list", lendService.findAll());
        return modelAndView;
    }
    
    /**
     * admin删除借还记录
     * @param serNum
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/admin/deletelend.html")
    public String deleteLend(long serNum, RedirectAttributes redirectAttributes) {
        if (lendService.deleteBySerNum(serNum) > 0) {
            redirectAttributes.addFlashAttribute("succ", "记录删除成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "记录删除失败！");
        }
        return "redirect:/admin/lendlist.html";
    }

   

    
    /**
     * reader得到自己所有的借还记录
     * @param session
     * @return
     */
    @RequestMapping("/reader/lendlist.html")
    public ModelAndView myLend(HttpSession session) {
        Reader reader = (Reader) session.getAttribute("sessionReader");
        ModelAndView modelAndView = new ModelAndView("reader/lendlist");
        modelAndView.addObject("list", lendService.findAllByReaderId(reader.getReaderId()));
        return modelAndView;
    }
   /**
    * reader借书 
    * @param bookId
    * @param session
    * @param redirectAttributes
    * @return
    */
    @RequestMapping("/reader/lendbook.html")
    public String bookLend(long bookId,HttpSession session, RedirectAttributes redirectAttributes) {
        long readerId = ((Reader) session.getAttribute("sessionReader")).getReaderId();
        if (lendService.lendBook(bookId, readerId)) {
            redirectAttributes.addFlashAttribute("succ", "图书借阅成功！");
        } else {
            redirectAttributes.addFlashAttribute("succ", "图书借阅成功！");
        }
        return "redirect:/reader/books.html";
    }

    /**
     * reader还书
     * @param bookId
     * @param session
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/reader/returnbook.html")
    public String bookReturn(long bookId,HttpSession session, RedirectAttributes redirectAttributes) {
        long readerId = ((Reader) session.getAttribute("sessionReader")).getReaderId();
        if (lendService.returnBook(bookId, readerId)) {
            redirectAttributes.addFlashAttribute("succ", "图书归还成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "图书归还失败！");
        }
        return "redirect:/reader/books.html";
    }
    
   
    
    
}
