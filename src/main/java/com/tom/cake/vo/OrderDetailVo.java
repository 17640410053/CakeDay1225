package com.tom.cake.vo;

import com.tom.cake.model.Goods;
import com.tom.cake.model.OrderDetail;
import com.tom.cake.model.OrderTable;

import java.util.List;

public class OrderDetailVo extends OrderDetail {
    //那这个地方的意思是OrderDetail对应的商品信息，对应的肯定只有一个啊,不懂》、？
    private Goods goods;

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    /*
     * orderTable {
     *   orderDetails [
     *       orderDetail {
     *           goods
     *       },
     *       orderDetail {
     *           goods
     *      },
     *       orderDetail {
     *           goods
     *      }
     *   ]
     * }
     * 这样还不懂？懂了好像对啊
     * 就是在它这先搞一层封装？去个厕所，你先看一下，我也去一下，思考一下
     *
     * */
}
