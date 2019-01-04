package com.tom.cake.service;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.model.Comment;

public interface CommentService {

    ResultEntity<String> saveComment(Comment comment);
}
