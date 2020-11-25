package com.seungchul.portfolio.controller;

import com.seungchul.portfolio.dto.ChatMessage;
import com.seungchul.portfolio.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ChatController {

    @Autowired
    ChatService chatService;

    @RequestMapping("/chat/room")
    public String showRoom(int roomId, Model model){
        model.addAttribute("roomId", roomId);
        return "chat/room";
    }

    @RequestMapping("/chat/doClearAllMessages")
    @ResponseBody
    public Map doClearAllMessages(int roomId, String writer, String body){
        chatService.clearAllMessages();

        Map rs = new HashMap<>();

        chatService.addMessage(roomId, writer, body);

        rs.put("resultCode", "S-1");
        rs.put("msg", "모든 메시지가 삭제되었습니다.");

        return rs;
    }

    @RequestMapping("/chat/doAddMessage")
    @ResponseBody
    public Map doAddMessage(int roomId, String writer, String body){
        Map rs = new HashMap<>();

        chatService.addMessage(roomId, writer, body);

        rs.put("resultCode", "S-1");
        rs.put("msg", "채팅 메시지가 추가되었습니다.");

        return rs;
    }

    @RequestMapping("/chat/getMessages")
    @ResponseBody
    public List getMessages(){
        return chatService.getMessages();
    }

    @RequestMapping("/chat/getMessagesFrom")
    @ResponseBody
    public Map getMessages(int roomId, int from){
        List<ChatMessage> messages =  chatService.getMessagesFrom(roomId, from);

        Map rs = new HashMap<>();

        rs.put("resultCode", "S-1");
        rs.put("msg", "새 메세지들을 가져왔습니다.");
        rs.put("messages", messages);
        return rs;
    }

}
