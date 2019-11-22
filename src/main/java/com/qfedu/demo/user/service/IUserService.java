package com.qfedu.demo.user.service;

import com.qfedu.demo.user.base.service.bo.Page;
import com.qfedu.demo.user.service.bo.User;

import java.util.List;
import java.util.Map;

public interface IUserService {

    public void insert(User user);

    public User login(User user);

    public int pageCount(Map<String,Object> condition);

    public Page page(Map<String, String> condition);

    public List<User> list(Map<String,Object> condition);

    User findById(int id);

    public void delete(int id);

    public void update(User user);

}
