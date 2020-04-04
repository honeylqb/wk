package cn.itheima.controller;

import cn.itheima.exception.SysException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Title: TestController
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/16 0016 10:09
 */
@Controller
@RequestMapping(path = "/Test")
public class TestController {

    @RequestMapping(path = "textException")
    public String textException() throws SysException {

        try {
            int i = 11/0;
        } catch (Exception e) {
            //
            e.printStackTrace();
            //抛出自定义异常信息
            throw new SysException("查询错误。。。");
        } finally {
        }
        return "";
    }
}
