package com.tom.cake.model;

import java.sql.Date;
import java.sql.Timestamp;

public class Comment {
    private Integer comm_id;
    private String content;
    private Integer user_id;
    private Integer goods_id;
    private Integer star;
    private String img;
    private Timestamp createTime;

    public Integer getComm_id() {
        return comm_id;
    }

    public void setComm_id(Integer comm_id) {
        this.comm_id = comm_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Integer goods_id) {
        this.goods_id = goods_id;
    }

    public Integer getStar() {
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
}
