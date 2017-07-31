/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author Hung
 */
public class Security extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Cookie[] cookies = null;
        cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cooky : cookies) {
                if(cooky.getName().equals("USERNAME"))
                    return true;
            }
        }
        response.sendRedirect(request.getContextPath()+"/member/login.hung");
        return false;
    }

}
