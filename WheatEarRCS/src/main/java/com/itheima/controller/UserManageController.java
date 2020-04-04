package com.itheima.controller;

import com.itheima.service.MenuManageService;
import com.itheima.service.UserManageService;
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
import javax.servlet.http.HttpServletResponse;
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
@RequestMapping(path = "/UserManageController")
public class UserManageController {
    private static  final Logger logger = Logger.getLogger(UserManageController.class);
    @Autowired
    private UserManageService userManageService;

    @Autowired
    private MenuManageService menuManageService;


    @RequestMapping(path = "/findAll.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object findAll(Model model, HttpServletRequest request){
        Map<String,Object> condition = new HashMap<>();
        int page = Integer.parseInt(request.getParameter("page"));
        int limit = Integer.parseInt(request.getParameter("limit"));
        condition.put("start", (page - 1) * limit);

        condition.put("limit", limit);

        //用户输入条件1
        Map<String,Object> searchParams = request.getParameterMap();

        if(!searchParams.isEmpty()){
            System.out.println("searchParams:"+searchParams.toString());
        }

        String userName = request.getParameter("userName");
        if(userName!=null && userName.length()>0) {
            condition.put("userName", userName);
        }//end of if

        //用户输入条件2
        String userAccount = request.getParameter("userAccount");

        if(userAccount!=null && userAccount.length()>0) {
            condition.put("userAccount", request.getParameter("userAccount"));
        }//end of if

        //用户输入条件2
        String sex = request.getParameter("sex");

        if(sex!=null && sex.length()>0) {
            condition.put("sex", request.getParameter("sex"));
        }//end of if

        System.out.println("condition:"+condition.toString());
        Object result = userManageService.findAll(condition);

        System.out.println("UserManageController.findAll.do出参："+result.toString());
        return result;
    }

    @RequestMapping(path = "/userLogin.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object login(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println(map.toString());
        List<Map<String,Object>> list = userManageService.findUserByPassword(map);
        if(list.isEmpty()){
            return LayuiResult.error("用户名或密码错误");
        }else{
            Map<String,Object> loginUserInfo = list.get(0);
            System.out.println("登录用户信息："+loginUserInfo.toString());
            model.addAttribute("loginUserInfo",loginUserInfo);
            request.getSession().setAttribute("loginUserInfo", loginUserInfo);

            Object result = menuManageService.showMenuTree();
            request.getSession().setAttribute("menuList",result);

            Object navigationList = menuManageService.showNavigation();
            request.getSession().setAttribute("NavigationData",navigationList);

            return LayuiResult.ok(1,"登录成功",list);
        }

    }

    @RequestMapping(path = "/updateState.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object updateState(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println(map.toString());

        Object result = userManageService.updateState(map);

        System.out.println("UserManageController.findAll.do出参："+result.toString());
        return result;

    }

    @RequestMapping(path = "/loginExit.do")
    public Object  loginExit(HttpServletRequest request,HttpServletResponse response) throws  Exception{
        System.out.println("UserManageController.loginExit.doru参：");
        request.getSession().invalidate();
        //request.getRequestDispatcher("/index.jsp").forward(request, response);
        //response.sendRedirect(request.getContextPath()+"/index.jsp");

        System.out.println("UserManageController.loginExit.do出参：");

        return "redirect:/IndexController/showIndex.do";
    }

    @RequestMapping(path = "/userRigister.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object userRigister(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println(map.toString());

        Object result = userManageService.userRigister(map);

        return result;
    }

}
