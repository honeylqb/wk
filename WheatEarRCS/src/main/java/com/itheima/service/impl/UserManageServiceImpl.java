package com.itheima.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.itheima.dao.BaseDao;
import com.itheima.dao.UserManageDao;
import com.itheima.dao.WheatImageDao;
import com.itheima.domain.Account;
import com.itheima.service.UserManageService;
import com.itheima.service.WheatImageService;
import com.itheima.utils.LayuiResult;
import com.itheima.utils.UUIDUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;


@Service("userManageService")
public class UserManageServiceImpl implements UserManageService {
    private static  final Logger logger = Logger.getLogger(UserManageServiceImpl.class);
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
    public List<Map<String,Object>> findUserByPassword(Map<String,Object> map) throws Exception{
        System.out.println("业务层。。UserManageServiceImpl.findUserByPassword");
        List<Map<String,Object>> list  = baseDao.queryForList("UserManageDao.findUserByPassword",map);
        if(!list.isEmpty()){
            Map<String,Object>  userMap=   list.get(0);

            map.put("userId", userMap.get("vid"));
            List<Map<String,Object>> rolelist  = baseDao.queryForList("RoleManageInfo.findUserRoleByUserID",map);
            userMap.put("roleList",rolelist);
            if(!rolelist.isEmpty()){
                Map<String,Object> tempMap = new HashMap<>();
                tempMap.put("rolelist",rolelist);
                List<Map<String,Object>> Menulist  = baseDao.queryForList("RoleManageInfo.findUserMenuTree",tempMap);
                System.out.println("Menulist:"+Menulist);

                userMap.put("Menulist",Menulist);

                List<Map<String,Object>> userMenulist = new ArrayList<>();
                for(Map<String,Object> temp :Menulist){
                    if("-1".equals( temp.get("parentId"))){
                        String vid = (String)temp.get("vid");
                        List<Map<String,Object>> userMenuChildlist = new ArrayList<>();
                        for(Map<String,Object> tMap :Menulist){

                            if(vid.equals(tMap.get("parentId"))){
                                userMenuChildlist.add(tMap);
                            }
                        }
                        System.out.println("userMenuChildlist:"+userMenuChildlist);
                        temp.put("childData", userMenuChildlist);
                        userMenulist.add(temp);

                    }

                }

                userMap.put("menuList",userMenulist);

            }

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
    @Override
    public Object userRigister(Map<String,Object> map){
        int count = baseDao.getTotalCount("UserManageDao.findAccount",map);

        if(count>0){
            return  LayuiResult.error("该账号已存在！");
        }

       map.put("vid", UUIDUtils.getId());
       int  num =  baseDao.insert("UserManageDao.userRigister",map );
       if(num>0){
           return  LayuiResult.ok("注册成功！");
       }else{
           return  LayuiResult.error();
       }
    }

    @Override
    public Object reSetPassword(Map<String,Object> map){


        System.out.println("业务层。。UserManageServiceImpl.reSetPassword");
        int num = baseDao.update("UserManageDao.reSetPassword",map);
        if(num>0){
            return  LayuiResult.ok("修改成功");
        }else{
            return  LayuiResult.error();
        }
    }
    @Override
    public Object addloginLog(Map<String,Object> map){


        System.out.println("业务层。。UserManageServiceImpl.addloginLog");
        int num = baseDao.insert("UserLogDao.addUserLog",map);
        if(num>0){
            return  LayuiResult.ok("修改成功");
        }else{
            return  LayuiResult.error();
        }
    }

    @Override
    public Object findUserLoginLog(Map<String,Object> map){


        System.out.println("业务层。。UserManageServiceImpl.findUserLoginLog");
        List<Map<String,Object>> list = baseDao.queryForList("UserLogDao.findUserLoginLog",map);

        logger.info("list:++++++++++++++++"+list);
        int num = baseDao.getTotalCount("UserLogDao.countUserLoginLog",map);
        return LayuiResult.ok(num, list);

    }

    @Override
    public Object addUser(Map<String,Object> map){


        int count = baseDao.getTotalCount("UserManageDao.findAccount",map);

        if(count>0){
            return  LayuiResult.error("该账号已存在！");
        }
        map.put("vid", UUIDUtils.getId());

        try {
            int  num =  baseDao.insert("UserManageDao.addUser",map );
//            if(num>0){
//                return  LayuiResult.ok("添加成功！");
//            }else{
//                return  LayuiResult.error();
//            }
            //添加角色用户关系
            List<String> roleIdArrList = (List<String> )map.get("roleIdArr");
            System.out.println("roleIdArrList"+roleIdArrList.toString());
            List<Map<String,Object>> tempMapList = new ArrayList<>();
            for (String str :roleIdArrList){
                Map<String,Object> tempMap = new HashMap<>();
                tempMap.put("vid", UUIDUtils.getId());
                tempMap.put("roleId", str);

                tempMapList.add(tempMap);
            }

            map.put("tempMapList",tempMapList);
            System.out.println("业务层。。UserManageDao.addUserRole"+map);
            int result2 = baseDao.insert("UserManageDao.addUserRole",map);

            System.out.println("业务层。。UserManageDao.addUserRole插入用户角色关系"+result2);
            return  LayuiResult.ok("添加成功！");
        }catch (Exception e){
            e.printStackTrace();
            return  LayuiResult.error();
        }


    }

    @Override
    public Set<String> findUserRoleById(Map<String,Object> map) {

        System.out.println("业务层。。UserManageDao.findUserRoleById"+map);
        List<Map<String, Object>> result = baseDao.queryForList("UserManageDao.findUserRoleById",map);
        Map<String, Object> resultMap = new HashMap<>();
        Set<String> resultSet =  new HashSet<>();
        for(Map<String, Object> tempMap :result){
            resultSet.add((String)tempMap.get("roleId"));

        }


        return  resultSet;
    }

    @Override
    public Object updateUser(Map<String,Object> map) {

        System.out.println("业务层。。UserManageServiceImpl.updateUser"+map);

        try {
            int result = baseDao.update("UserManageDao.updateUser",map);
            System.out.println("update:"+result);
        }catch (Exception e){
            e.printStackTrace();
        }




        //删除该角色的所有菜单信息
        int num = baseDao.delete("UserManageDao.deleteUserRole",map);
        System.out.println("删除了该用户的角色信息"+num);

        List<String> roleIdArr = (List<String> )map.get("roleIdArr");
        System.out.println("roleIdArr"+roleIdArr.toString());

        List<Map<String,Object>> tempMapList = new ArrayList<>();
        if(roleIdArr.isEmpty()){
            return  LayuiResult.ok("更新成功");
        }

        for (String str :roleIdArr){
            Map<String,Object> tempMap = new HashMap<>();
            tempMap.put("vid", UUIDUtils.getId());
            tempMap.put("roleId", str);

            tempMapList.add(tempMap);
        }

        try {
            map.put("tempMapList",tempMapList);
            System.out.println("业务层。。UserManageServiceImpl.addUserRole"+map);
            int result2 = baseDao.insert("UserManageDao.addUserRole",map);
            if(result2<0){
                LayuiResult.error();
            }

        }catch (Exception e){
            e.printStackTrace();
            LayuiResult.error();
        }
        return  LayuiResult.ok("更新成功");
    }

}
