package com.vodafone.service;

import com.vodafone.model.User;

import java.util.List;

public interface UserService {
    User save(User user);
    List<User> findAll();
}
