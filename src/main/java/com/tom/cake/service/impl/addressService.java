package com.tom.cake.service.impl;

import com.tom.cake.model.Address;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

import com.tom.cake.mapper.addressDao;

@Service
public class addressService{

    @Resource
    private addressDao addressDao;

    public int insert(Address pojo){
        return addressDao.insert(pojo);
    }

    public int insertSelective(Address pojo){
        return addressDao.insertSelective(pojo);
    }

    public int insertList(List<Address> pojos){
        return addressDao.insertList(pojos);
    }

    public int update(Address pojo){
        return addressDao.update(pojo);
    }
}
