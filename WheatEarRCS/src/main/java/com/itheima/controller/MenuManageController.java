package com.itheima.controller;

import com.itheima.service.MenuManageService;
import com.itheima.service.WheatImageService;
import com.itheima.utils.LayuiResult;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
@RequestMapping(path = "/MenuManageController")
public class MenuManageController {

    @Autowired
    private MenuManageService menuManageService;

    @RequestMapping(path = "/findAllMenu.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object findAllMenu(Model model, HttpServletRequest request){

        System.out.println("MenuManageController.findAllMenu.do入参");
        Object result = menuManageService.findAllMenu();
        System.out.println("MenuManageController.findAllMenu.do出参："+result.toString());
        return result;
    }

    @RequestMapping(path = "/findMenuTree.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object findMenuTree(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){

        System.out.println("MenuManageController.findAllMenu.do入参");
        Object result = menuManageService.findAllMenu();
        System.out.println("MenuManageController.findAllMenu.do出参："+result.toString());
        return result;
    }

    @RequestMapping(path = "/showMenuTree.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object showMenuTree(Model model, HttpServletRequest request){

        System.out.println("MenuManageController.showMenuTree.do入参");
        Object result = menuManageService.showMenuTree();
        request.getSession().setAttribute("menuList",result);
        System.out.println("MenuManageController.showMenuTree.do出参："+result.toString());

        return LayuiResult.ok();
    }

    @RequestMapping(path = "/addMenu.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object addMenu(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println("MenuManageController.addMenu.do map:sss"+map.toString());

        try {

        Map<String,Object> loginUserInfo = ( Map<String,Object>)request.getSession().getAttribute("loginUserInfo");
        map.put("userId", loginUserInfo.get("vid"));
        System.out.println("MenuManageController.addMenu.do map:"+map);

            Object    result = menuManageService.addMenu(map);
        }catch (Exception e){
            e.printStackTrace();
        }


        return LayuiResult.ok();

    }

    @RequestMapping(path = "/findMenuParentSelect.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object findMenuParentSelect(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println("MenuManageController.findMenuParentSelect.do map:sss"+map.toString());

        try {

            System.out.println("MenuManageController.findMenuParentSelect.do map:"+map);
            Map<String,Object> tempMap = new HashMap<>();
            tempMap.put("menuType", map.get("menuType"));


            Object    result = menuManageService.findMenuParentSelect(tempMap);
            return LayuiResult.ok(1,"成功",result);
        }catch (Exception e){
            e.printStackTrace();
            return LayuiResult.error();
        }




    }

    @RequestMapping(path = "/findMenuParentS.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object findMenuParentS(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println("MenuManageController.findMenuParentSelect.do map:sss"+map.toString());

        try {

            System.out.println("MenuManageController.findMenuParentS.do map:"+map);
            Map<String,Object> tempMap = new HashMap<>();
            tempMap.put("menuType", map.get("menuType"));


            Object    result = menuManageService.findMenuParentSelect(tempMap);
            map.put("MenuParentSelect",result);
            request.getSession().setAttribute("MenuEdit",map);
            return LayuiResult.ok(1,"成功",result);
        }catch (Exception e){
            e.printStackTrace();
            return LayuiResult.error();
        }




    }

    @RequestMapping(path = "/updateMenu.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object updateMenu(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println("MenuManageController.updateMenu.do map:sss"+map.toString());

        try {

            Map<String,Object> loginUserInfo = ( Map<String,Object>)request.getSession().getAttribute("loginUserInfo");
            map.put("userId", loginUserInfo.get("vid"));
            System.out.println("MenuManageController.updateMenu.do map:"+map);

            Object    result = menuManageService.updateMenu(map);
        }catch (Exception e){
            e.printStackTrace();
        }


        return LayuiResult.ok();

    }



}
