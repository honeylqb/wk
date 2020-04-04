package cn.itheima.controller;



import cn.itheima.domian.Account;
import cn.itheima.domian.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Title: HelloController
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2019/12/30 0030 15:16
 */

/**
 * 属性：
 * value：用于指定请求的 URL。它和 path 属性的作用是一样的。
 * method：用于指定请求的方式。
 * params：用于指定限制请求参数的条件。它支持简单的表达式。要求请求参数的 key 和 value 必须和
 * 配置的一模一样。
 * 例如：
 * params = {"accountName"}，表示请求参数必须有 accountNamparams = {"moeny!100"}，表示请求参数中 money 不能是 100。
 * headers：用于指定限制请求消息头的条件。
 * 注意：
 * 以上四个属性只要出现 2 个或以上时，他们的关系是与的关系。
 */
@Controller
@RequestMapping(path = "/HelloController")
public class HelloController {

    @RequestMapping(path = "/sayHello")
    public String sayHello(){
        System.out.println("Hello Sping MVC");
        return "success";
    }
    @RequestMapping(path = "/form")
    public String form(Account account){
        System.out.println(account);
        return "success";
    }

    @RequestMapping(path = "/ajax")
    public @ResponseBody User  ajax(@RequestBody User user){
        System.out.println("ajax");
        System.out.println(user);
        user.setPassword("789");
        user.setUserName("lili");
        return user;
    }
}
