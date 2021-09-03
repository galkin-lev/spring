package com.example.chat.controller;

import com.example.chat.entity.Role;
import com.example.chat.entity.User;
import com.example.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.embedded.undertow.UndertowServletWebServer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;



@Controller
public class registyController {



    @Autowired
    private UserRepository userRepository;

    @GetMapping("/registration")
    public String registration(Model model){

        model.addAttribute("message", "");

        return "registration";
    }


    @PostMapping("/registration")
    public String addUser(User user, Model model){

        System.out.println(user.toString());

        model.addAttribute("message", "");

        if (user.getUsername()==null || user.getPassword()==null){
            return "redirect:/registration";
        }


        if (userRepository.findByUsername(user.getUsername())!=null){

            model.addAttribute("message", "user exist!");
            return "registration";
        }


        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));


        userRepository.save(user);
        return "redirect:/login";
    }
}
