package com.example.chat.repository;

import com.example.chat.entity.Message;
import com.example.chat.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Repository
public interface MessageRepository extends JpaRepository<Message,Long> {
    public List<Message> findByTag(String tag);

    @Transactional
    @Modifying
    @Query("delete from Message m where m.authorid=:authorid")
    void messages(@Param("authorid") Long authorid);
}
