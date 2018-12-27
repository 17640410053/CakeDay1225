package com.tom.cake.controller;

import com.tom.cake.model.Goods;
import com.tom.cake.service.GoodsService;
import com.tom.cake.service.TypeService;
import com.tom.cake.vo.TypeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CommodityController {


    @Autowired
    private TypeService typeService;

    @Autowired
    private GoodsService goodsService;


    @RequestMapping("/commodity")
    public ModelAndView commodity() {
        ModelAndView mv = new ModelAndView("commodity");

        List<TypeVo> typeVoList = typeService.findForChild();

        mv.addObject("typeVoList", typeVoList);

        Goods goods = new Goods();
        goods.setStar(8);
        List<Goods> byStar = goodsService.findByStar(goods);

        mv.addObject("byStar", byStar);
        return mv;

    }

}
