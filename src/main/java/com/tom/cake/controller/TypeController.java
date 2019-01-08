package com.tom.cake.controller;

import com.tom.cake.model.Type;
import com.tom.cake.service.TypeService;
import com.tom.cake.vo.TypeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("/type")
@Controller
public class TypeController extends BaseController {

    @Autowired
    private TypeService typeService;

    @RequestMapping("/typeSearch")
    public ModelAndView typeSearch(Type type) {
        ModelAndView mv = new ModelAndView("commodity");
        List<TypeVo> byStar = typeService.findByTypeId(type);
        mv.addObject("byStar", byStar);
        return mv;

    }


}
