package com.tom.cake.service;

import com.tom.cake.model.Type;
import com.tom.cake.vo.TypeVo;

import java.util.List;

public interface TypeService {
    List<Type> findAll();

    List<Type> findByParentId(Type type);

    List<TypeVo> findForChild();

    List<TypeVo> findForGoods();
}
