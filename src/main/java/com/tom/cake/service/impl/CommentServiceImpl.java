package com.tom.cake.service.impl;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.constant.ResultEnum;
import com.tom.cake.model.Comment;
import com.tom.cake.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

import com.tom.cake.mapper.CommentDao;

@Service
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentDao commentDao;

    public int insert(Comment pojo) {
        return commentDao.insert(pojo);
    }

    public int insertSelective(Comment pojo) {
        return commentDao.insertSelective(pojo);
    }

    public int insertList(List<Comment> pojos) {
        return commentDao.insertList(pojos);/**/
    }

    public int update(Comment pojo) {

        return commentDao.update(pojo);
    }

    @Override
    public ResultEntity<String> saveComment(Comment comment) {
        ResultEntity<String> result = new ResultEntity<>();
        try {
            commentDao.insertComment(comment);
            result.setCodeAndMsg(ResultEnum.INSERT_SUCCESS_MESS);
        } catch (Exception e) {
            e.printStackTrace();
            result.setCodeAndMsg(ResultEnum.INSERT_FAILED_MESS);
        }

        return result;


    }
}
