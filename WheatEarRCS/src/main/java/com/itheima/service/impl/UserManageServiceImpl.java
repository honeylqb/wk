package com.itheima.service.impl;

import com.itheima.dao.BaseDao;
import com.itheima.dao.UserManageDao;
import com.itheima.dao.WheatImageDao;
import com.itheima.domain.Account;
import com.itheima.service.UserManageService;
import com.itheima.service.WheatImageService;
import com.itheima.utils.LayuiResult;
import com.itheima.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service("userManageService")
public class UserManageServiceImpl implements UserManageService {
    @Autowired
    private BaseDao baseDao;
    @Override
    public Object findAll(Map<String,Object> map) {

        System.out.println("业务层。。UserManageServiceImpl.findAll");
        List<Map<String,Object>> list = baseDao.queryForList("UserManageDao.findAll",map);
        int count = baseDao.getTotalCount("UserManageDao.count",map);
        return  LayuiResult.ok(count, list);

    }

    @Override
    public List<Map<String,Object>> findUserByPassword(Map<String,Object> map) {
        System.out.println("业务层。。UserManageServiceImpl.findUserByPassword");
        List<Map<String,Object>> list  = baseDao.queryForList("UserManageDao.findUserByPassword",map);
        if(!list.isEmpty()){
            Map<String,Object>  userMap=   list.get(0);

            map.put("userId", userMap.get("vid"));
            List<Map<String,Object>> rolelist  = baseDao.queryForList("RoleManageInfo.findUserRoleByUserID",map);
            userMap.put("roleList",rolelist);
        }
        return list;


    }

    @Override
    public Object updateState(Map<String, Object> map) {

        int num = baseDao.update("UserManageDao.updateState",map);
        if(num>0){
            return  LayuiResult.ok("成功");
        }else{
            return  LayuiResult.error();
        }

    }

    public Object userRigister(Map<String,Object> map){


       map.put("vid", UUIDUtils.getId());
       int  num =  baseDao.insert("UserManageDao.userRigister",map );
       if(num>0){
           return  LayuiResult.ok("注册成功！");
       }else{
           return  LayuiResult.error();
       }
    }
}
