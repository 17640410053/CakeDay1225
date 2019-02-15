package com.tom.cake.controller;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.constant.ResultEnum;
import com.tom.cake.model.Type;
import com.tom.cake.model.Users;
import com.tom.cake.service.TypeService;
import com.tom.cake.vo.TypeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/type")
@Controller
public class TypeController extends BaseController {

    @Autowired
    private TypeService typeService;

    @RequestMapping("/commodity_type")
    public ModelAndView commodity_type(Type type) {
        ModelAndView mv = new ModelAndView("commodity_type");
        List<TypeVo> byType = typeService.findByTypeId(type);
        List<TypeVo> typeVoList = typeService.findForChild();
        mv.addObject("typeVoList", typeVoList);
        mv.addObject("byType", byType);
        mv.addObject("title","商品分类");

        return mv;

    }

    @RequestMapping("/test_page")
    public String test_page() {
        return "testpage";
    }

    @RequestMapping("/type_list_page")
    @ResponseBody
    public ResultEntity<List<Type>> type_list_page(@RequestParam Integer limit, @RequestParam Integer page) {
        ResultEntity<List<Type>> result = new ResultEntity<>();
        Map<String, Object> map = new HashMap<>();
        map.put("start", (page - 1) * limit);
        map.put("end", limit);
        List<Type> allPage = typeService.findAllPage(map);
        result.setCount(typeService.findCount());
        result.setData(allPage);
        result.setCodeAndMsg(ResultEnum.SELECT_SUCCESS);
        return result;
    }

    @RequestMapping("/type_list_count")
    @ResponseBody
    public ResultEntity<Long> type_list_page() {
        ResultEntity<Long> result = new ResultEntity<>();
        Long count = typeService.findCount();
        result.setCodeAndMsg(ResultEnum.SELECT_SUCCESS);
        result.setData(count);
        return result;
    }


}
