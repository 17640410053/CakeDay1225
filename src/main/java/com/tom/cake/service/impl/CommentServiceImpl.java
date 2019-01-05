package com.tom.cake.service.impl;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.constant.ResultEnum;
import com.tom.cake.model.Comment;
import com.tom.cake.service.CommentService;
import com.tom.cake.vo.CommentVo;
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
    public ResultEntity<Integer> saveComment(Comment comment) {
        ResultEntity<Integer> result = new ResultEntity<>();
        try {
            commentDao.insertComment(comment);
            System.out.println("comm_id----------------------" + comment.getComm_id());
            result.setCodeAndMsg(ResultEnum.INSERT_SUCCESS_MESS);
            result.setData(comment.getComm_id());
        } catch (Exception e) {
            e.printStackTrace();
            result.setCodeAndMsg(ResultEnum.INSERT_FAILED_MESS);
        }

        return result;


    }

    @Override
    public CommentVo findCommentById(Comment comment) {
        return commentDao.selectCommentById(comment);
    }

    @Override
    public List<CommentVo> findByGoodsId(Comment comment) {
        return commentDao.selectByGoodsId(comment);
    }
}
