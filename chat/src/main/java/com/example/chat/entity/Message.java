package com.example.chat.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Objects;


@Data
@Entity
@Table
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String text;

    private String tag;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    private String filename;

    private Long authorid;

    public String getAuthorName(){
        return author != null ? author.getUsername() : "<none>";
    }

    public String getText() {
        return Objects.requireNonNullElse(text, "");
    }
    public String getTag() {
        return Objects.requireNonNullElse(tag, "<nine>");
    }

    public Message(){}

    public Message(String text, String tag, User user) {
        this.text = text;
        this.tag = tag;
        this.author = user;
    }

}
