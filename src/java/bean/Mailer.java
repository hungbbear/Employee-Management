/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
 
public class Mailer 
{
    public Mailer(String to, String subject, String body,JavaMailSender mailSender) 
    {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("postmaster@confirm.gocanchoi.net");
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);
        mailSender.send(message);
    }
}