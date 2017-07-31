/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Model;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Hung
 */

@Transactional
@Controller
@RequestMapping("/member/")
public class MemberController {
    @Autowired
    SessionFactory factory;

    @RequestMapping("login")
    public String index() {
        return "member/login";
    }

    @RequestMapping("new")
    public String newmember(ModelMap model) {
        model.addAttribute("user",new User());
        return "member/new";
    }

    @RequestMapping(value = "login-member", method = RequestMethod.POST)
    public String login(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        String Username = request.getParameter("txtUsername");
        String Password = request.getParameter("txtPassword");
        String remember= request.getParameter("txtRemember");
        Session session = factory.getCurrentSession();
        try {
            User user=(User) session.get(User.class, Username);
            if(!user.getPassword().equals(Password)){
                model.addAttribute("result", "Sai mật khẩu hoặc tài khoản");
            }else{
                model.addAttribute("result", "Đăng nhập thành công");
                if(remember.equals("true")){
                    Model cookie=new Model();
                    response.addCookie(cookie.setCookie(Username));
                }
            }
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("result", "Đăng nhập thất bại");
        }
        
        return "member/login";
    }

    @RequestMapping(value = "new-member", method = RequestMethod.POST)
    public String registration(ModelMap model,@ModelAttribute("user") User user) {
        Session session=factory.openSession();
        Transaction t=session.beginTransaction();
        try{
            session.save(user);
            t.commit();
            model.addAttribute("result", "Đăng kí thành công");
            return "member/login";
        }catch(Exception e){
            t.rollback();
            model.addAttribute("result", "Đăng kí thất bại");
        }finally{
            session.close();
        }
        return "member/new";
    }
    @RequestMapping("listmember")
    public String staffdetail(ModelMap model){
        model.addAttribute("members", getMember());
        return "member/listmember";
    }
    public List<User> getMember(){
        Session session=factory.getCurrentSession();
        String hql="FROM User";
        Query query=session.createQuery(hql);
        List<User> list=query.list();
        return list;
    }
//    public Boolean sendmail(String from, String to, String subject, String body) {
//        try{
//            // Tạo mail
//            MimeMessage mail =mailer.createMimeMessage();
//            // Sử dụng lớp trợ giúp
//            MimeMessageHelper helper = new MimeMessageHelper(mail);
//            helper.setFrom(from, from);
//            helper.setTo(to);
//            helper.setReplyTo(from, from);
//            helper.setSubject(subject);
//            helper.setText(body, true);
//
//            // Gửi mail
//            mailer.send(mail);
//            return true;
//        }
//        catch(Exception e){
//            e.printStackTrace();
//        }
//        return true;
//	}
}
