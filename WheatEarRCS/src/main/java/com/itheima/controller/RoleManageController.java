package com.itheima.controller;

import com.itheima.service.MenuManageService;
import com.itheima.service.RoleManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

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


}
