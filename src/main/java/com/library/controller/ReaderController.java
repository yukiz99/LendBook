package com.library.controller;


import com.library.bean.Reader;
import com.library.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;


@Controller
public class ReaderController {
    @Autowired
    private ReaderService readerService;

    
    /**
     * admin得到所有reader
     * @return
     */
    @RequestMapping("/admin/readers.html")
    public ModelAndView allReaders() {
        ArrayList<Reader> list = readerService.findAll();
        ModelAndView modelAndView = new ModelAndView("admin/readers");
        modelAndView.addObject("list", list);
        return modelAndView;
    }
    
    @RequestMapping("/admin/queryreader.html")
    public ModelAndView queryReaderDo(String searchWord) {
    	List<Reader> list=new ArrayList();
    	if(searchWord.matches("[0-9]*")) {
    		long readerId=Long.parseLong(searchWord);
    		Reader reader=readerService.findByReaderId(readerId);
    		if(reader!=null) {
    			list.add(reader);
    		}
    	}else {
    		list = readerService.queryByUsername(searchWord);
    	}
        if (list!=null&&list.size()>0) {
	        ModelAndView modelAndView = new ModelAndView("admin/readers");
	        modelAndView.addObject("list", list);
	        return modelAndView;
	    } else {
	        return new ModelAndView("admin/readers", "error", "没有匹配的读者");
	    }
    }
    
    
    /**
     * admin得到添加reader页面
     * @return
     */
    @RequestMapping("/admin/reader_add.html")
    public ModelAndView readerAdd() {
        return new ModelAndView("admin/reader_add");
    }
   /**
    * admin添加reader
    * @param reader
    * @param redirectAttributes
    * @return
    */
    @RequestMapping("/admin/reader_add_do.html")
    public String readerAddDo(Reader reader, RedirectAttributes redirectAttributes) {
        long readerId = readerService.add(reader);
        reader.setReaderId(readerId);
        if (readerId > 0) {
            redirectAttributes.addFlashAttribute("succ", "添加读者信息成功！");
        } else {
            redirectAttributes.addFlashAttribute("succ", "添加读者信息失败！");
        }
        return "redirect:/admin/readers.html";
    }

    /**
     * admin得到编辑reader页面
     * @param readerId
     * @return
     */
    @RequestMapping("/admin/reader_edit.html")
    public ModelAndView readerEdit(long readerId) {
        Reader reader = readerService.findByReaderId(readerId);
        ModelAndView modelAndView = new ModelAndView("admin/reader_edit");
        modelAndView.addObject("reader", reader);
        return modelAndView;
    }
    /**
     * admin编辑reader
     * @param reader
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/admin/reader_edit_do.html")
    public String readerEditDo(Reader reader, RedirectAttributes redirectAttributes) {
        if (readerService.edit(reader)) {
            redirectAttributes.addFlashAttribute("succ", "读者信息修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "读者信息修改失败！");
        }
        return "redirect:/admin/readers.html";
    }
    
    
    /**
     * admin删除reader
     * @param readerId
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/admin/deletereader.html")
    public String readerDelete(long readerId, RedirectAttributes redirectAttributes) {
//        long readerId = Long.parseLong(request.getParameter("readerId"));
        if (readerService.deleteByReaderId(readerId)) {
            redirectAttributes.addFlashAttribute("succ", "删除成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "删除失败！");
        }
        return "redirect:/admin/readers.html";
    }

    
    /**
         * 转到reader个人信息页面
     */
    @RequestMapping("/reader/info.html")
    public ModelAndView toReader(HttpServletRequest request) {
        Reader sessionReader = (Reader) request.getSession().getAttribute("sessionReader");
        ModelAndView modelAndView = new ModelAndView("reader/info");
        modelAndView.addObject("reader", sessionReader);
        return modelAndView;
    }

    /**
     * reader得到个人信息修改页面
     * @param request
     * @return
     */
    @RequestMapping("/reader/info_edit.html")
    public ModelAndView readerEditReader(HttpServletRequest request) {
        Reader sessionReader = (Reader) request.getSession().getAttribute("sessionReader");
        ModelAndView modelAndView = new ModelAndView("reader/info_edit");
        modelAndView.addObject("reader", sessionReader);
        return modelAndView;
    }
    /**
     * reader修改个人信息
     * @param reader
     * @param request
     * @param redirectAttributes
     * @return
     */
    @PostMapping("/reader/info_edit_do.html")
    public String readerEditDoReader(Reader reader,HttpServletRequest request,RedirectAttributes redirectAttributes) {
    	if (readerService.edit(reader)) {
    	   request.getSession().setAttribute("sessionReader",reader);
           redirectAttributes.addFlashAttribute("succ", "信息修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "信息修改失败！");
        }       
        return "redirect:/reader/info.html";
    }
}
