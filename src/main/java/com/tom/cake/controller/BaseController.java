package com.tom.cake.controller;

import com.tom.cake.model.Users;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;

@Controller
public class BaseController {

    public Users getUser(HttpSession session) {
        return (Users) session.getAttribute("user");
    }
}
