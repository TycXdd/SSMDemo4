package com.qfedu.demo.user.service.impl;

import com.qfedu.demo.user.base.service.bo.Page;
import com.qfedu.demo.user.dao.IUserDao;
import com.qfedu.demo.user.service.IUserService;
import com.qfedu.demo.user.service.bo.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class UserServiceImpl implements IUserService {
    private static final Logger logger = LogManager.getLogger(UserServiceImpl.class);

    @Autowired
    public IUserDao userDao;

    @Override
    @Transactional
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public User login(User user) {
        return userDao.getUserByUserName(user.getUserName());
    }

    @Override
    public int pageCount(Map<String, Object> condition) {
        return 0;
    }

    @Override
    public Page page(Map<String, String> condition) {
        int pageNum = 1;
        int pageSize = 3;
        if (condition.containsKey("pageNum")) {
            pageNum = Integer.parseInt(condition.get("pageNum"));
            pageSize = Integer.parseInt(condition.get("pageSize"));
        }

        Page page = new Page(pageNum, pageSize);

        Map<String, Object> conditionTemp = new HashMap<>();

        conditionTemp.putAll(condition);
        conditionTemp.put("startIndex", page.getStartIndex());
        conditionTemp.put("pageSize", pageSize);

        Set<Map.Entry<String, Object>> kvs = conditionTemp.entrySet();
        for (Map.Entry<String, Object> kv : kvs) {
            logger.info(kv.getKey() + ";" + kv.getValue());
        }

        page.setResult(userDao.page(conditionTemp));

        page.setTotal(userDao.pageCount(conditionTemp));

        return page;
    }

    @Override
    public List<User> list(Map<String, Object> condition) {
        return userDao.list(condition);
    }

    @Override
    public User findById(int id) {
        return userDao.findById(id);
    }

    @Override
    @Transactional
    public void delete(int id) {
        userDao.delete(id);
    }

    @Override
    @Transactional
    public void update(User user) {
        userDao.update(user);
    }


}
