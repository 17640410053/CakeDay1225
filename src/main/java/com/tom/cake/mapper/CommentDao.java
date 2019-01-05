package com.tom.cake.mapper;

import com.tom.cake.vo.CommentVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

import com.tom.cake.model.Comment;

@Mapper
public interface CommentDao {
    int insert(@Param("pojo") Comment pojo);

    int insertSelective(@Param("pojo") Comment pojo);

    int insertList(@Param("pojos") List<Comment> pojo);

    int update(@Param("pojo") Comment pojo);


    void insertComment(Comment comment);

    CommentVo selectCommentById(Comment comment);

    List<CommentVo> selectByGoodsId(Comment comment);
}
