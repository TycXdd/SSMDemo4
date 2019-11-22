package com.qfedu.demo.user.dao;

import com.qfedu.demo.user.service.bo.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface IUserDao {

    public void insert(User user);

    User findById(int id);

    public void delete(int id);

    public void update(User user);

    public User getUserByUserName(String userName);

    public List<User> list(Map<String,Object> condition);

    public List<User> page(Map<String, Object> condition);

    public int pageCount(Map<String, Object> condition);
}
