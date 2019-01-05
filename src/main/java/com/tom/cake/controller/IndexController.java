package com.tom.cake.controller;

import com.tom.cake.model.*;
import com.tom.cake.service.AddressService;
import com.tom.cake.service.CommentService;
import com.tom.cake.service.GoodsService;
import com.tom.cake.service.TypeService;
import com.tom.cake.vo.CommentVo;
import com.tom.cake.vo.TypeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {


    @Autowired
    private TypeService typeService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private CommentService commentService;

    /**
     * 主页
     *
     * @return
     */
    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("index");
        /**
         * 商品分类及具体分类
         */
        List<Type> typeList = typeService.findAll();
        /**
         * 蛋糕
         */
        Type type = new Type();
        type.setParent_id(1);
        List<Type> cakeType = typeService.findByParentId(type);

        /**
         * 吐司
         */
        type.setParent_id(2);
        List<Type> toastType = typeService.findByParentId(type);
        /**
         * 点心
         */
        type.setParent_id(3);
        List<Type> dessertType = typeService.findByParentId(type);
        /**
         * 糖果
         */
        type.setParent_id(4);
        List<Type> candiesType = typeService.findByParentId(type);

        mv.addObject("typeList", typeList);
        mv.addObject("cakeType", cakeType);
        mv.addObject("toastType", toastType);
        mv.addObject("dessertType", dessertType);
        mv.addObject("candiesType", candiesType);
        /**
         * 上面的可以省略了
         * 因为下面的包括了
         * 对啊，为什么要parentId呢，直接链表查询，parent_id=type_id就可以分别查出父分类及其他的子类
         * 然后封装到一个集合里面，遍历这个集合，就可以
         *对啊，一条一条的，但是我的resultMap对他进行了封装吖
         * 里面有个Collection集合，指向了vo里面的typeList，他就会把parent_id=type_id的条目存入这个typeList
         * 然后这个Vo类里面就是父分类，及其他的子分类集合
         */

        List<TypeVo> typeVoList = typeService.findForChild();

        mv.addObject("typeVoList", typeVoList);
        /**
         * 商品
         */
        Goods goods = new Goods();
        goods.setType_id(5);
        List<Goods> goodsList = goodsService.findByType(goods);

        goods.setType_id(6);
        List<Goods> goodsList2 = goodsService.findByType(goods);
        mv.addObject("goodsList", goodsList);
        mv.addObject("goodsList2", goodsList2);

        List<TypeVo> goodsListAll = typeService.findForGoods();
        mv.addObject("goodsListAll", goodsListAll);

        goods.setStar(8);
        List<Goods> byStar = goodsService.findByStar(goods);
        mv.addObject("byStar0", byStar.get(0));
        mv.addObject("byStar1", byStar.get(1));
        mv.addObject("byStar2", byStar.get(2));
        mv.addObject("byStar3", byStar.get(3));
        mv.addObject("byStar4", byStar.get(4));
        mv.addObject("byStar5", byStar.get(5));
        mv.addObject("byStar6", byStar.get(6));
        mv.addObject("byStar7", byStar.get(7));
        return mv;
    }

    @RequestMapping("/details")
    public ModelAndView details(Goods goods, HttpSession session) {
        ModelAndView mv = new ModelAndView("details");
        Users user = (Users) session.getAttribute("user");
        goods = goodsService.findByGoods(goods);
        goods.setStar(8);
        List<Goods> byStar = goodsService.findByStar(goods);
        if (user != null) {
            Address address = new Address();
            address.setUser_id(user.getUser_id());
            address = addressService.findByUsersId(address);
            mv.addObject("address", address);
        }
        //添加评论
        Comment comment = new Comment();
        comment.setGoods_id(goods.getGoods_id());
        List<CommentVo> commentVoList = commentService.findByGoodsId(comment);
        System.out.println("commentVoList.size：————————" + commentVoList.size());

        comment.setStar(5);
        List<CommentVo> goodCommentVoList = commentService.findByGoodsId(comment);
        comment.setStar(3);
        List<CommentVo> midCommentVoList = commentService.findByGoodsId(comment);
        comment.setStar(1);
        List<CommentVo> badCommentVoList = commentService.findByGoodsId(comment);
        //非空时，晒图功能查看
        comment.setStar(null);
        comment.setImg("test");
        List<CommentVo> imgCommentVoList = commentService.findByGoodsId(comment);

        mv.addObject("commentVoList", commentVoList);
        mv.addObject("goodCommentVoList", goodCommentVoList);
        mv.addObject("midCommentVoList", midCommentVoList);
        mv.addObject("badCommentVoList", badCommentVoList);
        mv.addObject("imgCommentVoList", imgCommentVoList);
        mv.addObject("byStar", byStar);
        mv.addObject("goods", goods);
        return mv;
    }

    @RequestMapping("/test")
    public ModelAndView test() {
        return new ModelAndView("test1");
    }

    @RequestMapping("/img_show")
    public String img_show() {
        return "img_show";
    }
}
