package com.example.chat.controller;

import com.example.chat.entity.Role;
import com.example.chat.entity.User;
import com.example.chat.repository.MessageRepository;
import com.example.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class userController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MessageRepository messageRepository;

    @GetMapping
    public String userList(Model model){

        model.addAttribute("users", userRepository.findAll());


        return "userlist";
    }


    @GetMapping("/{user}")
    public String userEditForm(@PathVariable User user, Model model){

        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values() );

        return "useredit";
    }


    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {

        //replace space to nothing
        username = username.replaceAll("\\s+","");
        password = password.replaceAll("\\s+","");

        if (username.equals("") || password.equals("")){
            System.out.println("username or password == null");
            return "redirect:/user/" + user.getId();
        }


        if(!username.equals(user.getUsername())) {
            if (userRepository.findByUsername(username) != null) {
                System.out.println("username already exists");
                return "redirect:/user/" + user.getId();
            }
        }
        user.setUsername(username);
        user.setPassword(password);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        System.out.println("Id:   "+user.getId());
        System.out.println("User name:  "+user.getUsername());
        System.out.println("Password:   "+user.getPassword());
        System.out.println("Roles: " + user.getRoles());

        userRepository.save(user);

        return "redirect:/user";
    }
    @PostMapping("/delete/{user}")
    public String deleteUser(@PathVariable Long user) {


        System.out.println("DELETEMAPPING                                                                 ");
        if (user != null) {

            if (userRepository.findById(user).isPresent()) {

                messageRepository.messages(user);
                System.out.println("ID FOR DELETEMAPPING:  " + user);
                userRepository.deleteById(user); }
        }

        return "redirect:/user";

    }
}

