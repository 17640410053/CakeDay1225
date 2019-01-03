package com.tom.cake.controller;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.constant.ResultEnum;
import com.tom.cake.model.Goods;
import com.tom.cake.service.GoodsService;
import com.tom.cake.service.TypeService;
import com.tom.cake.vo.TypeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CommodityController {


    @Autowired
    private TypeService typeService;

    @Autowired
    private GoodsService goodsService;
    private List<Goods> searchGoods = null;

      @ResponseBody
      @RequestMapping("/searchGoods")
      public ResultEntity<String> searchGoods(@RequestParam String title) {
          ResultEntity<String> result = new ResultEntity<>();
          Goods goods = new Goods();
          goods.setDetail(title);
          goods.setName(title);
          searchGoods = goodsService.findSearchGoods(goods);
          result.setCodeAndMsg(ResultEnum.SELECT_SUCCESS);
          return result;
      }


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

    @RequestMapping("/commoditySearch")
    public ModelAndView commoditySearch() {
        ModelAndView mv = new ModelAndView("commoditysearch");
        List<TypeVo> typeVoList = typeService.findForChild();
        mv.addObject("typeVoList", typeVoList);
        mv.addObject("searchGoods", searchGoods);
        return mv;
    }


}
