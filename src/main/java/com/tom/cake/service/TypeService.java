package com.tom.cake.service;

import com.tom.cake.model.Type;
import com.tom.cake.vo.TypeVo;

import java.util.List;
import java.util.Map;

public interface TypeService {
    List<Type> findAll();

    List<Type> findByParentId(Type type);

    List<TypeVo> findForChild();

    List<TypeVo> findForGoods();

    List<TypeVo> findByTypeId(Type type);


    List<Type> findAllPage(Map map);
    Long findCount();
}
