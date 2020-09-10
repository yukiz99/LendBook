package com.library.controller;

import com.library.bean.Admin;
import com.library.bean.Reader;
import com.library.service.AdminService;
import com.library.service.ReaderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.HashMap;

@Controller
public class LoginController {

    @Autowired
	private ReaderService readerService;
    @Autowired
    private AdminService adminService;
  

    /**
        * 登录
     * @param session
     * @return
     */
    @RequestMapping(value = {"/", "/index.html","/login.html"})
    public String toLogin(HttpSession session) {
        session.invalidate();
        return "index";
    }
    
    /**
         * 注销
     * @param session
     * @return
     */
    @RequestMapping("/logout.html")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login.html";
    }
    

  /**
   * api请求，负责处理loginCheck.html请求
   * @param id
   * @param passwd
   * @param session
   * @return
   */
    @RequestMapping("/api/loginCheck")
    public @ResponseBody
    Object loginCheck(long id,String passwd,String type ,HttpSession session) {
      
       HashMap<String, String> res = new HashMap<>();
       if(type.equals("reader")) {
            Reader reader = readerService.findByReaderId(id);
	       	if (reader!=null&&reader.getPassword().equals(passwd)) {
	       		session.setAttribute("sessionReader", reader);//设置session
	            res.put("stateCode", "2");
	            res.put("msg", "读者登陆成功！");
	       	}else {
	       	   res.put("stateCode", "0");
	           res.put("msg", "账号或密码错误！");
	       	}
	       	
       }else {
             Admin  admin = adminService.findByAdminId(id);
            if (admin!=null&&admin.getPassword().equals(passwd)) {
               session.setAttribute("sessionAdmin", admin);//设置session
               res.put("stateCode", "1");
               res.put("msg", "管理员登陆成功！");
            }else {
                 res.put("stateCode", "0");
                 res.put("msg", "账号或密码错误！");
            }
       }
            return res;
    }
 
    
    /**
         *  转到main.html
     * @return
     */
    @RequestMapping("/admin/main.html")
    public ModelAndView toAdminMain() {
        return new ModelAndView("admin/main");
    }

    @RequestMapping("/reader/main.html")
    public ModelAndView toReaderMain() {
        return new ModelAndView("reader/main");
    }
    
    /**
         * 转到header.html
     * @return
     */
    @RequestMapping("/admin/header.html")
    public ModelAndView admin_header() {
        return new ModelAndView("admin/header");
    }
 
    @RequestMapping("/reader/header.html")
    public ModelAndView reader_header() {
        return new ModelAndView("reader/header");
    }
    
    
    
    
    /**
     * admin修改密码页面
     * @return
     */
    @RequestMapping("/admin/repasswd.html")
    public ModelAndView reAdminPasswd() {
        return new ModelAndView("admin/repasswd");
    }

    @RequestMapping("/admin/repasswd_do.html")
    public String reAdminPasswdDo(String oldPasswd, String newPasswd,HttpSession session,RedirectAttributes redirectAttributes) {
        Admin admin = (Admin)session.getAttribute("sessionAdmin");  
        if (admin.getPassword().equals(oldPasswd)) {  
            if (adminService.resetPassword(admin.getAdminId(), newPasswd)) {
            	Admin newAdmin=adminService.findByAdminId(admin.getAdminId());
            	session.setAttribute("sessionAdmin",newAdmin);
                   redirectAttributes.addFlashAttribute("succ", "密码修改成功！");
            } else {
                redirectAttributes.addFlashAttribute("error", "密码修改失败！");
            }
        } else {
            redirectAttributes.addFlashAttribute("error", "旧密码错误！");
        }
        return "redirect:/admin/repasswd.html";   
    }
    
    
    
    /**
     * reader修改密码页面
     * @return
     */
    @RequestMapping("/reader/repasswd.html")
    public ModelAndView reReaderPasswd() {
        return new ModelAndView("reader/repasswd");
    }

    @RequestMapping("/reader/repasswd_do.html")
    public String reReaderPasswdDo(HttpSession session, String oldPasswd, String newPasswd, RedirectAttributes redirectAttributes) {
        Reader reader = (Reader)session.getAttribute("sessionReader");
        if (reader.getPassword().equals(oldPasswd)) {
            if (readerService.resetPassword(reader.getReaderId(), newPasswd)) {
            	Reader  newReader=readerService.findByReaderId(reader.getReaderId());
            	session.setAttribute("sessionReader",newReader);
            	redirectAttributes.addFlashAttribute("succ", "密码修改成功！");
            } else {
                redirectAttributes.addFlashAttribute("error", "密码修改失败！");
            }
        } else {
            redirectAttributes.addFlashAttribute("error", "旧密码错误！");
        }
        
        return "redirect:/reader/repasswd.html";
        
    }


}