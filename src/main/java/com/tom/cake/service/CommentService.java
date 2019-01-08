package com.tom.cake.service;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.model.Comment;
import com.tom.cake.vo.CommentVo;

import java.util.List;

public interface CommentService {

    ResultEntity<Integer> saveComment(Comment comment);

    CommentVo findCommentById(Comment comment);

    List<CommentVo> findByGoodsId(Comment comment);

    CommentVo findByGoodsIdAndOrderId(Comment comment);

    Comment findByCommentId(Comment comment);
}
