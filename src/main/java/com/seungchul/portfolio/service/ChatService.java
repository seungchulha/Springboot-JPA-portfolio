package com.seungchul.portfolio.service;

import com.seungchul.portfolio.dao.ChatDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatService {

    @Autowired
    ChatDao chatDao;

    public void addMessage(int roomId, String writer, String body){
        chatDao.addMessage(roomId, writer, body);
    }

    public List getMessages(){
        return chatDao.getMessages();
    }

    public List getMessagesFrom(int roomId, int from){
        return chatDao.getMessagesFrom(roomId, from);
    }

    public void clearAllMessages(){
        chatDao.clearAllMessages();
    }
}
