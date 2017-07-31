/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Depart;
import entity.Record;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Hung
 */
@Transactional
@Controller
@RequestMapping("/depart/")
public class DepartController {
    @Autowired
    SessionFactory factory;
    
    @RequestMapping("newdepart")
    public String newdepart(){
        return "depart/newdepart";
    }
    @RequestMapping("new-depart")
    public String createdepart(ModelMap model, HttpServletRequest request){
        String name=request.getParameter("Name");
            Depart d=new Depart();
            d.setName(name);
            Session session= factory.openSession();
            Transaction t= session.beginTransaction();
            try{
                session.save(d);
                t.commit();
                model.addAttribute("result", "Tạo depart thành công");
                return "depart/newdepart";
            }catch(Exception e){
                t.rollback();
                model.addAttribute("result", "Tạo depart thất bại");
                e.printStackTrace();
            }finally{
                session.close();
            }
        
        return "depart/newdepart";
    }
    @RequestMapping("departdetail")
    public String staffdetail(ModelMap model){
        model.addAttribute("departs", getDepart());
        return "depart/departdetail";
    }
    public List<Depart> getDepart(){
        Session session=factory.getCurrentSession();
        String hql="FROM Depart";
        Query query=session.createQuery(hql);
        List<Depart> list=query.list();
        return list;
    }
    @RequestMapping("edit/{id}")
    public String editindex(ModelMap model, @PathVariable("id") Integer id) {
        Session session = factory.getCurrentSession();
        Depart depart = (Depart) session.get(Depart.class, id);
        model.addAttribute("depart", depart);
        return "depart/editdepart";
    }
    @RequestMapping(value="edit-depart",params="btnUpdate")
    public String editdepart(ModelMap model, @ModelAttribute("depart") Depart depart){
        Session session= factory.openSession();
        Transaction t= session.beginTransaction();
        try{
            session.update(depart);
            t.commit();
            model.addAttribute("result", "Sửa depart thành công");
            return "redirect:/depart/departdetail.hung";
        }catch(Exception e){
            t.rollback();
            model.addAttribute("result", "Sửa depart thất bại");
            e.printStackTrace();
        }finally{
            session.close();
        }
        return "redirect:/depart/departdetail.hung";
    }
    @RequestMapping(value="edit-depart",params="btnDelete")
    public String deletedepart(ModelMap model, @ModelAttribute("depart") Depart depart){
        Session session= factory.openSession();
        Transaction t= session.beginTransaction();
        try{
            session.delete(depart);
            t.commit();
            model.addAttribute("result", "Xóa depart thành công");
            return "redirect:/depart/departdetail.hung";
        }catch(Exception e){
            t.rollback();
            model.addAttribute("result", "Xóa depart thất bại");
            e.printStackTrace();
        }finally{
            session.close();
        }
        return "redirect:/depart/departdetail.hung";
    }
}
