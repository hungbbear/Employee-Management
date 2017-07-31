/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Depart;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Hung
 */
@Transactional
public class Model {
    @Autowired
    SessionFactory factory;
    
    public void Model(){
    }
    public Cookie setCookie(String username) {
        Cookie userCookie = new Cookie("USERNAME", username);
        userCookie.setPath("/");
        userCookie.setMaxAge(60 * 60 * 60);
        return userCookie;
    }
    public String setimage(MultipartFile image, HttpServletRequest request){
        if(image.isEmpty()){
            return "rong";
        }else{
            try{
                ServletContext context = request.getServletContext();
                String path=context.getRealPath("/resources/images/"+image.getOriginalFilename());
                image.transferTo(new File(path));
                return path;
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        return "0";
    }
    public List<Depart> departList(){
        String hql="FROM Depart";
        Session session=factory.getCurrentSession();
        Query query=session.createQuery(hql);
        List<Depart> list=query.list();
        return list;
    }
}
