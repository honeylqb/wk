package com.itheima.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @Title: HelloController
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2019/12/10 0010 14:59
 */
@Controller
@RequestMapping
public class HelloController {

    @RequestMapping(path = "/hello")
    public  String sayHello(){
        System.out.println("sayHello.....");
        return  "success";
    }
}
