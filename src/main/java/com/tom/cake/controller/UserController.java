package com.tom.cake.controller;

import com.bilibili.yl.util.MD5Utils;
import com.bilibili.yl.util.MailUtils;
import com.bilibili.yl.util.VerifyUtils;
import com.tom.cake.constant.ResultEntity;
import com.tom.cake.constant.ResultEnum;
import com.tom.cake.model.Users;
import com.tom.cake.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
public class UserController {

    @Autowired
    private UsersService usersService;


    @RequestMapping("/user/login")
    public String test() {
        return "login";
    }

    /**
     * 登录验证
     *
     * @param users
     * @param pnum
     * @param verify
     * @param session
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public ResultEntity<String> testLogin(Users users, String pnum, String verify, HttpSession session) {
        ResultEntity<String> result = new ResultEntity<>();
        if (users.getUsername() != null) {
            users.setPassword(MD5Utils.MD5Encode(users.getPassword(), "utf-8"));
            Users isExists = usersService.findOne(users);//用户名密码登录
            if (isExists != null) {
                result.setCodeAndMsg(ResultEnum.LOGIN_SUCCESS_MESS);
                session.setAttribute("user", isExists);
            } else {
                result.setCodeAndMsg(ResultEnum.LOGIN_FAILED_MESS);
            }
        } else {
            if (users.getPassword() == null) {
                Users isExists = usersService.findByMail(users);
                String code1 = (String) session.getAttribute("pnum");
                if (isExists != null) {
                    if (pnum.equals(code1)) {
                        result.setCodeAndMsg(ResultEnum.LOGIN_SUCCESS_MESS);
                        session.setAttribute("user", isExists);
                        session.removeAttribute("pnum");
                    } else {
                        result.setCodeAndMsg(ResultEnum.LOGIN_FAILED_MESS);
                    }
                } else {
                    result.setCodeAndMsg(ResultEnum.USER_NOT_FOUND);
                }
            } else {
                users.setPassword(MD5Utils.MD5Encode(users.getPassword(), "utf-8"));
                if (verify != null && !verify.equals("") && verify.equalsIgnoreCase(session.getAttribute("verify").toString())) {
                    Users isExists = usersService.findByMailAndPassword(users);//邮箱登录
                    if (isExists != null) {
                        result.setCodeAndMsg(ResultEnum.LOGIN_SUCCESS_MESS);
                        session.setAttribute("user", isExists);
                    } else {
                        result.setCodeAndMsg(ResultEnum.LOGIN_FAILED_MESS);
                    }
                } else {
                    result.setCodeAndMsg(ResultEnum.VERIFY_CODE_FAILED);
                }
            }
        }

        return result;
    }

    @RequestMapping(value = "/send", method = RequestMethod.POST)
    public ResultEntity<String> sendMail(HttpSession session, String mail) {

        ResultEntity<String> result = new ResultEntity<>();
        try {
            String code = MailUtils.createRandomNum(6);
            MailUtils util = new MailUtils("534889865@qq.com", "exqapugmptnkcacd", mail, "CakeDay1225", "欢迎你申请cake商城的账号，你的邮箱验证码为：" + code + "，千万不要告诉别人哟!");
            util.send();
            session.setAttribute("code", code);
            result.setCodeAndMsg(ResultEnum.MAIL_SEND_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            result.setCodeAndMsg(ResultEnum.MAIL_SEND_FAILED);
        }
        return result;
    }

    /**
     * 验证码
     *
     * @param response
     * @param session
     */
    @RequestMapping("/verifyCode")
    public void verifyCode(HttpServletResponse response, HttpSession session) {
        VerifyUtils verify = new VerifyUtils();
        BufferedImage image = verify.getImage();
        String text = verify.getText();
        session.setAttribute("verify", text);
        try {
            verify.output(image, response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/user/self_info")
    public ModelAndView self_info() {
        ModelAndView mv = new ModelAndView("self_info");
        mv.addObject("title","个人中心");
        return mv;
    }
}
