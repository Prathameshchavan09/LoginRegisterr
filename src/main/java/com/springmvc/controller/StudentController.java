package com.springmvc.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springmvc.model.Login;
import com.springmvc.model.User;
import com.springmvc.service.UserService;

@Controller
public class StudentController {

    @Autowired
    private UserService userService;
    
    @Autowired
   	@PersistenceContext

   	private EntityManager em;


    @RequestMapping("/")
    public String home() {
        return "register";
    }

    @RequestMapping("/login")
    public String loginUser() {
        return "login";
    }

    @PostMapping("/registerProcess")
    public String registration(@ModelAttribute User user, Model model) {
        String name = user.getName();
        String city = user.getCity();
        Long contact = user.getContact();
        String password = user.getPassword();

        if (name != null && !name.isEmpty() &&
            city != null && !city.isEmpty() &&
            contact != null && password != null && !password.isEmpty()) {
        	 userService.registerUser(user);
             
            model.addAttribute("Register", "Registered Successfully");
            return "register";
        }

        return "register";
    }

    
    @PostMapping("/LoginProcess")
    public String loginUser(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        TypedQuery<Login> query = em.createQuery("SELECT l FROM Login l WHERE l.name = :name AND l.password = :password", Login.class);
        query.setParameter("name", name);
        query.setParameter("password", password);

        List<Login> resultList = query.getResultList();

        if (!resultList.isEmpty()) {
            HttpSession session = request.getSession();
            session.setAttribute("name", name);
            session.setAttribute("password", password);
            model.addAttribute("successMessage", "Login Successfully");
            return "login";
            
        } else {
        	 model.addAttribute("loginError","userName and password is not correct");
        	 return "login";
        
        }
        
    }

}

