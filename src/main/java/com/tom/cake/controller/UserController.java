package com.tom.cake.controller;

import com.bilibili.yl.util.MD5Utils;
import com.bilibili.yl.util.MailUtils;
import com.bilibili.yl.util.VerifyUtils;
import com.tom.cake.constant.ResultEntity;
import com.tom.cake.constant.ResultEnum;
import com.tom.cake.model.Address;
import com.tom.cake.model.Users;
import com.tom.cake.service.AddressService;
import com.tom.cake.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class UserController extends BaseController {

    @Autowired
    private UsersService usersService;

    @Autowired
    private AddressService addressService;


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
            if (users.getPassword() == null) {//邮箱验证码登录
                Users isExists = usersService.findByMail(users);
                String code1 = (String) session.getAttribute("code");
                if (isExists != null) {
                    if (pnum.equals(code1)) {
                        result.setCodeAndMsg(ResultEnum.LOGIN_SUCCESS_MESS);
                        session.setAttribute("user", isExists);
                        session.removeAttribute("code");
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

    @ResponseBody
    @RequestMapping(value = "/send", method = RequestMethod.POST)
    public ResultEntity<String> sendMail(HttpSession session, String mail) {
        System.out.println("mail-----------" + mail);
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
    public ModelAndView self_info(HttpSession session) {
        ModelAndView mv = new ModelAndView("self_info");
        Users user = getUser(session);
        user = usersService.findOne(user);
        Address address = new Address();
        address.setUser_id(user.getUser_id());
        address = addressService.findByUsersId(address);
        mv.addObject("title", "个人中心");
        mv.addObject("user", user);
        mv.addObject("address", address);
        return mv;
    }

    @RequestMapping("/user/change_password")
    @ResponseBody
    public ResultEntity<String> change_password(@RequestParam(defaultValue = "") String oldPassword, @RequestParam(defaultValue = "") String newPassword, @RequestParam(defaultValue = "") String newPasswordConfirm, HttpSession session) {
        ResultEntity<String> result = new ResultEntity<>();
        Users user = getUser(session);
        System.out.println("sessionUserPassword:-----" + user.getPassword());
        if (MD5Utils.MD5Encode(oldPassword, "utf-8").equals(user.getPassword())) {
            if (newPassword.equals(newPasswordConfirm)) {
                user.setPassword(MD5Utils.MD5Encode(newPassword, "utf-8"));
                try {
                    usersService.modifyUsersInfo(user);
                    result.setCodeAndMsg(ResultEnum.UPDATE_SUCCESS_MESS);
                } catch (Exception e) {
                    e.printStackTrace();
                    result.setCodeAndMsg(ResultEnum.UPDATE_FAILED_MESS);
                }
            }
        } else {
            result.setCodeAndMsg(ResultEnum.PASSWORD_NOT_CORRECT);
        }

        return result;
    }

    @RequestMapping("/user/change_userImg")
    @ResponseBody
    public ResultEntity<String> change_userImg(MultipartFile file, HttpSession session) throws Exception {
        Users user = getUser(session);
        ResultEntity<String> result = new ResultEntity<>();
        System.out.println("fileName------" + file.getOriginalFilename());
        String path = session.getServletContext().getRealPath("img/userImg");
//        String path = "D:\\ProjectCollection\\Demo\\CakeDay1225\\src\\main\\webapp\\img\\userImg";
        /*
         * 因为部署到服务器就是这个目录，不会有你的项目目录的,这个前台访问的也是这个目录
         * 所有的运行都是运行在target里面的啊，java运行都是编译后文件啊
         * 跟你的代码目录没有任何关系
         * 如果你上传到项目目录，如果你不更新资源是永远不会有图片的
         * 也就是说，当你这个项目挂载到服务器的时候，是没有人帮你更新资源的，也就是说用户上传的图片永远不会显示,
         * 所以，为什么getRealPath是获取的输出目录，这样你就不需要更新资源，输出目录也会有东西
         * */
        System.out.println("path---------" + path);
        String uuid = UUID.randomUUID().toString().replace("-", "").toUpperCase();
        String typeName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String fileName = uuid + typeName;
        String realFileName = path + "/" + fileName;
        System.out.println("realName----------" + realFileName);
        file.transferTo(new File(realFileName));
        try {
            user.setImage(fileName);
            usersService.modifyUsersInfo(user);
            user = usersService.findOne(user);
            session.setAttribute("user", user);
            result.setCodeAndMsg(ResultEnum.UPLOAD_SUCCESS_MESS);
            result.setData(fileName);
        } catch (Exception e) {
            e.printStackTrace();
            result.setCodeAndMsg(ResultEnum.UPLOAD_FAILED_MESS);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/bindMail")
    public ResultEntity<String> bindMail(HttpSession session, String code) {
        ResultEntity<String> result = new ResultEntity<>();
        String sessionCode = (String) session.getAttribute("code");
        if (code.equals(sessionCode)) {
            result.setCodeAndMsg(ResultEnum.MAIL_BIND_SUCCESS);
            session.removeAttribute(code);
        } else {
            result.setCodeAndMsg(ResultEnum.VERIFY_CODE_FAILED);
        }
        return result;
    }


}
