package com.itheima.controller;

import com.itheima.service.MenuManageService;
import com.itheima.service.RoleManageService;
import com.itheima.service.UserManageService;
import com.itheima.service.WheatImageService;
import com.itheima.utils.ClientInfo;
import com.itheima.utils.CountUtil;
import com.itheima.utils.LayuiResult;
import com.itheima.utils.UUIDUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

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

    @Autowired
    private RoleManageService roleManageService;


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

        List<Map<String,Object>> roleInfo = roleManageService.findRoleInfo(condition);
        request.getSession().setAttribute("roleInfo",roleInfo);
        System.out.println("UserManageController.findAll.do出参："+result.toString());
        return result;
    }

    @RequestMapping(path = "/userLogin.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object login(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println(map.toString());
        List<Map<String,Object>> list =null;
        try {
             list = userManageService.findUserByPassword(map);
        }catch (Exception e){
            e.printStackTrace();
        }

        if(list.isEmpty()){
            return LayuiResult.error("用户名或密码错误");
        }else{
            Map<String,Object> loginUserInfo = list.get(0);


            if("1".equals(loginUserInfo.get("userState"))){
                return LayuiResult.error("该用户被禁用，无法登陆！");
            }
            System.out.println("登录用户信息："+loginUserInfo.toString());
            model.addAttribute("loginUserInfo",loginUserInfo);
            request.getSession().setAttribute("loginUserInfo", loginUserInfo);

            System.out.println("登录总人数+"+CountUtil.addLoginTotal());
            //查找该用户所对应的权限
//            Object result = menuManageService.showMenuTree();
//            request.getSession().setAttribute("menuList",result);

            //Object result = menuManageService.findUserMenuTree(loginUserInfo);


            Object navigationList = menuManageService.showNavigation();
            request.getSession().setAttribute("NavigationData",navigationList);

            Map<String,Object> logMap  = ClientInfo.getClientInfo(request.getHeader("user-agent"));


            //获取IP
            String remoteAddr = request.getRemoteAddr();
            String forwarded = request.getHeader("X-Forwarded-For");
            String realIp = request.getHeader("X-Real-IP");

            String ip = null;
            if (realIp == null) {
                if (forwarded == null) {
                    ip = remoteAddr;
                } else {
                    ip = remoteAddr + "/" + forwarded.split(",")[0];
                }
            } else {
                if (realIp.equals(forwarded)) {
                    ip = realIp;
                } else {
                    if(forwarded != null){
                        forwarded = forwarded.split(",")[0];
                    }
                    ip = realIp + "/" + forwarded;
                }
            }
            logMap.put("loginIp",ip);
            logMap.put("loginPort",request.getRemotePort());    //端口
            logMap.put("vid", UUIDUtils.getId());
            logMap.put("userId", loginUserInfo.get("vid"));
            userManageService.addloginLog(logMap);
            System.out.println("loginIp"+ip);
            System.out.println("loginPort"+request.getRemotePort());
            System.out.println("sessionId"+request.getSession().getId());






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

    @RequestMapping(path = "/reSetPassword.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object reSetPassword(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println(map.toString());
        Map<String,Object> loginUserInfo = (Map<String,Object>)  request.getSession().getAttribute("loginUserInfo");
        if(loginUserInfo == null){
            return LayuiResult.error("登录信息已经失效！");
        }

        if(map.containsKey("oldPassword")){
            if(!map.get("oldPassword").equals(loginUserInfo.get("userPassword"))){
                return LayuiResult.error("旧密码输入错误！！！");
            }
        }
        System.out.println("---------------------");
        map.put("vid", loginUserInfo.get("vid"));
        Object result = userManageService.reSetPassword(map);

        return result;
    }


    @RequestMapping(path = "/findUserLoginLog.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object findUserLoginLog(Model model, HttpServletRequest request){
//        try {

            System.out.println("wheatImageController.findAll.do");
            Map<String,Object> condition = new HashMap<>();
            int page = Integer.parseInt(request.getParameter("page"));
            int limit = Integer.parseInt(request.getParameter("limit"));
            condition.put("start", (page - 1) * limit);

            condition.put("limit", limit);
            Map<String,Object> loginUserInfo = ( Map<String,Object>)request.getSession().getAttribute("loginUserInfo");
            condition.put("userId", loginUserInfo.get("vid"));
            System.out.println("condition:"+condition.toString());
            Object result = userManageService.findUserLoginLog(condition);



            return result;
//        }catch (Exception e){
//            e.printStackTrace();
//            return LayuiResult.error();
//        }


    }

    @RequestMapping(path = "/addUser.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object addUser(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println("/addUser.do"+map.toString());
        Map<String,Object> loginUserInfo = ( Map<String,Object>)request.getSession().getAttribute("loginUserInfo");
        map.put("userId", loginUserInfo.get("vid"));
        Object result = userManageService.addUser(map);

        return result;
    }

    @RequestMapping(path = "/findUserRoleById.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object findUserRoleById(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println("UserManageController.findUserRoleById.do map:"+map.toString());
        Map<String,Object> loginUserInfo = ( Map<String,Object>)request.getSession().getAttribute("loginUserInfo");
        map.put("userId", loginUserInfo.get("vid"));

        Set<String> RoleSet = userManageService.findUserRoleById(map);

        List<Map<String,Object>> roleInfo =  (List<Map<String,Object>>)request.getSession().getAttribute("roleInfo");
        if(roleInfo!=null){
            for(Map<String,Object> tempMap: roleInfo){
                if(RoleSet.contains(tempMap.get("vid"))){
                    tempMap.put("checked", "true");
                }else{
                    tempMap.put("checked", "fa");
                }
        }
        }
        map.put("roleInfo",roleInfo);
        System.out.println("RoleManageController.findUserRoleById"+map);
        request.getSession().setAttribute("userRoleEdit", map);

        return LayuiResult.ok();

    }

    @RequestMapping(path = "/updateUser.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object updateUser(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println("UserManageController.updateUser.do map:"+map.toString());
        Map<String,Object> loginUserInfo = ( Map<String,Object>)request.getSession().getAttribute("loginUserInfo");
        map.put("userId", loginUserInfo.get("vid"));
        Object result = userManageService.updateUser(map);

        return result;

    }

    @RequestMapping(path = "/findUserMenuList.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object findUserMenuList(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        Object result = menuManageService.showMenuTree();
        request.getSession().setAttribute("menuList",result);

        return LayuiResult.ok();

    }

    @RequestMapping(path = "/updateUserInfo.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object updateUserInfo(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
       try {
           System.out.println(map.toString());

           Object result = userManageService.updateUserInfo(map);

           System.out.println("UserManageController.updateUserInfo.do出参："+result.toString());
           return result;


       }catch (Exception e){
           e.printStackTrace();
           return LayuiResult.error();
       }

    }

}
