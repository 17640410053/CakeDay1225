package com.tom.cake.controller;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.constant.ResultEnum;
import com.tom.cake.model.Comment;
import com.tom.cake.model.Goods;
import com.tom.cake.model.Users;
import com.tom.cake.service.CommentService;
import com.tom.cake.vo.CommentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;

@Controller
public class CommentController extends BaseController {


    @Autowired
    private CommentService commentService;


    @RequestMapping("/upload")
    @ResponseBody
    public ResultEntity<String> upload(MultipartFile file) {
        ResultEntity<String> result = new ResultEntity<>();
        System.out.println(file.getOriginalFilename());
        result.setCodeAndMsg(ResultEnum.UPLOAD_SUCCESS_MESS);
        return result;
    }

    @RequestMapping("/upload_file_test")
    public String upload() {
        return "upload_file_test";
    }

    /**
     * 多文件上传
     * 上传的过程中：jsp页面是网上的，多文件上传的方法也是网上的，但是网上的内容有错误，
     * 因为被注释的内容是不正确的，File file2 = new File(savePath, newName);一直提示这一行找不到系统路径，
     * 然后一步步的调，看之前项目可以上传的方法与这个方法进行对比，这个改成
     * String savePath = path + newName;
     * System.out.println(savePath);
     * file[i].transferTo(new File(savePath));
     * <p>
     * TODO 如何实现直接获得项目的根路径？？？
     * 之前的获得根路径的方法失效了
     *
     * @param file
     * @param session
     * @param request
     * @return
     * @throws Exception
     */

    @RequestMapping("/fileUploadFiles")
    @ResponseBody
    //此处用@RequestParam（"xx"）来指定参数名，不加会报错
    public ResultEntity<String> uploadFiles(@RequestParam(value = "file", required = false) CommonsMultipartFile file[], Goods goods, HttpSession session, HttpServletRequest request) throws Exception {
        ResultEntity<String> result = new ResultEntity<>();
        StringBuffer stringBuffer = new StringBuffer();
        System.out.println(file.length);
        System.out.println("getGoods_id-----------" + goods.getGoods_id());
        try {
            for (int i = 0; i < file.length; i++) {
                if (!file[i].isEmpty()) {
//                    String path = request.getSession().getServletContext().getRealPath("/upload");
                    String path = session.getServletContext().getRealPath("/upload");  //获取本地存储路径

//                    String path = "D:/MultipartFile";
//                    String path = "D:\\ProjectCollection\\Demo\\CakeDay1225\\src\\main\\webapp\\upload/";

                    String fileName = file[i].getOriginalFilename();
                    String fileType = fileName.substring(fileName.lastIndexOf(".")); //获取后缀名
                    String newName = new Date().getTime() + fileType;
//                    File file2 = new File(savePath, newName); //新建一个文件
                    String savePath = path + newName;
                    stringBuffer.append(newName);//拼接文件名
                    System.out.println(savePath);
                    file[i].transferTo(new File(savePath));
                }
            }

            result.setCodeAndMsg(ResultEnum.UPLOAD_SUCCESS_MESS);
//            System.out.println("stringBuffer  ----------"+stringBuffer);
            result.setData(stringBuffer.toString());
        } catch (Exception e) {
            e.printStackTrace();
            result.setCodeAndMsg(ResultEnum.UPLOAD_FAILED_MESS);
        }


        return result;
    }


    /**
     * 提交评论,先查询，
     * <p>
     * 就是图片上传和评论提交功能分开的？？？
     * <p>
     * 阳光倾城 2019/1/4 18:25:12
     * 该怎么合并成一个评论里面
     * <p>
     * bilibili丶教主 2019/1/4 18:25:37
     * 上传了不是有个图片名字吗
     * <p>
     * 阳光倾城 2019/1/4 18:25:42
     * 嗯嗯
     * <p>
     * 阳光倾城 2019/1/4 18:25:45
     * 有呢
     * <p>
     * 阳光倾城 2019/1/4 18:25:49
     * 哦哦，懂了
     * <p>
     * 阳光倾城 2019/1/4 18:25:54
     * 传回去？
     * <p>
     * bilibili丶教主 2019/1/4 18:26:00
     * 把名字给后台
     * <p>
     * bilibili丶教主 2019/1/4 18:26:01
     * 对呢
     * <p>
     * 阳光倾城 2019/1/4 18:26:11
     * 给前台？
     * <p>
     * bilibili丶教主 2019/1/4 18:26:40
     * 对呢，前台拿到名字再给后台
     * <p>
     * 阳光倾城 2019/1/4 18:26:49
     * 好咧
     * <p>
     * bilibili丶教主 2019/1/4 18:26:51
     * layui上传不是ajax嘛
     * <p>
     * 阳光倾城 2019/1/4 18:26:53
     * 谢谢大教主
     * <p>
     * 阳光倾城 2019/1/4 18:26:55
     * 嗯呢
     * <p>
     * 阳光倾城 2019/1/4 18:26:56
     * 是呢
     * <p>
     * bilibili丶教主 2019/1/4 18:26:57
     * 可以返回图片名字的
     * <p>
     * 阳光倾城 2019/1/4 18:27:04
     * 好咧
     * <p>
     * bilibili丶教主 2019/1/4 18:27:08
     * 嘿嘿
     */


    @RequestMapping("/submit_comment")
    @ResponseBody
    public ResultEntity<Integer> submit_comment(Comment comment, HttpSession session) throws StringIndexOutOfBoundsException {
        Users user = getUser(session);
        comment.setUser_id(user.getUser_id());
        System.out.println("comment.getImg()---------" + comment.getImg());
        if (comment.getImg() != null && !comment.getImg().equals("")) {
            comment.setImg(comment.getImg().substring(0, comment.getImg().length() - 1));
        }
        System.out.println("comm_id----------------------test" + comment.getComm_id());
        return commentService.saveComment(comment);
    }


    @RequestMapping("/test_success")
    public ModelAndView test_success(Comment comment) {
        ModelAndView mv = new ModelAndView("comment_success");
        mv.addObject("comment", comment);
        return mv;
    }

    @RequestMapping("/comment/comment_show")
    public ModelAndView comment_show(Comment comment) {
        ModelAndView mv = new ModelAndView("comment_show");
        CommentVo commentVo = commentService.findCommentById(comment);
        mv.addObject("commentVo", commentVo);
        return mv;
    }

}
