package com.example.chat.controller;

import com.example.chat.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Collections;
import java.util.Set;

@Controller
public class homeController {

    @GetMapping("/")
    public String home(){

        return "home";
    }
}
