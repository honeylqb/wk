package com.itheima.controller;

import com.itheima.domain.Account;
import com.itheima.service.AccountService;
import com.itheima.service.WheatImageService;
import com.itheima.utils.LayuiResult;
import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Title: AccountController
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/17 0017 10:06
 */
@Controller
@RequestMapping(path = "/wheatImageController")
public class WheatImageController {
    private static  final Logger logger = Logger.getLogger(WheatImageController.class);
    @Autowired
    private WheatImageService wheatImageService;


    @RequestMapping(path = "/findAll.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object findAll(Model model, HttpServletRequest request){
        logger.info("request:++++++++++++++++"+request);
        System.out.println("'wheatImageController.findAll.do入参:"+request);
        Map<String,Object> loginUserInfo = ( Map<String,Object>)request.getSession().getAttribute("loginUserInfo");
        Map<String,Object> map = new HashMap<>();
        map.put("userId", loginUserInfo.get("vid"));
        Object result = wheatImageService.findAll(map);
        System.out.println("list:"+result);
        model.addAttribute("list",result);

        return result;
    }


}
