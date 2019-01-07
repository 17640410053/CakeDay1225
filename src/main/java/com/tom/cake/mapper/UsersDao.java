package com.tom.cake.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

import com.tom.cake.model.Users;

@Mapper
public interface UsersDao {
    int insert(@Param("pojo") Users pojo);

    int insertSelective(@Param("pojo") Users pojo);

    int insertList(@Param("pojos") List<Users> pojo);

    int update(@Param("pojo") Users pojo);

    Users selectOne(Users users);

    Users selectByMail(Users users);

    Users selectByMailAndPassword(Users users);

    void updateUsersInfo(Users users);
}
