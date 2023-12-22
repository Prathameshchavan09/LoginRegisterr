package com.springmvc.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.dao.UserDao;

import com.springmvc.model.User;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    
   
    public void registerUser(User user) {
        userDao.save(user);
    }

   
}