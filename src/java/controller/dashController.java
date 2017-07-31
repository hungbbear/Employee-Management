/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Hung
 */
@Controller
@Transactional
@RequestMapping("/")
public class dashController {
    @Autowired
    SessionFactory factory;
    @RequestMapping("home/dashboard")
    public String index(ModelMap model){
        Session session=factory.getCurrentSession();
        Integer cstaff = ((Long)session.createQuery("select count(*) from Staff").uniqueResult()).intValue();
        Integer crecord = ((Long)session.createQuery("select count(*) from Record").uniqueResult()).intValue();
        Integer cmember = ((Long)session.createQuery("select count(*) from User").uniqueResult()).intValue();
        Integer cdepart = ((Long)session.createQuery("select count(*) from Depart").uniqueResult()).intValue();
        model.addAttribute("cdepart", cdepart);
        model.addAttribute("cstaff", cstaff);
        model.addAttribute("crecord", crecord);
        model.addAttribute("cmember", cmember);
        return "home/dashboard";
    }
    @RequestMapping("index")
    public String redirectIndex(){
        return "redirect:/home/dashboard.hung";
    }
}
