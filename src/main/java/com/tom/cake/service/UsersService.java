package com.tom.cake.service;

import com.tom.cake.model.Users;

public interface UsersService {
    Users findOne(Users users);

    Users findByMail(Users users);

    Users findByMailAndPassword(Users users);
}
