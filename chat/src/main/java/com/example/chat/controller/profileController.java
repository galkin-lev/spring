package com.example.chat.controller;

import com.example.chat.entity.Role;
import com.example.chat.entity.User;

import com.example.chat.repository.MessageRepository;
import com.example.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;


@Controller
@RequestMapping("profile")
public class profileController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MessageRepository messageRepository;

    @GetMapping
    public String profile(@AuthenticationPrincipal User user, Model model){

        model.addAttribute("user", user);
        System.out.println(user.toString());

        return "profile";
    }

    @GetMapping("/edit")
    public String userEditForm(@AuthenticationPrincipal User user, Model model){

        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values() );

        return "profileuseredit";
    }


    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        user.setUsername(username);
        user.setPassword(password);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        if (user.isAdmin()) {
            user.getRoles().clear();

            for (String key : form.keySet()) {
                if (roles.contains(key)) {
                    user.getRoles().add(Role.valueOf(key));
                }
            }
        }

        System.out.println("Id:   "+user.getId());
        System.out.println("User name:  "+user.getUsername());
        System.out.println("Password:   "+user.getPassword());
        System.out.println("Roles: " + user.getRoles());

        userRepository.save(user);

        return "redirect:/profile";
    }
    @PostMapping("/delete/{userid}")
    public String deleteUser(@PathVariable Long userid, @RequestParam String username, @RequestParam String password) {


        System.out.println("DELETEMAPPING                                                                 ");
        if (userid != null) {

            Long useridconf = userRepository.findByUsername(username).getId();

            //only account owner can delete it
            if (userid == useridconf && password.equals(userRepository.findByUsername(username).getPassword())){
                if (userRepository.findById(userid).isPresent()) {

                    messageRepository.messages(userid);
                    System.out.println("ID FOR DELETEMAPPING:  " + userid);
                    userRepository.deleteById(userid);
                    SecurityContextHolder.clearContext();

                }
            }
        }

        return "redirect:/";

    }
}
