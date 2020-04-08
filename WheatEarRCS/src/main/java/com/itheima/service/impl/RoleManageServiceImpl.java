package com.itheima.service.impl;

import com.itheima.dao.BaseDao;
import com.itheima.service.MenuManageService;
import com.itheima.service.RoleManageService;
import com.itheima.utils.LayuiResult;
import com.itheima.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.jsp.tagext.TryCatchFinally;
import java.util.*;

/**
 * @Title: AccountServiceImpl
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/17 0017 10:03
 */
@Service("roleManageService")
public class RoleManageServiceImpl implements RoleManageService {

    @Autowired
    private BaseDao baseDao;

    @Override
    public Object findAll(Map<String,Object> map) {
        System.out.println("业务层。。RoleManageServiceImpl.findAll");
        List<Map<String,Object>> list = baseDao.queryForList("RoleManageInfo.findAll",map);
        int count = baseDao.getTotalCount("RoleManageInfo.count",map);
        return  LayuiResult.ok(count, list);
    }


    @Override
    public Object addRole(Map<String,Object> map) {
        System.out.println("业务层。。RoleManageServiceImpl.addRole");
        map.put("vid", UUIDUtils.getId());
        System.out.println("业务层。。RoleManageServiceImpl.addRole"+map);
        int result = baseDao.insert("RoleManageInfo.addRole",map);

        List<String> roleMenuIdList = (List<String> )map.get("roleMenuId");
        System.out.println("roleMenuIdList"+roleMenuIdList.toString());
        List<Map<String,Object>> tempMapList = new ArrayList<>();
        for (String str :roleMenuIdList){
            Map<String,Object> tempMap = new HashMap<>();
            tempMap.put("vid", UUIDUtils.getId());
            tempMap.put("menuId", str);

            tempMapList.add(tempMap);
        }

        map.put("tempMapList",tempMapList);
        System.out.println("业务层。。RoleManageServiceImpl.addRoleMenu"+map);
        int result2 = baseDao.insert("RoleManageInfo.addRoleMenu",map);
        

        return  LayuiResult.ok();
    }

    @Override
    public Set<String> findRoleMenuById(Map<String,Object> map) {

        System.out.println("业务层。。RoleManageServiceImpl.findRoleMenuById"+map);
        List<Map<String, Object>> result = baseDao.queryForList("RoleManageInfo.findRoleMenuById",map);
        Map<String, Object> resultMap = new HashMap<>();
        Set<String> resultSet =  new HashSet<>();
        for(Map<String, Object> tempMap :result){
            resultSet.add((String)tempMap.get("menuId"));

        }


        return  resultSet;
    }

    @Override
    public Object updateRole(Map<String,Object> map) {

        System.out.println("业务层。。RoleManageServiceImpl.updateRole"+map);

        try {
            int result = baseDao.update("RoleManageInfo.updateRole",map);
            System.out.println("update:"+result);
        }catch (Exception e){
            e.printStackTrace();
        }




        //删除该角色的所有菜单信息
        int num = baseDao.delete("RoleManageInfo.deleteRoleMenu",map);
        System.out.println("删除了该角色的菜单"+num);

        List<String> roleMenuIdList = (List<String> )map.get("roleMenuId");
        System.out.println("roleMenuIdList"+roleMenuIdList.toString());

        List<Map<String,Object>> tempMapList = new ArrayList<>();
        if(roleMenuIdList.isEmpty()){
            return  LayuiResult.ok("更新成功");
        }

        for (String str :roleMenuIdList){
            Map<String,Object> tempMap = new HashMap<>();
            tempMap.put("vid", UUIDUtils.getId());
            tempMap.put("menuId", str);

            tempMapList.add(tempMap);
        }

        map.put("tempMapList",tempMapList);
        System.out.println("业务层。。RoleManageServiceImpl.addRoleMenu"+map);
        int result2 = baseDao.insert("RoleManageInfo.addRoleMenu",map);
        if(result2<0){
            LayuiResult.error();
        }
        return  LayuiResult.ok("更新成功");
    }

    @Override
    public List<Map<String,Object>> findRoleInfo(Map<String,Object> map) {
        System.out.println("业务层。。RoleManageServiceImpl.findRoleInfo");
        List<Map<String,Object>> list = baseDao.queryForList("RoleManageInfo.findAll",map);

        return  list;
    }


}
