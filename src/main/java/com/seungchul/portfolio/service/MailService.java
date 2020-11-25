package com.seungchul.portfolio.service;

import java.util.Map;

public interface MailService {
    public Map<String, Object> send(String email, String customerEmail, String title, String body);
}
