package com.itheima.controller;

import com.itheima.service.MenuManageService;
import com.itheima.service.RoleManageService;
import com.itheima.utils.LayuiResult;
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
import java.util.Set;

/**
 * @Title: AccountController
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/17 0017 10:06
 */
@Controller
@RequestMapping(path = "/RoleManageController")
public class RoleManageController {

    @Autowired
    private RoleManageService roleManageService;

    @RequestMapping(path = "/findAllRole.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
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

        String roleName = request.getParameter("roleName");
        if(roleName!=null && roleName.length()>0) {
            condition.put("roleName", roleName);
        }//end of if

        //用户输入条件2
        String roleCode = request.getParameter("roleCode");

        if(roleCode!=null && roleCode.length()>0) {
            condition.put("roleCode", request.getParameter("roleCode"));
        }//end of if

        System.out.println("condition:"+condition.toString());
        Object result = roleManageService.findAll(condition);
        System.out.println("RoleManageService.findAll.do出参："+result.toString());
        return result;
    }



    @RequestMapping(path = "/addRole.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object login(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println("RoleManageController.addRole.do map:"+map.toString());
        Map<String,Object> loginUserInfo = ( Map<String,Object>)request.getSession().getAttribute("loginUserInfo");
        map.put("userId", loginUserInfo.get("vid"));
        Object result = roleManageService.addRole(map);

        return result;

    }

    @RequestMapping(path = "/findRoleMenuById.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object findRoleMenuById(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println("RoleManageController.findRoleMenuById.do map:"+map.toString());
        Map<String,Object> loginUserInfo = ( Map<String,Object>)request.getSession().getAttribute("loginUserInfo");
        map.put("userId", loginUserInfo.get("vid"));

        Set<String> menuSet = roleManageService.findRoleMenuById(map);

        List<Map<String,Object>> menuList =  (List<Map<String,Object>>)request.getSession().getAttribute("menuList");
        if(menuList!=null){
            for(Map<String,Object> tempMap: menuList){
                if(menuSet.contains(tempMap.get("vid"))){
                    tempMap.put("checked", "true");
                }else{
                    tempMap.put("checked", "fa");
                }
                List<Map<String,Object>> childDataList = (List<Map<String,Object>>)tempMap.get("childData");
                if(!childDataList.isEmpty()){
                    for(Map<String,Object> teMap :childDataList){
                        if(menuSet.contains(teMap.get("vid"))){
                            teMap.put("checked", "true");
                        }else{
                            teMap.put("checked", "fa");
                        }
                    }
                }

            }
        }
        map.put("menuList",menuList);
        System.out.println("RoleManageController.findRoleMenuById出参"+map);
        request.getSession().setAttribute("roleEdit", map);

        return LayuiResult.ok();

    }

    @RequestMapping(path = "/updateRole.do",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public Object updateRole(Model model, HttpServletRequest request,@RequestBody HashMap<String, Object> map){
        System.out.println("RoleManageController.updateRole.do map:"+map.toString());
        Map<String,Object> loginUserInfo = ( Map<String,Object>)request.getSession().getAttribute("loginUserInfo");
        map.put("userId", loginUserInfo.get("vid"));
        Object result = roleManageService.updateRole(map);

        return result;

    }
}
