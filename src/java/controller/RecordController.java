/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Mailer;
import entity.Record;
import entity.Staff;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Hung
 */
@Transactional
@Controller
@RequestMapping("/record/")
public class RecordController {
    @Autowired
    SessionFactory factory;
    @Autowired
    private JavaMailSender mailSender;
    
    @RequestMapping("newrecord")
    public String newrecord(ModelMap model){
        model.addAttribute("record", new Record());
        return "record/newrecord";
    }
    @RequestMapping("new-record")
    public String create(@ModelAttribute("record") Record record,ModelMap model){
        Session session=factory.openSession();
        Transaction t=session.beginTransaction();
        try{
            session.save(record);
            t.commit();
            Mailer sendMail=new Mailer(getEmail(record.getStaffId()),
                    "New Record Is Added To Your Account",
                    "You give new record. Please login to check. Regards!",mailSender);
            
            model.addAttribute("result", "Thêm record thành công");
            return "record/recorddetail";
        }catch(Exception e){
            t.rollback();
            model.addAttribute("result", "Thêm record thất bại");
        }finally{
            session.close();
        }
        
        return "record/newrecord";
    }
    public String getEmail(int id){
        Session session=factory.getCurrentSession();
        Staff staff = (Staff) session.get(Staff.class, id);
        return staff.getEmail();
    }
    @RequestMapping("recorddetail")
    public String staffdetail(ModelMap model){
        model.addAttribute("records", getRecord());
        return "record/recorddetail";
    }
    public List<Record> getRecord(){
        Session session=factory.getCurrentSession();
        String hql="FROM Record";
        Query query=session.createQuery(hql);
        List<Record> list=query.list();
        return list;
    }
    
    @RequestMapping("edit/{id}")
    public String editindex(ModelMap model, @PathVariable("id") Integer id) {
        Session session = factory.getCurrentSession();
        Record record = (Record) session.get(Record.class, id);
        model.addAttribute("record", record);
        return "record/editrecord";
    }
    @RequestMapping(value="edit-record",params="btnUpdate")
    public String edit(@ModelAttribute("record") Record record,ModelMap model){
        Session session=factory.openSession();
        Transaction t=session.beginTransaction();
        try{
            session.update(record);
            t.commit();
            model.addAttribute("result", "Sửa record thành công");
            return "redirect:/record/recorddetail.hung";
        }catch(Exception e){
            t.rollback();
            model.addAttribute("result", "Sửa record thất bại");
        }finally{
            session.close();
        }
        
        return "redirect:/record/recorddetail.hung";
    }
    @RequestMapping(value="edit-record",params="btnDelete")
    public String delete(@ModelAttribute("record") Record record,ModelMap model){
        Session session=factory.openSession();
        Transaction t=session.beginTransaction();
        try{
            session.delete(record);
            t.commit();
            model.addAttribute("result", "Xóa record thành công");
            return "redirect:/record/recorddetail.hung";
        }catch(Exception e){
            t.rollback();
            model.addAttribute("result", "Xóa record thất bại");
        }finally{
            session.close();
        }
        
        return "redirect:/record/recorddetail.hung";
    }
}
