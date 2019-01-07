package com.tom.cake.service.impl;

import com.tom.cake.model.Users;
import com.tom.cake.service.UsersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

import com.tom.cake.mapper.UsersDao;

@Service
public class UsersServiceImpl implements UsersService {

    @Resource
    private UsersDao usersDao;

    public int insert(Users pojo) {
        return usersDao.insert(pojo);
    }

    public int insertSelective(Users pojo) {
        return usersDao.insertSelective(pojo);
    }

    public int insertList(List<Users> pojos) {
        return usersDao.insertList(pojos);
    }

    public int update(Users pojo) {
        return usersDao.update(pojo);
    }

    @Override
    public Users findOne(Users users) {
        return usersDao.selectOne(users);
    }

    @Override
    public Users findByMail(Users users) {
        return usersDao.selectByMail(users);
    }

    @Override
    public Users findByMailAndPassword(Users users) {
        return usersDao.selectByMailAndPassword(users);
    }

    @Override
    public void modifyUsersInfo(Users users) {
        usersDao.updateUsersInfo(users);
    }
}
