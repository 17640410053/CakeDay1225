package com.tom.cake.model;

import java.sql.Date;

public class Users {
    private Integer user_id;
    private String username;
    private String password;
    private String phone;
    private String mail;
    private Date birth;
    private Integer gender;
    private String image;
    private String token;
    private Date createTime;

    public Users() {
    }

    public Users(Integer user_id, String username, String password, String phone, String mail, Date birth, Integer gender, String image, String token, Date createTime) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.mail = mail;
        this.birth = birth;
        this.gender = gender;
        this.image = image;
        this.token = token;
        this.createTime = createTime;
    }

    public Users(Integer user_id, String username) {
        this.user_id = user_id;
        this.username = username;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
