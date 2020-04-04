package com.itheima.controller;

import com.itheima.service.MenuManageService;
import com.itheima.service.WheatImageService;
import com.itheima.utils.LayuiResult;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
@RequestMapping(path = "/IndexController")
public class IndexController {
    private static  final Logger logger = Logger.getLogger(IndexController.class);
    @Autowired
    private WheatImageService wheatImageService;


    @Autowired
    private MenuManageService menuManageService;

    @RequestMapping(path = "/showIndex.do")
    @ResponseBody
    public ModelAndView showIndex(Model model, HttpServletRequest request){

        System.out.println("'IndexController.showIndex.do入参:");
        Object list = menuManageService.showNavigation();
        System.out.println("list:"+list.toString());
        request.getSession().setAttribute("NavigationData",list);
        ModelAndView mv = new ModelAndView();
        mv.addObject("errorMsg","sss");
        mv.setViewName("index");
        System.out.println("'IndexController.showIndex.do出:");
        return mv;
    }


}
