package com.example.chat.controller;

import com.example.chat.entity.Message;
import com.example.chat.entity.User;
import com.example.chat.repository.MessageRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Objects;
import java.util.UUID;

@Controller
public class messageController {

    @Autowired
    private MessageRepository messageRepository;

    @Value("${upload.path}")
    private String uploadPath;




    @GetMapping("/messages")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model){
        Iterable<Message> messages = messageRepository.findAll();

        if (filter!=null && !filter.isEmpty()){
            messages = messageRepository.findByTag(filter);
            System.out.println("FILTER: " + filter);
        }

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);

        return "messages";
    }

    @PostMapping("/messages")
    public String addMessage(
            @AuthenticationPrincipal User user,
            @RequestParam("file") MultipartFile file,
            Message message) throws IOException {

        message.setAuthor(user);
        message.setAuthorid(user.getId());


        if (file != null && !Objects.requireNonNull(file.getOriginalFilename()).isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }


            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            message.setFilename(resultFilename);

        }

        messageRepository.save(message);

        return "redirect:/messages";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam Long id){


        System.out.println("DELETEMAPPING                                                                 ");
        if(id!=null){

            if(
                    messageRepository.findById(id).isPresent()
            ){
                System.out.println("ID FOR DELETEMAPPING:  " + id);
                messageRepository.deleteById(id);
            }

        }
        return "redirect:/messages";
    }



}
