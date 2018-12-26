package com.tom.cake.service.impl;

import com.tom.cake.model.Type;
import com.tom.cake.service.TypeService;
import com.tom.cake.vo.TypeVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

import com.tom.cake.mapper.TypeDao;

@Service
public class TypeServiceImpl implements TypeService {

    @Resource
    private TypeDao typeDao;

    public int insert(Type pojo) {
        return typeDao.insert(pojo);
    }

    public int insertSelective(Type pojo) {
        return typeDao.insertSelective(pojo);
    }

    public int insertList(List<Type> pojos) {
        return typeDao.insertList(pojos);
    }

    public int update(Type pojo) {
        return typeDao.update(pojo);
    }

    @Override
    public List<Type> findAll() {
        return typeDao.selectTypes();
    }

    @Override
    public List<Type> findByParentId(Type type) {
        return typeDao.selectByParentId(type);
    }

    @Override
    public List<TypeVo> findForChild() {
        return typeDao.selectTypesForChild();
    }

    @Override
    public List<TypeVo> findForGoods() {
        return typeDao.selectTypesForGoods();
    }
}
