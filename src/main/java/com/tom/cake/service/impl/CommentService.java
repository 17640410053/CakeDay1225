package com.tom.cake.service.impl;

import com.tom.cake.model.Comment;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

import com.tom.cake.mapper.CommentDao;

@Service
public class CommentService{

    @Resource
    private CommentDao commentDao;

    public int insert(Comment pojo){
        return commentDao.insert(pojo);
    }

    public int insertSelective(Comment pojo){
        return commentDao.insertSelective(pojo);
    }

    public int insertList(List<Comment> pojos){
        return commentDao.insertList(pojos);
    }

    public int update(Comment pojo){
        return commentDao.update(pojo);
    }
}
