package com.itheima.service.impl;

import com.itheima.dao.BaseDao;
import com.itheima.dao.WheatImageDao;
import com.itheima.domain.Account;
import com.itheima.service.MenuManageService;
import com.itheima.service.WheatImageService;
import com.itheima.utils.LayuiResult;
import com.itheima.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Title: AccountServiceImpl
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/17 0017 10:03
 */
@Service("menuManageService")
public class MenuManageServiceImpl implements MenuManageService {

    @Autowired
    private BaseDao baseDao;

    @Override
    public Object findAllMenu() {
        System.out.println("业务层。。MenuManageServiceImpl.findAll");
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list = baseDao.queryForList("MenuManageInfo.findAll",map);

        int count = baseDao.getTotalCount("MenuManageInfo.MenuAllcount",map);
        return  LayuiResult.ok(count, list);
    }

    @Override
    public Object showMenuTree() {
        System.out.println("业务层。。MenuManageServiceImpl.showMenuTree");
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("parentId","-1");
        map.put("menuType","2");
        List<Map<String,Object>> parentlist = baseDao.queryForList("MenuManageInfo.findParentOrChild",map);
        if(!parentlist.isEmpty()){
            for (Map<String,Object> parentMap :parentlist){
                String parentId =  (String)parentMap.get("vid");
                map.put("parentId",parentId);
                map.put("menuType","");
                List<Map<String,Object>> Childlist = baseDao.queryForList("MenuManageInfo.findParentOrChild",map);
                parentMap.put("childData",Childlist);
            }
        }

        return parentlist;
    }

    @Override
    public Object showNavigation() {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("parentId","1111");
        map.put("menuType","1");
        List<Map<String,Object>> parentlist = baseDao.queryForList("MenuManageInfo.findParentOrChild",map);
        if(!parentlist.isEmpty()){
            for (Map<String,Object> parentMap :parentlist){
                String parentId =  (String)parentMap.get("vid");
                map.put("parentId",parentId);
                List<Map<String,Object>> Childlist = baseDao.queryForList("MenuManageInfo.findParentOrChild",map);
                parentMap.put("childData",Childlist);
            }
        }
        return parentlist;
    }

    @Override
    public Object findUserMenuTree(Map<String,Object> map) {


        return null;
    }

    @Override
    public Object addMenu(Map<String,Object> map) {
        System.out.println("业务层。。MenuManageServiceImpl.addMenu--入map"+map);
        map.put("vid", UUIDUtils.getId());
       int num =  baseDao.insert("MenuManageInfo.addMenu",map);
       if(num>0){
           return LayuiResult.ok();
       }else{
           return LayuiResult.error();
       }

    }
    @Override
    public Object findMenuParentSelect(Map<String,Object> map) {
        System.out.println("业务层。。MenuManageServiceImpl.findMenuParentSelect--入map"+map);

        List<Map<String, Object>> result =  baseDao.queryForList("MenuManageInfo.findMenuParentSelect",map);
        System.out.println("业务层。。MenuManageServiceImpl.findMenuParentSelect--出参"+result);
        return result;
    }

    @Override
    public Object updateMenu(Map<String,Object> map) {
        System.out.println("业务层。。MenuManageServiceImpl.updateMenu--入map"+map);
        int num =  baseDao.update("MenuManageInfo.updateMenu",map);
        if(num>0){
            return LayuiResult.ok();
        }else{
            return LayuiResult.error();
        }

    }


}
