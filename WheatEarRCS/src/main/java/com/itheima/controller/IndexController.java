package com.itheima.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.itheima.service.MenuManageService;
import com.itheima.service.WheatImageService;
import com.itheima.utils.Constants;
import com.itheima.utils.CountUtil;
import com.itheima.utils.JedisPoolUtils;
import com.itheima.utils.LayuiResult;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import redis.clients.jedis.Jedis;

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
        ModelAndView mv = new ModelAndView();
        try{

            Jedis jedis =  JedisPoolUtils.getJedis();
            System.out.println("jedis"+jedis);
            if(jedis==null){
                Object list = menuManageService.showNavigation();
                System.out.println("list:"+list.toString());
                request.getSession().setAttribute(Constants.NavigationData,list);
                mv.addObject("errorMsg","sss");
                mv.setViewName("index");
                System.out.println("'IndexController.showIndex.do出:");
                return mv;
            }
            String jsonStr=jedis.get(Constants.NavigationData);

            if(null==jsonStr||"".equals(jsonStr)){
                Object list = menuManageService.showNavigation();
                System.out.println("list:"+list.toString());
                request.getSession().setAttribute(Constants.NavigationData,list);

                jsonStr= JSONArray.toJSONString(list);
                System.out.println(jsonStr);
                //将获取到的JSON格式的数据存入redis
                jedis.set(Constants.NavigationData, jsonStr);
                System.out.println("redis缓存中没有"+Constants.NavigationData+"数据");


            }else{
                System.out.println("redis缓存中有"+Constants.NavigationData+"数据"+jsonStr);

                request.getSession().setAttribute(Constants.NavigationData, JSON.parseObject(jsonStr,List.class));

                System.out.println(JSON.parseObject(jsonStr,List.class));
            }
            if(jedis!=null){
                JedisPoolUtils.closeJedis(jedis);
            }

            mv.addObject("errorMsg","sss");
            mv.setViewName("index");
            System.out.println("'IndexController.showIndex.do出:");
            System.out.println("--------------------------------");
            logger.info("IndexController.showIndex.do出");
            return mv;


        }catch (Exception e){
            e.printStackTrace();
            mv.setViewName("error");
            return mv;
        }

    }

    @RequestMapping(path = "/showCount.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object addUser(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
//        Map<String,Object> loginUserInfo = ( Map<String,Object>)request.getSession().getAttribute("loginUserInfo");
//        map.put("userId", loginUserInfo.get("vid"));

        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("onlineTotal", CountUtil.onlineTotal);

        return LayuiResult.ok(1, resultMap);
    }


}
