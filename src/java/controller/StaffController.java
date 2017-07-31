/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Depart;
import entity.Staff;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Hung
 */
@Transactional
@Controller
@RequestMapping("/staff/")
public class StaffController {
    @Autowired
    SessionFactory factory;
    
    @RequestMapping("newstaff")
    public String indexnewstaff(ModelMap model){
        Session session=factory.openSession();
        Session session2=factory.getCurrentSession();
        model.addAttribute("departlist", getdeparts(session2));
        return "staff/newstaff";
    }
    public List<Depart> getdeparts(Session session){
        String hql="FROM Depart";
        Query query=session.createQuery(hql);
        List<Depart> list=query.list();
        return list;
    }
    @RequestMapping(value = "new-staff", method = RequestMethod.POST)
    public String createstaff(ModelMap model, 
            HttpServletRequest request,
            @RequestParam("Gender") Boolean gender,
            @RequestParam("Photo") MultipartFile img) {
//        model.addAttribute("result", "hehehe");
        String name=request.getParameter("Name");
        String date=request.getParameter("Birthday");
        String photo=img.getOriginalFilename();
        String email=request.getParameter("Email");
        String phone=request.getParameter("Phone");
        int salary=Integer.parseInt(request.getParameter("Salary"));
        String note=request.getParameter("Note");
        int depart=Integer.parseInt(request.getParameter("Depart"));
        
        Model writefile=new Model();
        String kq=writefile.setimage(img, request);
        Staff staff=new Staff();
        staff.setName(name);
        staff.setGender(gender);
        staff.setBirthday(date);
        staff.setEmail(email);
        staff.setPhone(phone);
        staff.setSalary(salary);
        staff.setPhoto(photo);
        staff.setNote(note);
        staff.setDepartId(depart);
        Session session=factory.openSession();
        Transaction t=session.beginTransaction();
//        System.out.print(staff.getName());
        try{
            session.save(staff);
            t.commit();
            model.addAttribute("result", "Tạo nhân viên thành công");
            return "staff/newstaff";
        }catch(Exception e){
            t.rollback();
            model.addAttribute("result", "Tạo nhân viên thất bại");
            e.printStackTrace();
        }finally{
            session.close();
        }
        return "staff/newstaff";
    }
    @RequestMapping("staffdetail")
    public String staffdetail(ModelMap model){
        model.addAttribute("staffs", getStaff());
        return "staff/staffdetail";
    }
    public List<Staff> getStaff(){
        Session session=factory.getCurrentSession();
        String hql="FROM Staff";
        Query query=session.createQuery(hql);
        List<Staff> list=query.list();
        return list;
    }
    
    @RequestMapping("edit/{id}")
    public String editindex(ModelMap model, @PathVariable("id") Integer id) {
        Session session = factory.getCurrentSession();
        Staff staff = (Staff) session.get(Staff.class, id);
        model.addAttribute("departlist", getdeparts(session));
        model.addAttribute("staff", staff);
        return "staff/editstaff";
    }
    //EDIT STAFF
    @RequestMapping(value="edit-staff",params="btnUpdate")
    public String editstaff(ModelMap model, 
            HttpServletRequest request,
            @RequestParam("Gender") Boolean gender,
            @RequestParam("Photo") MultipartFile img) {
        int id=Integer.parseInt(request.getParameter("Idstaff"));
        String name=request.getParameter("Name");
        String date=request.getParameter("Birthday");
        String photo=request.getParameter("oldPhoto");
        if(!img.isEmpty()){
            photo=img.getOriginalFilename();
            Model writefile=new Model();
            String kq=writefile.setimage(img, request);
        }
        String email=request.getParameter("Email");
        String phone=request.getParameter("Phone");
        int salary=Integer.parseInt(request.getParameter("Salary"));
        String note=request.getParameter("Note");
        int depart=Integer.parseInt(request.getParameter("Depart"));
        Staff staff=new Staff();
        staff.setId(id);
        staff.setName(name);
        staff.setGender(gender);
        staff.setBirthday(date);
        staff.setEmail(email);
        staff.setPhone(phone);
        staff.setSalary(salary);
        staff.setPhoto(photo);
        staff.setNote(note);
        staff.setDepartId(depart);
        
        Session session=factory.openSession();
        Transaction t=session.beginTransaction();
//        System.out.print(staff.getName());
        try{
            session.update(staff);
            t.commit();
            model.addAttribute("result", "Tạo nhân viên thành công");
            return "redirect:/staff/staffdetail.hung";
        }catch(Exception e){
            t.rollback();
            model.addAttribute("result", "Tạo nhân viên thất bại");
            e.printStackTrace();
        }finally{
            session.close();
        }
        return "staff/"+id;
    }
    @RequestMapping(value="edit-staff",params="btnDelete")
    public String deletestaff(ModelMap model, HttpServletRequest request) {
        int id=Integer.parseInt(request.getParameter("Idstaff"));
        Staff staff=new Staff();
        staff.setId(id);
        
        Session session=factory.openSession();
        Session session2=factory.openSession();
        Transaction t=session.beginTransaction();
        try{
            String hql="delete Record where StaffId = "+id;
            Query q = session2.createQuery(hql);
            q.executeUpdate();
            session.delete(staff);
            t.commit();
            model.addAttribute("result", "Xóa nhân viên thành công");
            return "redirect:/staff/staffdetail.hung";
        }catch(Exception e){
            t.rollback();
            model.addAttribute("result", "Tạo nhân viên thất bại");
            e.printStackTrace();
        }finally{
            session.close();
            session2.close();
        }
        return "redirect:/staff/staffdetail.hung";
    }
}