package com.tom.cake.service.impl;

import com.tom.cake.model.Attr;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

import com.tom.cake.mapper.AttrDao;

@Service
public class attrService{

    @Resource
    private AttrDao attrDao;

    public int insert(Attr pojo){
        return attrDao.insert(pojo);
    }

    public int insertSelective(Attr pojo){
        return attrDao.insertSelective(pojo);
    }

    public int insertList(List<Attr> pojos){
        return attrDao.insertList(pojos);
    }

    public int update(Attr pojo){
        return attrDao.update(pojo);
    }
}
