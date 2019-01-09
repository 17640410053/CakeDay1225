package com.tom.cake.service;

import com.tom.cake.model.TP_Tree;

import java.util.List;

public interface TP_TreeService {

    List<TP_Tree> findProvince();

    List<TP_Tree> findCityOrCountry(TP_Tree tp_tree);


}
