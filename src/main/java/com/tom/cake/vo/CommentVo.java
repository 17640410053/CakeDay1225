package com.tom.cake.vo;

import com.tom.cake.model.Comment;
import com.tom.cake.model.Goods;
import com.tom.cake.model.Users;

public class CommentVo extends Comment {
    private Goods goods;
    private Users users;

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }
}
